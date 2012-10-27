package com.zj198.dao.hibernate;

import java.util.List;

import org.hibernate.Query;

import com.zj198.dao.DicProvinceDAO;
import com.zj198.model.DicProvince;

public class DicProvinceDAOImpl extends HibernateDAO<DicProvince, Integer> implements DicProvinceDAO{

	@Override
	public List<DicProvince> findAll() {
		String hql="from DicProvince as model";
		Query query = this.getSession().createQuery(hql);
		return query.list();
	}

}
