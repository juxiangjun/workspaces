package com.zj198.action.admin.authorize;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.AdmUser;
import com.zj198.model.SinItem;
import com.zj198.service.sin.ServiceInfoService;
import com.zj198.util.Pagination;

public class ServiceInfoAuthorizeAction extends BaseAction {

	private static int pageSize = 20;
	private int pageNo = 1 ;
	private Pagination pagination;
	
	/**信息服务*/
	private ServiceInfoService serviceInfoService;
	private Integer itemId;
	private SinItem sinItem;
	private String isAuthenticated;
	private List<SinItem> sinItemList;
	
	/**显示未审核的服务信息*/
	@SuppressWarnings("unchecked")
	public String showUnauthorizedServiceInfo(){
		Map<String, Object> map = this.serviceInfoService.findUnauthorizedServiceInfo(pageSize, pageNo);
		this.sinItemList = (List<SinItem>) map.get("list");
		this.pagination = (Pagination) map.get("pagination");
		return "unauthorizedServiceInfo";
	}
	
	/**显示服务信息详情*/
	public String showDetail(){
		this.sinItem = this.serviceInfoService.getSinItemById(itemId);
		return "siDetail";
	}
	
	/**审核服务方发布的服务信息*/
	public String authorizeServiceInfo(){
		HttpServletResponse response = ServletActionContext.getResponse();
		ActionContext context = ActionContext.getContext();	
		AdmUser admin = (AdmUser)context.getSession().get("_admin");
		
		boolean result = false;
		sinItem = this.serviceInfoService.getSinItemById(Integer.valueOf(itemId));
		if (sinItem != null) {
			try {
				sinItem.setAuthorizedDate(Calendar.getInstance().getTime());
				sinItem.setAuthorizedBy(admin.getRealname());
				sinItem.setIsAuthenticated(Short.valueOf(isAuthenticated));
				this.serviceInfoService.saveSinItem(sinItem);
				result = true;
			} catch (Exception e) {
				
			}
		} 
		
		try {
			if (result) {
				response.getWriter().write("{\"status\":\"success\"}");
			} else {
				response.getWriter().write("{\"status\":\"failure\"}");
			}
		} catch (Exception e) {
			
		}
		return null;
	}

	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	public ServiceInfoService getServiceInfoService() {
		return serviceInfoService;
	}


	public void setServiceInfoService(ServiceInfoService serviceInfoService) {
		this.serviceInfoService = serviceInfoService;
	}


	public Integer getItemId() {
		return itemId;
	}


	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}


	public SinItem getSinItem() {
		return sinItem;
	}


	public void setSinItem(SinItem sinItem) {
		this.sinItem = sinItem;
	}


	public String getIsAuthenticated() {
		return isAuthenticated;
	}


	public void setIsAuthenticated(String isAuthenticated) {
		this.isAuthenticated = isAuthenticated;
	}



	public int getPageNo() {
		return pageNo;
	}



	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}



	public Pagination getPagination() {
		return pagination;
	}



	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}



	public List<SinItem> getSinItemList() {
		return sinItemList;
	}



	public void setSinItemList(List<SinItem> sinItemList) {
		this.sinItemList = sinItemList;
	}
	
	

}
