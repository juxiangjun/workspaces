package com.zj198.dao.hibernate;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import com.zj198.dao.KnwTitleDAO;
import com.zj198.model.KnwTitle;

public class KnwTitleDAOImpl extends HibernateDAO<KnwTitle, Integer> implements KnwTitleDAO {
	
	@Override
	public Map<String, Object> findKnwTitleByType(Integer typeId, int pageSize,
			int pageNo) {
		params = new Hashtable<String, Object>();
		String hql = "from KnwTitle";
		if (typeId != null && typeId>0) {
			 hql = hql + " where typeId = :typeId";
			 params.put("typeId", typeId);
		}
		
		hql = hql + " order by issuedDate desc";
		return super.findByHqlOfMap(hql, params, pageSize, pageNo);
	}

	@Override
	public Map<String, Object> findUnAuthenticatedList(int pageSize, int pageNo) {
		Short isAuthenticated= Short.valueOf("0");
		String hql = "from KnwTitle where isAuthenticated = :isAuthenticated";
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		params.put("isAuthenticated", isAuthenticated);
		return super.findByHqlOfMap(hql, params, pageSize, pageNo);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<KnwTitle> findKnwTitleByType(Integer typeId) {
		String hql = "from KnwTitle where typeId = :typeId";
		params.put("typeId", typeId);
		return super.findByHQL(hql, params);
	}

}
