package com.zj198.action.user;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.UsrUser;
import com.zj198.service.user.AccountService;
import com.zj198.util.FreemarkerUtil;
import com.zj198.util.MailSendUtil;
import com.zj198.util.PropertiesUtil;
import com.zj198.util.SecurityUtil;
import com.zj198.util.StringUtil;

/**
 * 账户恢复类
 * @author Patrick
 *
 */
public class RecoveryAction extends BaseAction {
	private String v;        //邮箱的链接地址
	private String username;  //用户账号
	private String verifycode;  //验证码
	private String password;
	private UsrUser user;
	private AccountService accountService;
	
	
	/**
	 * 找回密码页面
	 * @return
	 */
	@Override
	public String execute(){
		return "recoverPage";
	}
	
	/**
	 *验证账号并 发送email验证
	 * @return
	 */
	public String sendVerify(){
		ActionContext context = ActionContext.getContext();
		if (context.getSession().get("_vcode").toString().equalsIgnoreCase(verifycode)) {
			context.getSession().remove("_vcode");
			if (StringUtils.isNotBlank(username)) {  //通过账号找回
				String activeCode = StringUtil.createActiveCode();
				user=accountService.getUserByUsername(username);
				if(user!=null){
					user.setPasstoken(activeCode);
					if(accountService.updateUser(user)>0){
						String subject="密码找回 - 中国资金网";
						Map<String,Object> map = new HashMap<String,Object>();
						String body;
						try {
							map.put("url", PropertiesUtil.getByKey("url"));
							String v = new SecurityUtil().des_encrypt(user.getUsername()+"|"+activeCode);
							map.put("actionUrl", "Recovery!verify.act?v="+v);
							body = FreemarkerUtil.getContent("recoveryPwd.htm", map, false, null, null);
							MailSendUtil.sendMail(subject, body, user.getEmail());
						} catch (Exception e) {
							e.printStackTrace();//TODO:log.error("验证邮件发送失败");
						}
						msg="密码申请找回成功，请进入申请邮箱进行下一步操作。";
						return "sendSuccess";
					}
					System.out.println(user);
				}
				msg="用户不存在。";
				return ERROR;
			}
			msg="账号为空，请重新输入。";
			return "recoverPage";
		}
		msg="验证码错误，请重新输入。";
		return "recoverPage";
	}
	

	/**
	 * 校验email连接的信息
	 * @return
	 */
	public String verify(){
		if(v!=null){//邮件链接直接点击
			String[] codes = new SecurityUtil().des_decrypt(v).split("\\|");
			user=accountService.getUserByUsername(codes[0]);
			if(user.getPasstoken().equalsIgnoreCase(codes[1])){
				user.setPasstoken(null);
				if(codes.length==2 && accountService.updateUser(user)>0){
					msg = "验证信息成功。";
					return "resetPwd";
				}
				msg="验证错误，请联系管理员！";
				return ERROR;
			}
			msg="验证错误。";
			return ERROR;
		}
		msg = "email连接错误！";
		return ERROR;
	}
	
	//如果需要，可增加手机发送和验证
	
	/**
	 * 设置新密码
	 * @return
	 */
	public String resetPwd(){
		String[] codes = new SecurityUtil().des_decrypt(v).split("\\|");
		user=accountService.getUserByUsername(codes[0]);
		user.setPassword(SecurityUtil.getMD5(password));
		if(password!=null && accountService.updateUser(user)>0){
			msg = "新密码设置成功";
			return SUCCESS;
		}
		msg = "密码输入有误请重新输入！";
		return ERROR;
	}
	
	
	//get and set
	public void setV(String v) {
		this.v = v;
	}
	public String getV() {
		return v;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setVerifycode(String verifycode) {
		this.verifycode = verifycode;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}
	public void setUser(UsrUser user) {
		this.user = user;
	}
}