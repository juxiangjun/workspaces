package org.tju.ebs.handler.system;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.SysObject;
import org.tju.ebs.bean.SysObjectProperty;
import org.tju.ebs.domain.service.IAppInitialService;
import org.tju.ebs.domain.service.ISysObjectService;
import org.tju.ebs.handler.BaseHandler;
import org.tju.ebs.handler.IBaseHandler;
import org.tju.ebs.utils.StringUtil;

public class SysObjectHandler extends BaseHandler implements IBaseHandler {

	private static final Logger log = LoggerFactory
			.getLogger(SysObjectHandler.class);

	private IAppInitialService service = (IAppInitialService) this
			.getBean(IAppInitialService.SERVICE_NAME, request);;;

	public SysObjectHandler(HttpServletRequest request,
			HttpServletResponse response) {
		super(request, response);
	}

	public void delete() {
	}

	public void save() {

	}

	public void doQuery(String type, int pageNo, int pageSize, String filter) {
		if (type.equals("getSysObjectList")) {
			this.getSysObjectList();
		} else if (type.equals("getSysObjectPropertyList")) {
			this.getSysObjectPropertyList();
		} else if (type.equals("getDefaultColumns")) {
			this.getDefaultColumns();
		}
	}

	private void getSysObjectList() {
		List<SysObject> list = this.service.getSysObjectList();
		String json = StringUtil.toJson(list);
		this.response(true, "", list.size(), json);
	}

	private void getSysObjectPropertyList() {
		List<SysObjectProperty> list = this.service
				.getSysObjectPropertyList();
		String json = StringUtil.toJson(list);
		this.response(true, "", list.size(), json);
	}

	private void getDefaultColumns() {
		try {
			this.response.sendRedirect("/ebs/defaultColumns.json");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
