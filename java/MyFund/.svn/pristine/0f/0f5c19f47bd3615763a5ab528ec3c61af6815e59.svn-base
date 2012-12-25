package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.FundManagerDAO;
import com.zj198.model.FundManager;

public class FundManagerDAOImpl  extends HibernateDAO<FundManager, Integer> implements  FundManagerDAO{

	@Override
	public List<FundManager> findManagerByFundId(Integer id) {
		String hql="from FundManager as model where model.fundId=:id";
		return list(hql,"id", id);
	}

}
