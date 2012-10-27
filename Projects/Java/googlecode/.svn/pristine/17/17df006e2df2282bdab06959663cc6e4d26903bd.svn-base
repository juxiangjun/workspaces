package com.zj198.dao.hibernate;

import java.util.List;

import org.hibernate.Query;

import com.zj198.dao.DicCityDAO;
import com.zj198.model.DicCity;

public class DicCityDAOImpl extends HibernateDAO<DicCity, Integer> implements DicCityDAO{

	@Override
	public List<DicCity> findByProvinceid(Integer provinceId) {
		String hql="from DicCity as model where model.provinceid=:provinceId";
		Query query = this.getSession().createQuery(hql);
		query.setParameter("provinceId", provinceId);
		return query.list();
	}

}
