package com.zj198.dao.hibernate;

import java.util.List;

import org.hibernate.Query;

import com.zj198.dao.DicUsertypeDAO;
import com.zj198.model.DicUsertype;


public class DicUsertypeDAOImpl extends HibernateDAO<DicUsertype, Integer> implements DicUsertypeDAO{

	@Override
	public List<DicUsertype> findAll() {
		String hql="from DicUsertype as model";
		Query query = this.getSession().createQuery(hql);
		return query.list();
	}
	
	public List<DicUsertype> findByGroup(Integer groupId) {
		String hql="from DicUsertype as model where model.group=:groupId";
		Query query = this.getSession().createQuery(hql);
		query.setParameter("groupId", groupId);
		return query.list();
	}

}