package com.zj198.action.serviceInfo;

import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.transaction.annotation.Transactional;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.AdmUser;
import com.zj198.model.DicUsertype;
import com.zj198.model.DicCommon;
import com.zj198.model.SinItem;
import com.zj198.model.SinOrder;
import com.zj198.model.SinType;
import com.zj198.model.UsrCompany;
import com.zj198.model.UsrServiceorg;
import com.zj198.model.UsrUser;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.sin.ServiceInfoService;
import com.zj198.service.user.ProfileService;
import com.zj198.util.Constants;
import com.zj198.util.Pagination;

public class ServiceInfoAction extends BaseAction  implements Action{
	
	private static int pageSize = 5;
	
	
	private Integer typeId;
	private Integer itemId;
	private Integer orderId;
	
	private SinType sinType;
	private SinItem sinItem;
	private SinOrder sinOrder;
	private List<SinType> sinTypeList;
	private List<SinItem> sinItemList;
	private List<SinOrder> sinOrderList;
	
	private List<DicCommon> serviceLevelList;
	
	private Integer orderStatus;
	
	/**服务评价*/
	private Integer serviceLevel;
	private String assessment;
	private String serviceLevelDesc;
	
	/**取消服务*/
	private Integer isCancelled;
	
	private Map<String,List<DicCommon>> dataMap;
	private DictoryDataService dictoryDataService;
	private ServiceInfoService serviceInfoService;
	private UsrServiceorg usrServiceorg;
	private String companyName;
	private ProfileService profileService;
	private Pagination pagination;
	private int pageNo=1;
	
	
	
	@Override
	public String execute() throws Exception {
		sinTypeList=serviceInfoService.findSinTypeList();
		return "serviceCenter";
	}
	
	/** 服务信息首页*/
	public String serviceCenter(){
		  sinTypeList=serviceInfoService.findSinTypeList();
		return "serviceCenter";
	}
	
	public String editType(){
		sinType=serviceInfoService.getSinTypeById(typeId);
		return "serviceAdd";
	}
	/**
	 * 增加服务类型
	 * @return
	 */
	public String addType(){
		sinType=new SinType();
		return "serviceAdd";
	}
	/**
	 * 保存服务类型
	 * @return
	 */
	public String saveType(){
		serviceInfoService.saveSinType(sinType);
		return serviceCenter();
	}
	/**
	 * 删除某种服务类型
	 * @return
	 */
	public String deleteType(){
		serviceInfoService.deleteSinType(sinType);
		return SUCCESS;
	}
	/**
	 * 服务信息
	 * @return
	 */
	public String findInfo(){
	    sinItemList=serviceInfoService.findSinItemByType(typeId);
		return "serviceInfoList";
	}
	/**
	 * 增加服务信息
	 * @return
	 */
	public String addInfo(){
		/*取得当前用户*/
		ActionContext context = ActionContext.getContext();	
		UsrUser user = (UsrUser)context.getSession().get("_user");
		usrServiceorg=(UsrServiceorg)profileService.getProfiles(user.getId());
		
		/*取得FORM所用的参数*/
		sinTypeList=serviceInfoService.findSinTypeList();
		dataMap = new HashMap<String,List<DicCommon>>();
		dataMap.put("area", dictoryDataService.findCommonDataByGroupId(30));
		dataMap.put("obj", dictoryDataService.findCommonDataByGroupId(31));
		
		/*设定默认值*/
		sinItem=new SinItem();
		sinItem.setContactId(user.getId());
		sinItem.setContactName(user.getRealname());
		sinItem.setCompanyId(usrServiceorg.getUserid());
		sinItem.setCompanyName(usrServiceorg.getOrgname());
		sinItem.setIssuedDate(Calendar.getInstance().getTime());
		sinItem.setDeletedFlag(Short.valueOf("0"));
		sinItem.setIsAuthenticated(Short.valueOf("0"));
		sinItem.setIsCancelled(Short.valueOf("0"));
		sinItem.setApplyCount(0);
		return "serviceAddInfo";
	}
	/**
	 * 保存服务信息
	 * @return
	 */
	public String saveInfo(){
		typeId=sinItem.getTypeId();
		serviceInfoService.saveSinItem(sinItem);
		return this.showServiceInfoHomeByPublisher();
	}
	/**编辑服务信息*/
	public String editInfo(){
		ActionContext context = ActionContext.getContext();	
		UsrUser user = (UsrUser)context.getSession().get("_user");
		usrServiceorg=(UsrServiceorg)profileService.getProfiles(user.getId());
		companyName=usrServiceorg.getOrgname();
		sinTypeList=serviceInfoService.findSinTypeList();
		dataMap = new HashMap<String,List<DicCommon>>();
		dataMap.put("area", dictoryDataService.findCommonDataByGroupId(30));
		dataMap.put("obj", dictoryDataService.findCommonDataByGroupId(31));
		sinItem=serviceInfoService.getSinItemById(sinItem.getId());
		return "serviceAddInfo";
	}
	/**删除服务信息*/
	public String deleteInfo(){
		typeId=sinItem.getTypeId();
		serviceInfoService.deleteSinItem(sinItem);
		return "successInfo";
	}
	
	/**未登录用户可以看到的服务信息*/
	@SuppressWarnings("unchecked")
	public String showServiceItemHome(){
		if (typeId == null) {
			typeId = 0;
		}
		Map<String, Object> map = this.serviceInfoService.findServiceItemByAvailable(typeId, pageSize, pageNo);
		this.sinTypeList = this.serviceInfoService.findSinTypeList();
		this.sinItemList = (List<SinItem>) map.get("list");
		this.pagination = (Pagination) map.get("pagination");
		return "serviceItemHome";
	}
	
	/**取消服务信息(只有没经过审核的服务信息才可以被取消)*/
	public String cancelSinItem(){
		HttpServletResponse response = ServletActionContext.getResponse();
		boolean result = false;
		sinItem = this.serviceInfoService.getSinItemById(Integer.valueOf(itemId));
		if (sinItem != null) {
			try {
				sinItem.setIsCancelled(this.isCancelled.shortValue());
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

	
	/**信息发布者所用的信息服务Home*/
	@SuppressWarnings("unchecked")
	public String showServiceInfoHomeByPublisher() {
		ActionContext context = ActionContext.getContext();	
		UsrUser user = (UsrUser)context.getSession().get("_user");
		Map<String, Object> map = this.serviceInfoService.findServiceItemByPublisher(user.getId(), pageSize, pageNo);
		this.sinItemList = (List<SinItem>) map.get("list");
		this.pagination = (Pagination) map.get("pagination");
		return "serviceItemHome4Publisher";
	}
	
	/**企业或个人申请服务*/
	@Transactional
	public String applyService() throws IOException {
		ActionContext context = ActionContext.getContext();	
		UsrUser user = (UsrUser)context.getSession().get("_user");
		
			HttpServletResponse response = ServletActionContext.getResponse();
			if (null == user) {
				response.getWriter().write("{\"status\":\"failure\", \"info\":\"login\"}");
			} else {
				DicUsertype userType = this.dictoryDataService.getDicUserTypeById(user.getType());
				int group = userType.getGroup();
				if (group == Constants.USERTYPE_GROUP_PERSONAL || group == Constants.USERTYPE_GROUP_COMPANY) { 
					
					sinItem = serviceInfoService.getSinItemById(itemId);
					SinOrder order = new SinOrder();
					order.setApplyDate(Calendar.getInstance().getTime());
					order.setContactId(user.getId());
					order.setContactName(user.getRealname());
					order.setItemId(itemId);
					order.setItemTitle(sinItem.getTitle());
					order.setItemTypeId(sinItem.getTypeId());
					order.setItemTypeName(sinItem.getTypeName());
					order.setStatus(Short.valueOf("0"));
					order.setServiceNo(sinItem.getServiceNo());
					order.setVendorId(sinItem.getCompanyId());
					order.setVendorName(sinItem.getCompanyName());
					
					if (group == Constants.USERTYPE_GROUP_COMPANY) {
						UsrCompany org = (UsrCompany) profileService.getProfiles(user.getId());
						order.setOrgId(org.getUserid());
						order.setOrgName(org.getCompanyname());
					}
					
					if (group == Constants.USERTYPE_GROUP_PERSONAL) {
						order.setOrgId(user.getId());
						order.setOrgName(user.getRealname());
					}
					serviceInfoService.saveSinOrder(order);
					sinItem.setApplyCount(sinItem.getApplyCount()+1);
					serviceInfoService.saveSinItem(sinItem);
					response.getWriter().write("{\"status\":\"success\", \"redirect\":\"\"}");
				} else {
					response.getWriter().write("{\"status\":\"failure\", \"info\":\"you can\'t apply this service.\"}");
				}
				
			}
		return null;
	}

	/**显示信息发布者收到的服务订单*/
	@SuppressWarnings("unchecked")
	public String showPublisherOrders() {
		ActionContext context = ActionContext.getContext();	
		UsrUser user = (UsrUser)context.getSession().get("_user");
		Map<String, Object> map = this.serviceInfoService.findSinOrderByPublisher(user.getId(), pageSize, pageNo);
		this.sinOrderList = (List<SinOrder>) map.get("list");
		this.pagination = (Pagination) map.get("pagination");
		return "publisherOrders";
	}
	
	/**申请人所申请的订单*/
	@SuppressWarnings("unchecked")
	public String showSinOrdersByApplicant(){
		this.serviceLevelList = this.dictoryDataService.findCommonDataByGroupId(40);
		ActionContext context = ActionContext.getContext();	
		UsrUser user = (UsrUser)context.getSession().get("_user");
		Map<String, Object> map = this.serviceInfoService.findSinOrdersByApplicant(user.getId(), pageSize, pageNo);
		this.sinOrderList = (List<SinOrder>) map.get("list");
		this.pagination = (Pagination) map.get("pagination");
		return "applicantOrders";
	}
	
	/**显示服务信息明细*/
	public String showSinItemDetail() {
		this.sinItem = this.serviceInfoService.getSinItemById(itemId);
		return "siDetail";
	}
	
	/**显示订单详细信息*/
	public String showSinOrderDetail() {
		this.sinOrder = this.serviceInfoService.getSinOrderById(orderId);
		return "siOrderDetail";
	}
	
	/**改变订单状态*/
	public String changeOrderStatus()  throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		String result = "{\"status\":\"failure\",\"msg\":\"操作失败\"}";
		try {
			this.sinOrder = this.serviceInfoService.getSinOrderById(orderId);
			ActionContext context = ActionContext.getContext();	
			UsrUser user = (UsrUser)context.getSession().get("_user");
			sinOrder.setStatus(this.orderStatus.shortValue());
			sinOrder.setLastModifiedBy(user.getRealname());
			sinOrder.setLastModifiedDate(Calendar.getInstance().getTime());
			this.serviceInfoService.saveSinOrder(sinOrder);
			result = "{\"status\":\"success\",\"msg\":\"操作成功\"}";
		} catch (Exception e) {
			
		}
		response.getWriter().write(result);
		return null;
	}
	
	/**评价*/
	public String doAssessment() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		String result = "{\"status\":\"success\",\"msg\":\"操作成功\"}";
		this.sinOrder = this.serviceInfoService.getSinOrderById(orderId);
		this.sinOrder.setServiceLevel(serviceLevel);
		this.sinOrder.setServiceLevelDesc(serviceLevelDesc);
		this.sinOrder.setAssessment(assessment);
		this.sinOrder.setStatus(Short.valueOf("2"));
		this.serviceInfoService.saveSinOrder(sinOrder);
		response.setContentType("");
		response.getWriter().write(result);
		return null;
	}
	
	//get and set
	public void setServiceInfoService(ServiceInfoService serviceInfoService) {
		this.serviceInfoService = serviceInfoService;
	}
	public void setUsrServiceorg(UsrServiceorg usrServiceorg) {
		this.usrServiceorg = usrServiceorg;
	}
	public Map<String, List<DicCommon>> getDataMap() {
		return dataMap;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	public Integer getTypeId() {
		return typeId;
	}
	public SinItem getSinItem() {
		return sinItem;
	}
	public void setSinItem(SinItem sinItem) {
		this.sinItem = sinItem;
	}
	public List<SinItem> getSinItemList() {
		return sinItemList;
	}
	public SinType getSinType() {
		return sinType;
	}
	public void setSinType(SinType sinType) {
		this.sinType = sinType;
	}
	public List<SinType> getSinTypeList() {
		return sinTypeList;
	}
	public Pagination getPagination() {
		return pagination;
	}
	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public ProfileService getProfileService() {
		return profileService;
	}
	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}
	public DictoryDataService getDictoryDataService() {
		return dictoryDataService;
	}

	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}

	public List<SinOrder> getSinOrderList() {
		return sinOrderList;
	}

	public void setSinOrderList(List<SinOrder> sinOrderList) {
		this.sinOrderList = sinOrderList;
	}

	public SinOrder getSinOrder() {
		return sinOrder;
	}

	public void setSinOrder(SinOrder sinOrder) {
		this.sinOrder = sinOrder;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getAssessment() {
		return assessment;
	}

	public void setAssessment(String assessment) {
		this.assessment = assessment;
	}

	public List<DicCommon> getServiceLevelList() {
		return serviceLevelList;
	}

	public void setServiceLevelList(List<DicCommon> serviceLevelList) {
		this.serviceLevelList = serviceLevelList;
	}

	public Integer getServiceLevel() {
		return serviceLevel;
	}

	public void setServiceLevel(Integer serviceLevel) {
		this.serviceLevel = serviceLevel;
	}

	public String getServiceLevelDesc() {
		return serviceLevelDesc;
	}

	public void setServiceLevelDesc(String serviceLevelDesc) {
		this.serviceLevelDesc = serviceLevelDesc;
	}

	public Integer getIsCancelled() {
		return isCancelled;
	}

	public void setIsCancelled(Integer isCancelled) {
		this.isCancelled = isCancelled;
	}
	
	

}
