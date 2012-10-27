package com.zj198.dao.hibernate;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.zj198.dao.FudBaseDAO;
import com.zj198.model.FudBase;

public class FudBaseDAOImpl extends HibernateDAO<FudBase, String> implements FudBaseDAO {

	@SuppressWarnings("unchecked")
	@Override
	public FudBase getByFudCode(String fundCode) {
		FudBase fudBase = null;
		String hql = "from FudBase where fundcode=:fundCode";
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		params.put("fundCode", fundCode);
		List<FudBase> list = this.findByHQL(hql, params);
		if (list.size() == 1) {
			fudBase = list.get(0);
		}
		return fudBase;
	}
	
	

	@Override
	public List<String> findUniqueFundCompany() {
		String hql = "select distinct(fundcompany) from FudBase where fundcompany is not null";
		List<String> list = this.findByHQL(hql, null);
		return list;
	}



	@Override
	public Map<String, Object> findFudItemsByMultiQuery(String[] query,
			int pageSize, int pageNo) {
		String hql = "from FundBase where 1=1 ";
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		String q0 = query[0];
		
		if (!StringUtils.isBlank(q0) && !q0.equals("全部")) {
			hql = hql + " and type = :type";
			params.put("type", q0);
		}
		
		String q1 = query[1];
		if (!StringUtils.isBlank(q1) && !q1.equals("全部")) {
			hql = hql + " and fundcompany = :fundcompany";
			params.put("fundcompany", q1);
		}
		
		String q2 = query[2];
		if (!StringUtils.isBlank(q2) && !q2.equals("全部")) {
			hql = hql + " and agentcompany = :agentcompany";
			params.put("agentcompany", q2);
		}
		
		return super.findByHqlOfMap(hql, params, pageSize, pageNo);
	}


}
