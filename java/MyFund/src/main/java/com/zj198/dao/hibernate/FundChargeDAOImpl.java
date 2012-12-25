package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.FundChargeDAO;
import com.zj198.model.FundCharge;

public class FundChargeDAOImpl  extends HibernateDAO<FundCharge, Integer> implements  FundChargeDAO{

	@Override
	public List<FundCharge> findChargeByFundId(Integer id) {
		String hql="from FundCharge as model where model.fundId=:id";
		return list(hql,"id", id);
	}

}
