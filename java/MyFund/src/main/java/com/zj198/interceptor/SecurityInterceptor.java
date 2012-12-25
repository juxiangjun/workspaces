package com.zj198.interceptor;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.zj198.annotation.Apply;
import com.zj198.annotation.Product;
import com.zj198.model.OrdFinanceApply;
import com.zj198.model.PrdFinance;
import com.zj198.model.UsrUser;
import com.zj198.service.loan.FinanceApplyService;
import com.zj198.service.loan.FinanceProductService;
import com.zj198.util.Constants;

public class SecurityInterceptor extends AbstractInterceptor {

	private FinanceApplyService financeApplyService;
	private FinanceProductService financeProductService;

	public void setFinanceProductService(FinanceProductService financeProductService) {
		this.financeProductService = financeProductService;
	}

	public void setFinanceApplyService(FinanceApplyService financeApplyService) {
		this.financeApplyService = financeApplyService;
	}

	private static final long serialVersionUID = -3131529740731792173L;

	public String intercept(ActionInvocation invocation) throws Exception {
		String methodName = invocation.getProxy().getMethod();
		Method currentMethod = invocation.getAction().getClass().getMethod(methodName);
		if (currentMethod.isAnnotationPresent(Apply.class)) {
			UsrUser u = (UsrUser) ActionContext.getContext().getSession().get("_user");
			if (u == null) {
				return "error";
			} else {
				HttpServletRequest request = ServletActionContext.getRequest();
				Integer apyid = 1;
				try {
					String aplid = request.getParameter("apply.id");
					String apllid = request.getParameter("applyId");
					if (StringUtils.isNotBlank(aplid)) {
						apyid = Integer.parseInt(aplid);
					} else if (StringUtils.isBlank(aplid) && StringUtils.isNotBlank(apllid)) {
						apyid = Integer.parseInt(apllid);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				OrdFinanceApply apply = financeApplyService.getFinanceApply(apyid);
				if (u.getUserTypeGroup() == Constants.USERTYPE_GROUP_COMPANY || u.getUserTypeGroup() == Constants.USERTYPE_GROUP_PERSONAL) {
					if (apply == null) {
						return "error";
					} else {
						if (apply.getUserId().intValue() != u.getId().intValue()) {
							return "error";
						}
					}
				} else {
					PrdFinance product = financeProductService.getFinance(apply.getFinanceId());
					if (u.getId().intValue() != product.getUserId().intValue()) {
						return "error";
					}
				}
			}
		}
		if (currentMethod.isAnnotationPresent(Product.class)) {
			UsrUser u = (UsrUser) ActionContext.getContext().getSession().get("_user");
			if (u != null) {
				HttpServletRequest request = ServletActionContext.getRequest();
				Integer pid = 1;
				try {
					String proid = request.getParameter("productId");
					String prdid = request.getParameter("product.id");
					if (StringUtils.isNotBlank(proid)) {
						pid = Integer.parseInt(proid);
					} else if (StringUtils.isBlank(proid) && StringUtils.isNotBlank(prdid)) {
						pid = Integer.parseInt(prdid);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				PrdFinance prt = financeProductService.getFinance(pid);
				if (u.getId().intValue() != prt.getUserId()) {
					return "error";
				}
			} else {
				return "error";
			}

		}
		return invocation.invoke();
	}
}
