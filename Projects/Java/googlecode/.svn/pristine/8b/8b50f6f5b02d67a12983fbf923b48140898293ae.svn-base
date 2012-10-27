package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.KnwTypeDAO;
import com.zj198.model.KnwTitle;
import com.zj198.model.KnwType;

public class KnwTypeDAOImpl extends HibernateDAO<KnwType, Integer> implements KnwTypeDAO {

	@SuppressWarnings("unchecked")
	@Override
	public List<KnwType> findHomePageNewsType() {
		String hql = "from KnwType where showOnPage = '首页新闻组'";
		return this.findByHQL(hql, null);
	}

}
