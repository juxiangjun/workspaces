package com.zj198.service.partner.impl;

import java.util.Date;
import java.util.List;

import com.zj198.dao.OrdFinanceApplyDAO;
import com.zj198.dao.PnrFeeDAO;
import com.zj198.dao.UsrUserDAO;
import com.zj198.model.PnrFee;
import com.zj198.service.partner.PnrFeeService;
import com.zj198.service.partner.model.FindPartnerApplySpModel;
import com.zj198.service.partner.model.FindPartnerFeeSpModel;
import com.zj198.service.partner.model.FindPartnerUserSpModel;
import com.zj198.util.Pager;

public class PnrFeeServiceImpl implements PnrFeeService {
	private PnrFeeDAO pnrFeeDAO;
	private OrdFinanceApplyDAO ordFinanceApplyDAO;
	private UsrUserDAO usrUserDAO;

	public void savePnrFee(PnrFee pf) {
		pnrFeeDAO.save(pf);
	}

	public PnrFee getById(Integer id) {
		return pnrFeeDAO.get(id);
	}

	public List<PnrFee> getList() {
		return pnrFeeDAO.findAll();
	}

	public void updateStatus(Integer id) {
		PnrFee pf = this.getById(id);
		pf.setPaymentStatus(1);
		pf.setPaymentDate(new Date());
		pnrFeeDAO.update(pf);
	}
	
	public Pager findPartnerFee(FindPartnerFeeSpModel spModel){
		return this.pnrFeeDAO.findPartnerFee(spModel);
	}
	/**
	 * 查询合作伙伴推荐用户的融资申请
	 * @param spModel
	 * @return
	 */
	public Pager findPartnerApply(FindPartnerApplySpModel spModel){
		return this.ordFinanceApplyDAO.findPartnerApply(spModel);
	}
	
	/**
	 * 查询合作伙伴推荐用户
	 * @param pnrId
	 * @return
	 */
	public Pager findPartnerUser(FindPartnerUserSpModel spModel){
		return this.usrUserDAO.findPartnerUser(spModel);
	}

	//setter and getter
	public void setPnrFeeDAO(PnrFeeDAO pnrFeeDAO) {
		this.pnrFeeDAO = pnrFeeDAO;
	}

	public void setOrdFinanceApplyDAO(OrdFinanceApplyDAO ordFinanceApplyDAO) {
		this.ordFinanceApplyDAO = ordFinanceApplyDAO;
	}

	public void setUsrUserDAO(UsrUserDAO usrUserDAO) {
		this.usrUserDAO = usrUserDAO;
	}
}
