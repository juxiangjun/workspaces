package com.zj198.action.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.UsrUser;
import com.zj198.service.user.AccountService;
import com.zj198.util.Constants;
import com.zj198.util.FreemarkerUtil;
import com.zj198.util.MailSendUtil;
import com.zj198.util.PropertiesUtil;
import com.zj198.util.SecurityUtil;

/**
 * 用户账户类
 * 
 * @author Patrick
 */
public class AccountAction extends BaseAction {
	
	private String username;
	private String email;
	private String password;
	private String verifycode;
	private Integer loginType;//1为普通登录 2为证书登录
	private String activeCode;//激活验证码
	private String v;//加密后的激活验证码
	private AccountService accountService;
	private String rtnurl;

	/**
	 * 登录页面 cookie
	 */
	public String execute(){
		return LOGIN;
	}

	/**
	 * 标准登录 根据用户名、密码、验证码和用户status登录用户，保存基本用户信息至session, 清除验证码session
	 */
	public String login() {
		ActionContext context = ActionContext.getContext();
		if(context.getSession().get("_user")!=null){
			return "userCenter";
		}else{
			if (loginType != null && StringUtils.isNotBlank(username) && StringUtils.isNotBlank(password) && StringUtils.isNotBlank(verifycode)) {
				if (loginType == 1) {// 普通登录
					if (context.getSession().get("_vcode").toString().equalsIgnoreCase(verifycode)) {
						context.getSession().remove("_vcode");
						HttpServletRequest request = ServletActionContext.getRequest();
						UsrUser _user = accountService.userLogin_tx(username, password, request.getRemoteAddr());
						if (_user != null) {
							if (_user.getStatus() == Constants.USER_STATUS_AVAILABLE){
								context.getSession().put("_user", _user);
								if(StringUtils.isBlank(rtnurl)){
									return "userCenter";
								}else{
									return "next";
								}
							}else{
								msg = "对不起，你被禁止登录。";
								return LOGIN;
							}
						}
						msg = "用户名或密码输入错误，请重新输入。";
						return LOGIN;
					}
					msg = "验证码输入错误，请重新输入。";
					return LOGIN;
				}else if(loginType==2){//TODO:证书方式登录
					msg = "暂时不支持证书登录。";
					return LOGIN;
				}
			}
		}
		msg = "出现错误，请联系管理员。";
		return ERROR;
	}
	
	/**
	 * 快速登录，不考虑后面的激活，类型选择等跳转问题，目前用于快速融资申请过程中的登录
	 * @return ajax
	 */
	public String RapidLogin(){
		if (loginType != null) {
			if (loginType == 1 && StringUtils.isNotBlank(password)) {// 普通登录
				ActionContext context = ActionContext.getContext();
				if (context.getSession().get("_vcode").toString().equalsIgnoreCase(verifycode)) {
					context.getSession().remove("_vcode");
					HttpServletRequest request = ServletActionContext.getRequest();
					UsrUser _user = accountService.userLogin_tx(username, password, request.getRemoteAddr());
					if (_user != null) {
						if (_user.getStatus() == Constants.USER_STATUS_AVAILABLE){
							context.getSession().put("_user", _user);
							msg=SUCCESS;
							return "ajax";
						}else{
							msg = "对不起，你被禁止登录。";
							return "ajax";
						}
					}
					msg = "用户名或密码输入错误，请重新输入。";
					return "ajax";
				}
				msg = "验证码输入错误，请重新输入。";
				return "ajax";
			}else if(loginType==2 && StringUtils.isNotBlank(password)){//TODO:证书方式登录
				
			}
		}
		msg = "出现错误，请联系管理员。";
		return "ajax";
	}

	/**
	 * 通过手机或邮箱激活帐户
	 * @return
	 */
	public String activate(){
		int uid=0;
		if(v!=null){//邮件链接直接点击
			String[] codes = new SecurityUtil().des_decrypt(v).split("\\|");
			if(codes.length==3){
				uid = accountService.activeUser_tx(Integer.parseInt(codes[0]),codes[1],codes[2]);
			}
		}else if(activeCode!=null){
			ActionContext context = ActionContext.getContext();
			UsrUser user = (UsrUser)context.getSession().get("_user");
			uid = accountService.activeUser_tx(user.getUsername(),activeCode);
		}
		if(uid>0){
			ActionContext context = ActionContext.getContext();
			Object o = context.getSession().get("_user");
			if(o!=null){
				UsrUser user = (UsrUser)o;
				user.setActivetype(Short.parseShort(PropertiesUtil.getByKey("activeType")));
				context.getSession().put("_user",user);
			}
			msg = "激活成功。";
		}else{
			msg = "激活失败，请重新尝试。";
		}
		return "activateResult";
	}
	
	/**
	 * 更改注册时邮箱或手机并发送激活码
	 * @return
	 */
	public String reSendActiveCode(){
		//改名：reSendActiveCode()
		//按新输入Email or mobile 发送
		//更新数据库中User内容（email or mobile）
		int activeType = Integer.parseInt(PropertiesUtil.getByKey("activeType"));
		ActionContext context = ActionContext.getContext();
		UsrUser sUser = (UsrUser)context.getSession().get("_user");
		UsrUser user=accountService.getUserById(sUser.getId());
		if(activeType==1){//邮件验证
			user.setEmail(email);
			if(accountService.updateUser(user)>0){
				String subject="注册验证邮件 - 中国资金网";
				Map<String,Object> map = new HashMap<String,Object>();
				String body;
				try {
					map.put("url", PropertiesUtil.getByKey("url"));
					map.put("realname", user.getRealname());
					if(user.getGender()==1){
						map.put("gender", "先生");
					}else{
						map.put("gender", "女士");
					}
					String v = new SecurityUtil().des_encrypt(user.getId()+"|"+user.getActivecode());
					map.put("actionUrl", "Account!activate.act?v="+v);
					map.put("activeCode", user.getActivecode().split("\\|")[1]);
					body = FreemarkerUtil.getContent("registerActive.htm", map, false, null, null);
					MailSendUtil.sendMail(subject, body, email);
					} catch (Exception e) {
						e.printStackTrace();//TODO:log.error("验证邮件发送失败");
					}
					msg="激活码已重新发送，请检查您的注册邮箱激活您的帐户。";
					return "activate";
				}
			    msg="邮箱填写错误，请重新填写！";
			    return "activate";
			}else if(activeType==2){//TODO:手机验证
				
			}
			msg="系统错误，请联系管理员。";
			return ERROR;
	}

	/**
	 * 登出 清除session
	 * 
	 * @return
	 */
	public String logout() {
		ActionContext.getContext().getSession().remove("_user");
		return LOGIN;
	}

	// setter and getter
	public void setVerifycode(String verifycode) {
		this.verifycode = verifycode;
	}
	public void setActiveCode(String activeCode) {
		this.activeCode = activeCode;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUsername() {
		return username;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setLoginType(Integer loginType) {
		this.loginType = loginType;
	}
	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}
	public void setV(String v) {
		this.v = v;
	}

	public String getRtnurl() {
		return rtnurl;
	}

	public void setRtnurl(String rtnurl) {
		this.rtnurl = rtnurl;
	}

}
