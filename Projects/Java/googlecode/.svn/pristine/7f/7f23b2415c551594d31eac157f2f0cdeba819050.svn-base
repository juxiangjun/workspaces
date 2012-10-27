package org.tju.ebs.handler.system;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.tju.ebs.bean.SysMenu;
import org.tju.ebs.bean.SysParam;
import org.tju.ebs.domain.service.IAppInitialService;
import org.tju.ebs.handler.BaseHandler;
import org.tju.ebs.utils.StringUtil;

public class SysParamHandler extends BaseHandler {
	
	private final IAppInitialService service = (IAppInitialService) this
			.getBean(IAppInitialService.SERVICE_NAME, request);

	public SysParamHandler(HttpServletRequest request,
			HttpServletResponse response) {
		super(request, response);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void doQuery(String type, int pageNo, int pageSize, String filter) {
		// TODO Auto-generated method stub
		if (type.equals("getSysParamList")) {
			this.getSysParamList();
		}
	}
	
	private void getSysParamList() {
		List<SysParam> list = this.service.getSysParams(null);
		this.response(true, "", list.size(), StringUtil.toJson(list));
	}

}
