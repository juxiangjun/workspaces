package com.zj198.action.admin.partner;

import java.util.List;

import com.zj198.action.BaseAction;
import com.zj198.model.PnrFee;
import com.zj198.service.partner.PnrFeeService;
/**
 * 佣金管理
 * 
 * @author zeroleavebaoyang@gmail.com
 * @since 2012-12-20|下午4:15:40
 */
public class PnrFeeAction extends BaseAction {
	
	private PnrFeeService pnrFeeService;
	private List<PnrFee> list;
	private PnrFee pnrFee;
	

	public String execute(){
		list = pnrFeeService.getList();
		return "list";
	}
	
	/**
	 * 完成支付
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-12-20|下午2:35:43
	 * @return
	 */
	public String finish() {
		pnrFeeService.updateStatus(pnrFee.getId());
		writeJson("{\"success\":\"true\",\"msg\":\"支付成功\"}");
		return null;
	}

	public PnrFee getPnrFee() {
		return pnrFee;
	}


	public void setPnrFee(PnrFee pnrFee) {
		this.pnrFee = pnrFee;
	}


	public List<PnrFee> getList() {
		return list;
	}


	public void setList(List<PnrFee> list) {
		this.list = list;
	}


	public void setPnrFeeService(PnrFeeService pnrFeeService) {
		this.pnrFeeService = pnrFeeService;
	}



}
