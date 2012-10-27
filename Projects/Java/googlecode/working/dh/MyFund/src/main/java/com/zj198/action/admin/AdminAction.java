package com.zj198.action.admin;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.AdmFunction;
import com.zj198.model.AdmUser;
import com.zj198.service.admin.AdminAccountService;

public class AdminAction extends BaseAction {
	private AdminAccountService adminAccountService;
	
	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		if(ctx.getSession().get("_functionList")==null){
			AdmUser _admin = (AdmUser)ctx.getSession().get("_admin");
			List<AdmFunction> functionList = adminAccountService.findByRights(_admin.getRights());
			ctx.getSession().put("_functionList", functionList);
		}
		return "index";
	}

	
	//setter and getter
	public void setAdminAccountService(AdminAccountService adminAccountService) {
		this.adminAccountService = adminAccountService;
	}
	

}
