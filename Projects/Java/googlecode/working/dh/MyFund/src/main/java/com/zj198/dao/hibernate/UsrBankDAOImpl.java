package com.zj198.dao.hibernate;

import java.util.List;

import org.hibernate.Query;

import com.zj198.dao.UsrBankDAO;
import com.zj198.model.UsrBank;

public class UsrBankDAOImpl extends HibernateDAO<UsrBank, Integer> implements UsrBankDAO {

	@Override
	public UsrBank getByUid(Integer uid) {
		String hql="from UsrBank as model where model.userid=:uid";
		Query query = this.getSession().createQuery(hql);
		query.setParameter("uid", uid);
		List<UsrBank> list = query.list();
		if(list.size()==1){
			return list.get(0);
		}
		return null;
	}
	public List<UsrBank> findAllBank(){
		return this.findAll();
	}


}
