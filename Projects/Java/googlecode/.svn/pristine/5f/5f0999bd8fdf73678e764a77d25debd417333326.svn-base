package com.zj198.interceptor;

import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.zj198.model.DicUsertype;
import com.zj198.model.UsrUser;
import com.zj198.service.common.DictoryDataService;
import com.zj198.util.Constants;

public class UserInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = -6428167317370482296L;
	private DictoryDataService dictoryDataService;
	private String msg;

	public String getMsg() {
		return msg;
	}
	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext ctx = invocation.getInvocationContext();
		Object u = ctx.getSession().get("_user");
		if (u!= null) {
			UsrUser user = (UsrUser)u;
			if(user.getActivetype()==Constants.USER_ACTIVE_NONE){//强制验证
				msg = "您的帐户还没有激活，请检查您的注册邮箱激活您的帐户。";
				return "activate";
			}
			if(user.getType()==Constants.USER_TYPE_NULL){//强制选择用户类型
				Map<Integer,List<DicUsertype>> map = dictoryDataService.findAllUerttypeGroupByGroup();
				HttpServletRequest request = ServletActionContext.getRequest();
				request.setAttribute("userTypeMap", map);
				msg="请选择您的账户类型。";
				return "chooseType";
			}
			
			return invocation.invoke();
		}else{
			createRtnUrl();
			msg = "请先登录，再继续您的操作。";
			return "login";
		}
	}
	
	private void createRtnUrl(){
		//获取登录前查询字符串
		HttpServletRequest request=ServletActionContext.getRequest();
		StringBuilder qs = new StringBuilder();		
		Enumeration<String> postString = request.getParameterNames();
		boolean flag = false;
		while(postString.hasMoreElements()){
			String a = postString.nextElement();
			if(flag) qs.append("&");
			qs.append(a).append("=").append(request.getParameter(a));
			flag=true;
		}
		if(qs.length()>0){
			request.setAttribute("rtnurl",request.getRequestURI()+"?"+qs);
		}else{
			request.setAttribute("rtnurl",request.getRequestURI());
		}
	}

}