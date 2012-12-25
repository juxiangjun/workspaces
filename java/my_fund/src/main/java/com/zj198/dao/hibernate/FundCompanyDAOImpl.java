package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.FundCompanyDAO;
import com.zj198.model.FundCompany;
import com.zj198.util.Pager;

public class FundCompanyDAOImpl  extends HibernateDAO<FundCompany, Integer> implements  FundCompanyDAO{

	@Override
	public Pager findAll(int pageSize, int pageNo) {
		String hql = "from FundCompany as model where model.status = 1";
		return pagedQuery(hql,pageNo,pageSize);
	}

	@Override
	public List<FundCompany> findComAllIssue() {
		String hql = "from FundCompany as model where model.status = 1";
		return list(hql);
	}

}
