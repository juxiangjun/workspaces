package org.tju.ebs.handler.system;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.tju.ebs.bean.SysCountry;
import org.tju.ebs.domain.service.ISysCountryService;
import org.tju.ebs.handler.BaseHandler;
import org.tju.ebs.handler.IBaseHandler;
import org.tju.ebs.utils.StringUtil;

public class SysCountryHandler extends BaseHandler implements IBaseHandler {

	private ISysCountryService iSysCountryService = (ISysCountryService) this
			.getBean(ISysCountryService.SERVICE_NAME, request);

	public SysCountryHandler(HttpServletRequest request,
			HttpServletResponse response) {
		super(request, response);
	}

	public void delete() {

	}

	public void save() {
	}

	@Override
	public void doQuery(String type, int pageNo, int pageSize, String filter) {
		if (type.equals("getSysCountryList")) {
			this.getSysCountryList(pageNo, pageSize, filter);
		}
	}

	@SuppressWarnings("unchecked")
	private void getSysCountryList(int pageNo, int pageSize, String filter) {
		Map<String, Object> map = null;
		
		if (StringUtil.isNull(filter)) {
			map = this.iSysCountryService.getSysCountryList(pageNo, pageSize);
		} else {
			map = this.iSysCountryService.getSysCountryListByFilter(pageNo, pageSize, filter);
		}
		
		List<SysCountry> list = (List<SysCountry>) map.get("list");
		
		Long count = (Long) map.get("count");
		
		this.response(true, "", count.intValue(), StringUtil.toJson(list));
	}

}
