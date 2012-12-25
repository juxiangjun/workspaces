package com.zj198.service.partner;

import java.util.List;

import com.zj198.model.PnrFee;
import com.zj198.service.partner.model.FindPartnerApplySpModel;
import com.zj198.service.partner.model.FindPartnerFeeSpModel;
import com.zj198.service.partner.model.FindPartnerUserSpModel;
import com.zj198.util.Pager;

public interface PnrFeeService {

	void savePnrFee(PnrFee pf);
	
	List<PnrFee> getList();
	
	PnrFee getById(Integer id);
	
	void updateStatus(Integer id);
	
	public Pager findPartnerFee(FindPartnerFeeSpModel spModel);
	/**
	 * 查询合作伙伴推荐用户的融资申请
	 * @param spModel
	 * @return
	 */
	public Pager findPartnerApply(FindPartnerApplySpModel spModel);
	
	/**
	 * 查询合作伙伴推荐用户
	 * @param pnrId
	 * @return
	 */
	public Pager findPartnerUser(FindPartnerUserSpModel spModel);
}
