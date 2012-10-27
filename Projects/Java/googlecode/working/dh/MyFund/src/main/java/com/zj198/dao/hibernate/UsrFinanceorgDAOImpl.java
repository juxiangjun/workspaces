package com.zj198.dao.hibernate;

import java.util.List;

import org.hibernate.Query;

import com.zj198.dao.UsrFinanceorgDAO;
import com.zj198.model.UsrFinanceorg;

public class UsrFinanceorgDAOImpl extends HibernateDAO<UsrFinanceorg, Integer> implements UsrFinanceorgDAO {

	@Override
	public UsrFinanceorg getByUid(Integer uid) {
		String hql="from UsrFinanceorg as model where model.userid=:uid";
		Query query = this.getSession().createQuery(hql);
		query.setParameter("uid", uid);
		List<UsrFinanceorg> list = query.list();
		if(list.size()==1){
			return list.get(0);
		}
		return null;
	}

}
