package com.zj198.service.sin;

import java.util.List;
import java.util.Map;

import com.zj198.model.SinItem;
import com.zj198.model.SinOrder;
import com.zj198.model.SinType;

public interface ServiceInfoService {
	/*** 服务类型 通过id获得服务类型* @param id* @return */
	public SinType getSinTypeById(Integer id);
	/*** 服务类型  列表* @return*/
	public List<SinType> findSinTypeList();
	/*** 服务类型  保存* @param instance*/
	public void saveSinType(SinType instance);
	/*** 服务类型  删除* @param instance*/
	public void deleteSinType(SinType instance);
	
	/*** 服务信息  一条* @param id* @return*/
	public SinItem getSinItemById(Integer id);
	/*** 根据某种服务类型返回 服务详细信息  list* @param typeId * @return*/
	public List<SinItem> findSinItemByType(Integer typeId);
	/** 服务信息  保存 @param instance */
	public void saveSinItem(SinItem instance);
	/** 服务信息  删除一条*/
	public void deleteSinItem(SinItem instance);
	/**最近发布的服务信息*/
	public List<SinItem> findSinItemByRecentN(int n);
	
	/**获取可用服务信息*/
	public Map<String, Object> findServiceItemByAvailable(int typeId, int pageSize, int pageNo);
	
	/**保存服务申请订单*/
	public void saveSinOrder(SinOrder instance);
	
	/**获取未经审核的服务信息*/
	public Map<String, Object> findUnauthorizedServiceInfo(int pageSize, int pageNo);
	
	/**按发布者查询*/
	public Map<String, Object> findServiceItemByPublisher(int contactId, int pageSize, int pageNo);
	
	/**按发布者查询已申请的订单*/
	public Map<String, Object> findSinOrderByPublisher(int contactId, int pageSize, int pageNo);
	
	/**按申请者查询服务订单*/
	public Map<String, Object> findSinOrdersByApplicant(int userId, int pageSize, int pageNo);
	
	/**获取订单明细*/
	public SinOrder getSinOrderById(Integer id);
	
}
