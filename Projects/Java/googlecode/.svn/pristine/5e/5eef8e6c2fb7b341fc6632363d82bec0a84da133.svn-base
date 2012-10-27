package org.tju.ebs.handler.system;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.SysMenu;
import org.tju.ebs.domain.service.IAppInitialService;
import org.tju.ebs.domain.service.ISysMenuService;
import org.tju.ebs.handler.BaseHandler;
import org.tju.ebs.handler.IBaseHandler;
import org.tju.ebs.utils.StringUtil;

public class SysMenuHandler extends BaseHandler implements IBaseHandler {

	private static final Logger log = LoggerFactory
			.getLogger(SysMenuHandler.class);

	private final IAppInitialService service = (IAppInitialService) this
			.getBean(IAppInitialService.SERVICE_NAME, request);;

	public SysMenuHandler(HttpServletRequest request,
			HttpServletResponse response) {
		super(request, response);
	}

	public void delete() {

	}

	public void save() {

	}

	@Override
	public void doQuery(String type, int pageNo, int pageSize, String filter) {
		if (type.equals("getSysMenuList")) {
			this.getSysMenuList();
		}
	}

	private void getSysMenuList() {
		System.out.println("中国为人");
		List<SysMenu> list = this.service.getSysMemuList(null);
		this.response(true, "", list.size(), StringUtil.toJson(list));
	}
}
