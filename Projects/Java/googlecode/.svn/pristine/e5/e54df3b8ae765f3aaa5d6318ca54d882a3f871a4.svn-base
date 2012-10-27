package com.zj198.dao.hibernate;

import java.util.List;

import org.hibernate.Query;

import com.zj198.dao.OrdBaseRateDAO;
import com.zj198.model.OrdBaseRate;
import com.zj198.model.UsrUser;

public class OrdBaseRateDAOImpl  extends HibernateDAO<OrdBaseRate, Integer> implements  OrdBaseRateDAO{
	public List<OrdBaseRate> findAllBaseRate(){
		String hql="from OrdBaseRate";
		Query query = this.getSession().createQuery(hql);
		return query.list();
	}
}
