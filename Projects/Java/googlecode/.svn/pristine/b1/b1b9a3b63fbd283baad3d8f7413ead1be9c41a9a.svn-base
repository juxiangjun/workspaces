package com.zj198.dao;

import java.util.Map;

import com.zj198.model.SinOrder;

public interface SinOrderDAO extends BaseDAO<SinOrder, Integer> {

	/**保存服务申请订单*/
	public void saveSinOrder(SinOrder instance);
	
	/**按发布者查询已申请的订单*/
	public Map<String, Object> findSinOrderByPublisher(int contactId,
			int pageSize, int pageNo);
	
	/**按申请者查询服务订单*/
	public Map<String, Object> findSinOrdersByApplicant(int userId, int pageSize, int pageNo);
	
}
