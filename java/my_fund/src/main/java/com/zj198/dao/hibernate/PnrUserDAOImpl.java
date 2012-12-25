package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.PnrUserDAO;
import com.zj198.model.PnrUser;

public class PnrUserDAOImpl extends HibernateDAO<PnrUser, Integer> implements PnrUserDAO{
	public PnrUser findPnrUserByName(String userName){
		String hql = "from PnrUser t where t.status=0 and t.userName=:userName";
		List<PnrUser> list = this.list(hql, "userName", userName);
		if(list != null && list.size() > 0){
			return list.get(0);
		}else{
			return null;
		}
	}
}
