package com.zj198.dao.hibernate;

import java.util.List;

import org.hibernate.Query;

import com.zj198.dao.UsrLoginhistoryDAO;
import com.zj198.model.UsrLoginhistory;

public class UsrLoginhistoryDAOImpl extends HibernateDAO<UsrLoginhistory, Integer> implements UsrLoginhistoryDAO {
	@Override
	public UsrLoginhistory getLastByUid(Integer uid){
		String hql="from UsrLoginhistory as model where model.uid=:uid order by model.logindt desc";
		Query query = this.getSession().createQuery(hql);
		query.setMaxResults(1);
		query.setParameter("uid", uid);
		List<UsrLoginhistory> loginHistoryList = query.list();
		if(loginHistoryList.size()==1){
			return loginHistoryList.get(0);
		}
		return null;
	}
}
