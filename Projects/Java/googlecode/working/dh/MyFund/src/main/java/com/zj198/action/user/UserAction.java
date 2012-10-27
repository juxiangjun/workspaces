package com.zj198.action.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.DicCommon;
import com.zj198.model.DicUsertype;
import com.zj198.model.SinItem;
import com.zj198.model.SinOrder;
import com.zj198.model.UsrLoginhistory;
import com.zj198.model.UsrUser;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.sin.ServiceInfoService;
import com.zj198.service.user.AccountService;
import com.zj198.service.user.ProfileService;
import com.zj198.util.Constants;
import com.zj198.util.Pagination;

public class UserAction extends BaseAction {
	
	/**用户中心首页中所取的每项数据记录数*/
	private static Integer pageSize = 5;
	
	private Short userType;
	private String typeName;
	private AccountService accountService;
	private ProfileService profileService;
	private UsrLoginhistory usrLoginhistory;
	private DictoryDataService dictoryDataService;
    private Map<Integer, List<DicUsertype>> map;
    
    /**用户申请的服务订单*/
    private ServiceInfoService serviceInfoService;
    private List<SinOrder> sinOrderList;
    
    private List<DicCommon> serviceLevelList;
    
    /**用户已发布的服务信息*/
    private List<SinItem> sinItemList;
    private Pagination pagination;
    
	/**
	 * 用户中心首页
	 */
	@Override
	public String execute(){
		ActionContext context = ActionContext.getContext();	
		UsrUser user = (UsrUser)context.getSession().get("_user");
		usrLoginhistory=profileService.getLoginHistory();
		if(profileService.getProfiles(user.getId())!=null){
			int groupId = profileService.getGroupidByUserType(user.getType());
			List<DicUsertype> list = dictoryDataService.findAllUsertype();
			for (int i=0;i<list.size();i++) {
				if(user.getType()==list.get(i).getId().shortValue()){
					typeName=list.get(i).getName();
					break;
				}
			}
			switch (groupId){
				case Constants.USERTYPE_GROUP_BANK:
					return "bankCenter";
				case Constants.USERTYPE_GROUP_COMPANY:
					
					this.findSinOrderListByApplicant(user);
					return "companyCenter";
				case Constants.USERTYPE_GROUP_FINANCEORG:
					return "financeorgCenter";
				case Constants.USERTYPE_GROUP_PERSONAL:
					this.findSinOrderListByApplicant(user);
					return "personCenter";
				case Constants.USERTYPE_GROUP_SERVICEORG:
					this.findSinOrderListByPublisher(user);
					this.findSinItemListByPublisher(user);
					return "serviceorgCenter";
				}
			}else{
				return "editCenter";
		}
		return ERROR;
	}

	/**
	 * 确定用户类型
	 * @return
	 */
	public String type(){
		if(userType!=null){
			ActionContext context = ActionContext.getContext();	
			UsrUser user = (UsrUser)context.getSession().get("_user");
			if(user.getType()==Constants.USER_TYPE_NULL){ //仅未选择类型的用户才可更新
				if(accountService.updateUserType(user.getId(),userType)==0){
					user.setType(userType);
					context.getSession().put("_user",user);
					return "userCenter";
				}else{
					Map<Integer,List<DicUsertype>> map = dictoryDataService.findAllUerttypeGroupByGroup();
					HttpServletRequest request = ServletActionContext.getRequest();
					request.setAttribute("userTypeMap", map);
					return "chooseType";
				}
			}
		}else{		
			msg="请选择正确的类型。";
			Map<Integer,List<DicUsertype>> map = dictoryDataService.findAllUerttypeGroupByGroup();
			HttpServletRequest request = ServletActionContext.getRequest();
			request.setAttribute("userTypeMap", map);
		    return "chooseType";
		}
		return ERROR;
	}
	
	
	/**取得用户所申请的服务订单*/
	@SuppressWarnings("unchecked")
	private void findSinOrderListByApplicant(UsrUser user) {
		this.serviceLevelList = this.dictoryDataService.findCommonDataByGroupId(40);
		Map<String, Object> map = this.serviceInfoService.findSinOrdersByApplicant(user.getId(), pageSize,1);
		this.sinOrderList = (List<SinOrder>) map.get("list");
		this.pagination = (Pagination) map.get("pagination");
	}
	
	/**取得用户所申请的服务订单*/
	@SuppressWarnings("unchecked")
	private void findSinOrderListByPublisher(UsrUser user) {
		Map<String, Object> map = this.serviceInfoService.findSinOrderByPublisher(user.getId(), pageSize, 1);
		this.sinOrderList = (List<SinOrder>) map.get("list");
		this.pagination = (Pagination) map.get("pagination");
	}
	
	/**取得用户所申请的服务订单*/
	@SuppressWarnings("unchecked")
	private void findSinItemListByPublisher(UsrUser user) {
		Map<String, Object> map = this.serviceInfoService.findServiceItemByPublisher(user.getId(), pageSize, 1);
		this.sinItemList = (List<SinItem>) map.get("list");
		this.pagination = (Pagination) map.get("pagination");
	}
	
	
	
	
	//setter and getter
	public void setUserType(Short userType) {
		this.userType = userType;
	}
	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}
	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}
	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}
	public Map<Integer, List<DicUsertype>> getMap() {
		return map;
	}
	public String getTypeName() {
		return typeName;
	}
	public UsrLoginhistory getUsrLoginhistory() {
		return usrLoginhistory;
	}

	public List<SinOrder> getSinOrderList() {
		return sinOrderList;
	}

	public void setSinOrderList(List<SinOrder> sinOrderList) {
		this.sinOrderList = sinOrderList;
	}

	public ServiceInfoService getServiceInfoService() {
		return serviceInfoService;
	}

	public void setServiceInfoService(ServiceInfoService serviceInfoService) {
		this.serviceInfoService = serviceInfoService;
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

	public List<DicCommon> getServiceLevelList() {
		return serviceLevelList;
	}

	public void setServiceLevelList(List<DicCommon> serviceLevelList) {
		this.serviceLevelList = serviceLevelList;
	}
	
	
}
