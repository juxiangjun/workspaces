package com.zj198.dao.hibernate;

import java.util.List;

import org.hibernate.Query;

import com.zj198.dao.UsrServiceorgDAO;
import com.zj198.model.UsrServiceorg;

public class UsrServiceorgDAOImpl extends HibernateDAO<UsrServiceorg, Integer> implements UsrServiceorgDAO {

	@Override
	public UsrServiceorg getByUid(Integer uid) {
		String hql="from UsrServiceorg as model where model.userid=:uid";
		Query query = this.getSession().createQuery(hql);
		query.setParameter("uid", uid);
		List<UsrServiceorg> list = query.list();
		if(list.size()==1){
			return list.get(0);
		}
		return null;
	}


}
