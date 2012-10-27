package com.zj198.dao.hibernate;

import java.util.List;

import org.hibernate.Query;

import com.zj198.dao.UsrCompanyDAO;
import com.zj198.model.UsrCompany;

public class UsrCompanyDAOImpl extends HibernateDAO<UsrCompany, Integer> implements UsrCompanyDAO {

	@Override
	public UsrCompany getByUid(Integer uid) {
		String hql="from UsrCompany as model where model.userid=:uid";
		Query query = this.getSession().createQuery(hql);
		query.setParameter("uid", uid);
		List<UsrCompany> list = query.list();
		if(list.size()==1){
			return list.get(0);
		}
		return null;
	}


}
