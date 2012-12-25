package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.FundInvestDAO;
import com.zj198.model.FundInvest;

public class FundInvestDAOImpl  extends HibernateDAO<FundInvest, Integer> implements  FundInvestDAO{

	@Override
	public List<FundInvest> findInvestByFundId(Integer id) {
		String hql="from FundInvest as model where model.fundId=:id";
		return list(hql,"id", id);
	}

}
