package com.zj198.service.sin.impl;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.dao.SinItemDAO;
import com.zj198.dao.SinOrderDAO;
import com.zj198.dao.SinTypeDAO;
import com.zj198.model.SinItem;
import com.zj198.model.SinOrder;
import com.zj198.model.SinType;
import com.zj198.model.UsrUser;
import com.zj198.util.OrderNOCreator;

public class ServiceInfoServiceImpl implements
		com.zj198.service.sin.ServiceInfoService {

	private SinTypeDAO sinTypeDAO;
	private SinItemDAO sinItemDAO;
	private SinOrderDAO sinOrderDAO;

	/**按申请者查询服务订单*/
	public Map<String, Object> findSinOrdersByApplicant(int userId, int pageSize, int pageNo){
		return sinOrderDAO.findSinOrdersByApplicant(userId, pageSize, pageNo);
	}
	@Override
	public Map<String, Object> findSinOrderByPublisher(int contactId,
			int pageSize, int pageNo) {
		return this.sinOrderDAO.findSinOrderByPublisher(contactId, pageSize, pageNo);
	}

	@Override
	public Map<String, Object> findServiceItemByPublisher(int contactId, int pageSize,
			int pageNo) {
		return this.sinItemDAO.findByPublisher(contactId, pageSize, pageNo);
	}
	
	@Override
	public Map<String, Object> findUnauthorizedServiceInfo(int pageSize,
			int pageNo) {
		return this.sinItemDAO.findUnauthorizedServiceInfo(pageSize, pageNo);
	}
	
	@Override
	public Map<String, Object> findServiceItemByAvailable(int typeId, int pageSize, int pageNo) {
		return this.sinItemDAO.findServiceItemByAvailable(typeId, pageSize, pageNo);
	}

	@Override
	public void saveSinOrder(SinOrder instance) {
		if (instance.getId() == null) {
			this.sinOrderDAO.save(instance);
			instance.setOrderNo(OrderNOCreator.getServiceOrderNumber(instance.getId()));
			this.sinOrderDAO.update(instance);
		} else {
			this.sinOrderDAO.update(instance);
		}
	}
	
	@Override
	public SinType getSinTypeById(Integer id) {
		return this.sinTypeDAO.get(id);
	}

	@Override
	public List<SinType> findSinTypeList() {
		return this.sinTypeDAO.findAll();
	}

	@Override
	public void saveSinType(SinType instance) {
		ActionContext ctx = ActionContext.getContext();
		UsrUser user = (UsrUser)ctx.getSession().get("_user");
		if(instance.getId()== null){
			instance.setIsCancelled((short)0);
			instance.setLastModifiedBy(user.getUsername());
			instance.setLastModifiedDate(Calendar.getInstance().getTime());
			instance.setCreatedDate(Calendar.getInstance().getTime());
			sinTypeDAO.save(instance);
		}else{
			instance.setLastModifiedBy(user.getUsername());
			instance.setLastModifiedDate(Calendar.getInstance().getTime());
			sinTypeDAO.update(instance);
		}
	}

	@Override
	public void deleteSinType(SinType instance) {
		this.sinTypeDAO.deleteObject(instance);
	}

	@Override
	public SinItem getSinItemById(Integer id) {
		return this.sinItemDAO.get(id);
	}
	
	

	@Override
	public List<SinItem> findSinItemByType(Integer typeId) {
		return this.sinItemDAO.findSinItemByType(typeId);
	}

	@Override
	public void saveSinItem(SinItem instance) {
//		ActionContext ctx = ActionContext.getContext();
//		UsrUser user = (UsrUser)ctx.getSession().get("_user");
		if(instance.getId()==null){
			instance.setIsCancelled((short)0);
			//instance.setCompanyId(user.getId());
			instance.setIsAuthenticated((short) 0);
			//instance.setLastModifiedBy(user.getUsername());
			instance.setLastModifiedDate(Calendar.getInstance().getTime());
			instance.setCreatedDate(Calendar.getInstance().getTime());
			sinItemDAO.save(instance);
			
			String serviceNo = OrderNOCreator.getServiceInfoNumber(instance.getId());
			instance.setServiceNo(serviceNo);
			sinItemDAO.update(instance);
			
		}else{
			instance.setLastModifiedDate(Calendar.getInstance().getTime());
			sinItemDAO.update(instance);
		}
	}

	@Override
	public void deleteSinItem(SinItem instance) {
		this.sinItemDAO.deleteObject(instance);
	}

	@Override
	public List<SinItem> findSinItemByRecentN(int n) {
		return this.sinItemDAO.findSinItemByRecentN(n);
	}

	public SinTypeDAO getSinTypeDAO() {
		return sinTypeDAO;
	}

	public void setSinTypeDAO(SinTypeDAO sinTypeDAO) {
		this.sinTypeDAO = sinTypeDAO;
	}

	public SinItemDAO getSinItemDAO() {
		return sinItemDAO;
	}

	public void setSinItemDAO(SinItemDAO sinItemDAO) {
		this.sinItemDAO = sinItemDAO;
	}

	public SinOrderDAO getSinOrderDAO() {
		return sinOrderDAO;
	}

	public void setSinOrderDAO(SinOrderDAO sinOrderDAO) {
		this.sinOrderDAO = sinOrderDAO;
	}
	@Override
	public SinOrder getSinOrderById(Integer id) {
		// TODO Auto-generated method stub
		return this.sinOrderDAO.get(id);
	}

	

	
}
