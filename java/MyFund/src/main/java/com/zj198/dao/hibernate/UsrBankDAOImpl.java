package com.zj198.dao.hibernate;

import java.util.Hashtable;
import java.util.List;

import com.zj198.dao.UsrBankDAO;
import com.zj198.model.UsrBank;

public class UsrBankDAOImpl extends HibernateDAO<UsrBank, Integer> implements UsrBankDAO {

	@Override
	public UsrBank getByUid(Integer uid) {
		String hql="from UsrBank as model where model.userid=:uid";
		List<UsrBank> list = list(hql,"uid", uid);
		if(list.size()==1){
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<UsrBank> findUsrBanksByName(String name) {
		String hql = "select t from UsrBank t, UsrUser t1 where t.userid=t1.id and t1.auditstatus=2";
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		if(name != null && name.length() > 0){
			hql += " and t.detailname like :name";
			params.put("name", "%"+name+"%");
		}
		return this.list(hql, params);
	}

}
