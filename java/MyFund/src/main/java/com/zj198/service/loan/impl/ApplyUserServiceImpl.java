package com.zj198.service.loan.impl;

import com.zj198.dao.OrdApplyUsrCompanyDAO;
import com.zj198.dao.OrdApplyUsrPersonDAO;
import com.zj198.model.OrdApplyUsrCompany;
import com.zj198.model.OrdApplyUsrPerson;
import com.zj198.service.loan.ApplyUserService;

public class ApplyUserServiceImpl implements ApplyUserService {

	OrdApplyUsrCompanyDAO ordApplyUsrCompanyDAO;
	OrdApplyUsrPersonDAO ordApplyUsrPersonDAO;

	public void setOrdApplyUsrCompanyDAO(OrdApplyUsrCompanyDAO ordApplyUsrCompanyDAO) {
		this.ordApplyUsrCompanyDAO = ordApplyUsrCompanyDAO;
	}

	public void setOrdApplyUsrPersonDAO(OrdApplyUsrPersonDAO ordApplyUsrPersonDAO) {
		this.ordApplyUsrPersonDAO = ordApplyUsrPersonDAO;
	}

	public void addCompDetail(OrdApplyUsrCompany auc) {
		ordApplyUsrCompanyDAO.add(auc);
	}

	public void updateCompDetail(OrdApplyUsrCompany auc) {
		ordApplyUsrCompanyDAO.update(auc);
	}

	public OrdApplyUsrCompany getByApplyId(Integer id) {
		return ordApplyUsrCompanyDAO.getByApplyId(id);
	}
	public OrdApplyUsrCompany getOrdApplyUsrCompanyById(Integer id) {
		// TODO Auto-generated method stub
		return ordApplyUsrCompanyDAO.get(id);
	}
	@Override
	public void addPersDetail(OrdApplyUsrPerson aup) {
		ordApplyUsrPersonDAO.add(aup);
	}
	@Override
	public void updateCompDetail(OrdApplyUsrPerson aup) {
		ordApplyUsrPersonDAO.update(aup);
		
	}
	@Override
	public OrdApplyUsrPerson getByApplyUsrPerId(Integer id) {
		return ordApplyUsrPersonDAO.getByApplyId(id);
	}
	@Override
	public OrdApplyUsrPerson getOrdApplyUsrPersonById(Integer id) {
		return ordApplyUsrPersonDAO.get(id);
	}

	@Override
	public void updateOrdPerson(OrdApplyUsrPerson aup) {
		ordApplyUsrPersonDAO.update(aup);
		
	}
}
