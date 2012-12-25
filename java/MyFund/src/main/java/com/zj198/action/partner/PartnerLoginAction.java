package com.zj198.action.partner;

import org.apache.commons.lang3.StringUtils;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.PnrUser;
import com.zj198.service.partner.PnrUsrService;

public class PartnerLoginAction extends BaseAction {
	private PnrUsrService pnrUsrService;
	private String username;
	private String password;
	private String verifycode;
	
	public String execute() {
		return LOGIN;
	}
	public String login(){
		ActionContext context = ActionContext.getContext();
		if (StringUtils.isNotBlank(username) && StringUtils.isNotBlank(password) && StringUtils.isNotBlank(verifycode)) {
			if(context.getSession().get("_vcode")!=""){
				if (context.getSession().get("_vcode").toString().equalsIgnoreCase(verifycode)) {
					PnrUser puser = pnrUsrService.partnerUserLogin(username, password);
					if(puser != null){
						//验证成功
						context.getSession().put("PARTNER_USER", puser);
						return SUCCESS;
					}else{
						msg = "用户名或密码输入错误，请重新输入。";
						return LOGIN;
					}
				}else{
					msg = "验证码输入错误，请重新输入。";
					return LOGIN;
				}
			}
		}
		msg = "出现错误，请再次尝试。";
		return LOGIN;
	}
	
	public String logout(){
		ActionContext context = ActionContext.getContext();
		context.getSession().remove("PARTNER_USER");
		return LOGIN;
	}
	
	//setter and getter
	public void setPnrUsrService(PnrUsrService pnrUsrService) {
		this.pnrUsrService = pnrUsrService;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getVerifycode() {
		return verifycode;
	}

	public void setVerifycode(String verifycode) {
		this.verifycode = verifycode;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

}
