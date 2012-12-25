package com.zj198.dao.hibernate;

import java.util.Hashtable;
import java.util.List;

import com.zj198.dao.OrdCheckRecordApplyDAO;
import com.zj198.model.OrdCheckRecordApply;

public class OrdCheckRecordApplyDAOImpl extends HibernateDAO<OrdCheckRecordApply, Integer> implements OrdCheckRecordApplyDAO {

	public OrdCheckRecordApply getByAppIdAndId(Integer appId, Integer id) {
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		params.put("appId", appId);
		params.put("id", id);
		List<OrdCheckRecordApply> l = this.listByTable("from OrdCheckRecordApply o where o.applyId=:appId and o.crId=:id", params);
		if (l != null && l.size() > 0) {
			return l.get(0);
		} else {
			return null;
		}
	}
	
	public List<OrdCheckRecordApply> getByAppIdAndTypeid(Integer appId, Integer id) {
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		params.put("appId", appId);
		params.put("id", id);
		List<OrdCheckRecordApply> l = this.listByTable("from OrdCheckRecordApply o where o.applyId=:appId and o.crType=:id", params);
		return l;
	}
}
