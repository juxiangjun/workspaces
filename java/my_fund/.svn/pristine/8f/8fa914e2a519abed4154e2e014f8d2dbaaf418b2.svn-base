package com.zj198.action.partner;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.PnrUser;
import com.zj198.service.partner.PnrFeeService;
import com.zj198.service.partner.model.FindPartnerApplySpModel;
import com.zj198.service.partner.model.FindPartnerFeeSpModel;
import com.zj198.service.partner.model.FindPartnerUserSpModel;
import com.zj198.util.Pager;

public class PartnerResourceAction extends BaseAction {
	private PnrFeeService pnrFeeService;
	private FindPartnerApplySpModel applySpModel = new FindPartnerApplySpModel();
	private FindPartnerFeeSpModel feeSpModel = new FindPartnerFeeSpModel();
	private FindPartnerUserSpModel userSpModel = new FindPartnerUserSpModel();
	private Pager pager;
	
	public String execute() {
		return "";
	}
	
	public String findUser(){
		ActionContext context = ActionContext.getContext();
		PnrUser pu = (PnrUser) context.getSession().get("PARTNER_USER");
		if(pu == null){
			msg = "用户未登陆。";
			return LOGIN;
		}
		if(pager == null){
			pager = new Pager(10, 1);
		}
		userSpModel.setPager(pager);
		userSpModel.setPnrUserId(pu.getId());
		pager = this.pnrFeeService.findPartnerUser(userSpModel);
		return "user";
	}
	public String findApply(){
		ActionContext context = ActionContext.getContext();
		PnrUser pu = (PnrUser) context.getSession().get("PARTNER_USER");
		if(pu == null){
			msg = "用户未登陆。";
			return LOGIN;
		}
		if(pager == null){
			pager = new Pager(10, 1);
		}
		applySpModel.setPager(pager);
		applySpModel.setPnrUserId(pu.getId());
		pager = this.pnrFeeService.findPartnerApply(applySpModel);
		return "apply";
	}
	public String findFee(){
		ActionContext context = ActionContext.getContext();
		PnrUser pu = (PnrUser) context.getSession().get("PARTNER_USER");
		if(pu == null){
			msg = "用户未登陆。";
			return LOGIN;
		}
		if(pager == null){
			pager = new Pager(10, 1);
		}
		feeSpModel.setPager(pager);
		feeSpModel.setPnrUserId(pu.getId());
		pager = this.pnrFeeService.findPartnerFee(feeSpModel);
		return "fee";
	}
	
	//setter and getter
	public void setPnrFeeService(PnrFeeService pnrFeeService) {
		this.pnrFeeService = pnrFeeService;
	}

	public FindPartnerApplySpModel getApplySpModel() {
		return applySpModel;
	}

	public void setApplySpModel(FindPartnerApplySpModel applySpModel) {
		this.applySpModel = applySpModel;
	}

	public FindPartnerFeeSpModel getFeeSpModel() {
		return feeSpModel;
	}

	public void setFeeSpModel(FindPartnerFeeSpModel feeSpModel) {
		this.feeSpModel = feeSpModel;
	}

	public FindPartnerUserSpModel getUserSpModel() {
		return userSpModel;
	}

	public void setUserSpModel(FindPartnerUserSpModel userSpModel) {
		this.userSpModel = userSpModel;
	}

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}
}
