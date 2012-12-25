package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.FundRoiDAO;
import com.zj198.model.FundRoi;

public class FundRoiDAOImpl  extends HibernateDAO<FundRoi, Integer> implements  FundRoiDAO{

	@Override
	public List<FundRoi> findRoiByFundId(Integer id) {
		String hql="from FundRoi as model where model.fundId=:id";
		return list(hql,"id", id);
	}

}
