package com.zj198.service.partner.impl;

import java.util.Date;
import java.util.List;

import com.zj198.dao.OrdFeeDAO;
import com.zj198.dao.UsrUserDAO;
import com.zj198.model.OrdFee;
import com.zj198.model.OrdFinanceApply;
import com.zj198.model.PnrFee;
import com.zj198.model.UsrUser;
import com.zj198.service.loan.FinanceApplyService;
import com.zj198.service.partner.OrdFeeService;
import com.zj198.service.partner.PnrFeeService;
import com.zj198.service.partner.PnrUsrService;

public class OrdFeeServiceImpl implements OrdFeeService {

	private OrdFeeDAO ordFeeDAO;
	private FinanceApplyService financeApplyService;
	private UsrUserDAO usrUserDAO;
	private PnrFeeService pnrFeeService;
	private PnrUsrService pnrUsrService;
	

	public void setPnrUsrService(PnrUsrService pnrUsrService) {
		this.pnrUsrService = pnrUsrService;
	}

	public void setPnrFeeService(PnrFeeService pnrFeeService) {
		this.pnrFeeService = pnrFeeService;
	}

	public void setUsrUserDAO(UsrUserDAO usrUserDAO) {
		this.usrUserDAO = usrUserDAO;
	}

	public void setFinanceApplyService(FinanceApplyService financeApplyService) {
		this.financeApplyService = financeApplyService;
	}

	public void setOrdFeeDAO(OrdFeeDAO ordFeeDAO) {
		this.ordFeeDAO = ordFeeDAO;
	}

	public List<OrdFee> getlist() {
		return ordFeeDAO.findAll();
	}

	public void updateStatus(Integer id) {
		OrdFee of = this.getById(id);
		of.setPaymentStatus(1);
		of.setPaymentDate(new Date());
		ordFeeDAO.update(of);
		if (of.getOrdId() != null) {
			OrdFinanceApply order = financeApplyService.findById(of.getOrdId());
			UsrUser usr = usrUserDAO.get(order.getUserId());
			if (usr.getReferenceId() != null) {
				pnrFeeService.savePnrFee(new PnrFee(usr.getId(), order.getId(),
					(order.getZjserviceRate() * of.getFeeAmount()), 0,
						null, new Date(), 0));
			}
		}

	}

	public OrdFee getById(Integer id) {
		return ordFeeDAO.get(id);
	}

	public void saveOrdFee(OrdFee of) {
		ordFeeDAO.save(of);
	}

}
