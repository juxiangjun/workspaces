package com.zj198.dao.hibernate;

import java.util.List;

import org.hibernate.Query;

import com.zj198.dao.DicCommonDAO;
import com.zj198.model.DicCommon;

public class DicCommonDAOImpl extends HibernateDAO<DicCommon, Integer> implements DicCommonDAO{

	@Override
	public List<DicCommon> findByGroupId(int groupid) {
		String hql="from DicCommon as model where model.group=:groupid";
		Query query = this.getSession().createQuery(hql);
		query.setParameter("groupid", groupid);
		return query.list();
	}
	
	public List<DicCommon> findByIds(String ids) {
        String hql = "from DicCommon as model where model.id in (" + ids + ")";
		Query query = this.getSession().createQuery(hql);
        // query.setParameter("ids", ids);
		return query.list();
	}
	
}
