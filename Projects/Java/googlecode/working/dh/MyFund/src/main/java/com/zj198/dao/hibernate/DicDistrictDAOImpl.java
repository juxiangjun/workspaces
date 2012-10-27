package com.zj198.dao.hibernate;

import java.util.List;

import org.hibernate.Query;

import com.zj198.dao.DicDistrictDAO;
import com.zj198.model.DicDistrict;

public class DicDistrictDAOImpl extends HibernateDAO<DicDistrict, Integer> implements DicDistrictDAO{

	@Override
	public List<DicDistrict> findByCityid(Integer cityId) {
		String hql="from DicDistrict as model where model.cityid=:cityId";
		Query query = this.getSession().createQuery(hql);
		query.setParameter("cityId", cityId);
		return query.list();
	}

}
