package com.zj198.action.admin.partner;

import java.util.List;

import com.zj198.action.BaseAction;
import com.zj198.model.PnrUser;
import com.zj198.service.partner.PnrUsrService;

/**
 * 合作伙伴管理
 * 
 * @author zeroleavebaoyang@gmail.com
 * @since 2012-12-19|下午3:48:30
 */
public class PnrUsrAction extends BaseAction {

	private PnrUsrService pnrUsrService;
	private List<PnrUser> list;
	private PnrUser pnrUsr;

	public String execute() {
		list = pnrUsrService.getlist();
		return "list";
	}
	
	public String addUI() {
		return "addUI";
	}
	
	public String add() {
		pnrUsrService.savePnrUsr(pnrUsr);
		return this.execute();
	}
	
	public String editUI() {
		pnrUsr = pnrUsrService.getById(pnrUsr.getId());
		return "editUI";
	}

	public String edit() {
		pnrUsrService.updatePnrUsr(pnrUsr);
		return this.execute();
	}

	public String details() {
		pnrUsr = pnrUsrService.getById(pnrUsr.getId());
		return "details";
	}

	public void setPnrUsrService(PnrUsrService pnrUsrService) {
		this.pnrUsrService = pnrUsrService;
	}

	public List<PnrUser> getList() {
		return list;
	}

	public void setList(List<PnrUser> list) {
		this.list = list;
	}

	public PnrUser getPnrUsr() {
		return pnrUsr;
	}

	public void setPnrUsr(PnrUser pnrUsr) {
		this.pnrUsr = pnrUsr;
	}
	

}
