package com.zj198.service.loan.impl;

import com.zj198.dao.OrdApplyUsrPersonDAO;
import com.zj198.model.OrdApplyUsrPerson;
import com.zj198.service.loan.OrdApplyUsrPersonService;

public class OrdApplyUsrPersonServiceImpl implements OrdApplyUsrPersonService{

	private OrdApplyUsrPersonDAO ordApplyUsrPersonDAO;

	public void setOrdApplyUsrPersonDAO(OrdApplyUsrPersonDAO ordApplyUsrPersonDAO) {
		this.ordApplyUsrPersonDAO = ordApplyUsrPersonDAO;
	}

	public OrdApplyUsrPerson getByApplyId(Integer id) {
		return ordApplyUsrPersonDAO.getByApplyId(id);
	}
}
