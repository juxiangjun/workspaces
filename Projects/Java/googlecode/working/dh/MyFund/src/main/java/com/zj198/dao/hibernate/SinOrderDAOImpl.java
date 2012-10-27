package com.zj198.dao.hibernate;

import java.util.Hashtable;
import java.util.Map;

import com.zj198.dao.SinOrderDAO;
import com.zj198.model.SinOrder;

public class SinOrderDAOImpl extends HibernateDAO<SinOrder, Integer> implements SinOrderDAO {

	@Override
	public void saveSinOrder(SinOrder instance) {
		super.saveOrUpdate(instance);
	}

	@Override
	public Map<String, Object> findSinOrderByPublisher(int contactId,
			int pageSize, int pageNo) {
		String hql = "from SinOrder where itemId in (select id from SinItem where contactId= :contactId) order by applyDate desc";
		params = new Hashtable<String, Object>();
		params.put("contactId", contactId);
		return super.findByHqlOfMap(hql, params, pageSize, pageNo);
	}
	
	/**按申请者查询服务订单*/
	public Map<String, Object> findSinOrdersByApplicant(int userId, int pageSize, int pageNo){
		String hql = "from SinOrder where orgId = :userId  order by applyDate desc";
		params = new Hashtable<String, Object>();
		params.put("userId", userId);
		return super.findByHqlOfMap(hql, params, pageSize, pageNo);
	}

}
