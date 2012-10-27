package com.zj198.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.zj198.dao.AdmFunctionDAO;

public class AdminInterceptor extends AbstractInterceptor{
	
	private AdmFunctionDAO admFunctionDAO;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext ctx = invocation.getInvocationContext();
		if (ctx.getSession().get("_admin") != null) {
//			admFunctionDAO.
//			if(adminAuthorizationService.judgeAccess((Integer)ctx.getSession().get("_admin"), invocation.getAction().toString(), invocation.getProxy().getMethod())){
				return invocation.invoke();
//			}else{
//				ctx.put("msg","您的权限不允许进行此操作");
//				return "error";
//			}
		}else{
			return "login";
		}
		
		
//		HttpServletRequest request=ServletActionContext.getRequest();
//		StringBuilder qs = new StringBuilder();		
//		Enumeration<String> postString = request.getParameterNames();
//		boolean flag = false;
//		while(postString.hasMoreElements()){
//			String a = postString.nextElement();
//			if(flag) qs.append("&");
//			qs.append(a).append("=").append(request.getParameter(a));
//			flag=true;
//		}
//		if(qs.length()>0){
//			request.setAttribute("rtnurl",request.getRequestURI()+"?"+qs);
//		}else{
//			request.setAttribute("rtnurl",request.getRequestURI());
//		}
		
	}

	public void setAdmFunctionDAO(AdmFunctionDAO admFunctionDAO) {
		this.admFunctionDAO = admFunctionDAO;
	}

}