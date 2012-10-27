package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.KnwContentDAO;
import com.zj198.model.KnwContent;

public class KnwContentDAOImpl extends HibernateDAO<KnwContent, Integer> implements KnwContentDAO {

	@SuppressWarnings("unchecked")
	@Override
	public List<KnwContent> findKnwContentByTitle(Integer titleId) {
		String hql ="from KnwContent where titleId = :titleId";
		params.put("titleId", titleId);
		return super.findByHQL(hql, params);
	}

	@Override
	public KnwContent getKnwContentByPageId(int titleId, int pageId) {
		KnwContent result = null;
		String hql = "from KnwContent where titleId = :titleId and pageId = :pageId";
		params.put("titleId", titleId);
		params.put("pageId", pageId);
		@SuppressWarnings("unchecked")
		List<KnwContent> list = super.findByHQL(hql, params);
		if (list.size()==1) {
			result = list.get(0);
		}
		return result;
	}
}
