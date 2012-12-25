package com.zj198.dao.hibernate;

import java.util.Hashtable;
import java.util.List;

import com.zj198.dao.UsrFinanceorgDAO;
import com.zj198.model.UsrFinanceorg;

public class UsrFinanceorgDAOImpl extends HibernateDAO<UsrFinanceorg, Integer> implements UsrFinanceorgDAO {

	@Override
	public UsrFinanceorg getByUid(Integer uid) {
		String hql="from UsrFinanceorg as model where model.userid=:uid";
		List<UsrFinanceorg> list = list(hql,"uid", uid);
		if(list.size()==1){
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<UsrFinanceorg> findUsrFinanceOrgsByName(String name) {
		String hql = "from UsrFinanceorg where orgname like :name";
		return this.list(hql, "name", "%"+name+"%");
	}

	public List<UsrFinanceorg> findUsrFinanceOrgs(String name, Integer[] types){
		String t = "";
		for(int i = 0; i<types.length; i++){
			t += types[i];
			if(i != types.length - 1){
				t += ",";
			}
		}
		String hql = "select t from UsrFinanceorg t, UsrUser t1 where t.userid=t1.id and t1.auditstatus=2";
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		if(name != null && name.length() > 0){
			hql += " and t.orgname like :name";
			params.put("name", "%"+name+"%");
		}
		if(types != null && types.length > 0){
			hql += " and t1.type in (" + t + ")";
		}
		return this.list(hql, params);
	}
}
