package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.FundDividendDAO;
import com.zj198.model.FundDividend;

public class FundDividendDAOImpl  extends HibernateDAO<FundDividend, Integer> implements  FundDividendDAO{

	@Override
	public List<FundDividend> findDividendByFundId(Integer id) {
		String hql="from FundDividend as model where model.fundId=:id";
		return list(hql,"id", id);
	}

}
