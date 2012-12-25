package com.zj198.action.admin.partner;

import java.util.List;

import com.zj198.action.BaseAction;
import com.zj198.model.OrdFee;
import com.zj198.service.partner.OrdFeeService;

/**
 * 服务费管理
 * 
 * @author zeroleavebaoyang@gmail.com
 * @since 2012-12-20|下午1:55:43
 */
public class OrdFeeAction extends BaseAction {

	private OrdFeeService ordFeeService;
	private List<OrdFee> list;
	private OrdFee ordFee;

	public String execute() {
		list = ordFeeService.getlist();
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
		ordFeeService.updateStatus(ordFee.getId());
		writeJson("{\"success\":\"true\",\"msg\":\"支付成功\"}");
		return null;
	}

	public List<OrdFee> getList() {
		return list;
	}

	public void setList(List<OrdFee> list) {
		this.list = list;
	}

	public OrdFee getOrdFee() {
		return ordFee;
	}

	public void setOrdFee(OrdFee ordFee) {
		this.ordFee = ordFee;
	}

	public void setOrdFeeService(OrdFeeService ordFeeService) {
		this.ordFeeService = ordFeeService;
	}

}
