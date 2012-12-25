package com.zj198.action.admin.loan;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.action.loan.model.FindFinanceAdminSpModel;
import com.zj198.model.AdmUser;
import com.zj198.model.NtyMessageQueue;
import com.zj198.model.OrdLoanAllocation;
import com.zj198.model.OrdLoanRequest;
import com.zj198.model.PrdFinance;
import com.zj198.model.UsrCompany;
import com.zj198.model.UsrPerson;
import com.zj198.model.UsrUser;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.common.NotifyQueueService;
import com.zj198.service.loan.LoanRequestService;
import com.zj198.service.loan.OrdLrRecommendService;
import com.zj198.service.message.NtyMessageService;
import com.zj198.service.message.model.SendWebMsgSpModel;
import com.zj198.service.user.AccountService;
import com.zj198.service.user.ProfileService;
import com.zj198.util.Constants;
import com.zj198.util.FreemarkerUtil;
import com.zj198.util.Pager;
import com.zj198.util.PropertiesUtil;

public class LoanRequestAdminAction extends BaseAction {
	private LoanRequestService loanRequestService;
	private DictoryDataService dictoryDataService;
	private ProfileService profileService;
	private OrdLrRecommendService ordLrRecommendService;// 产品推荐service
	private AccountService accountService;
	private NotifyQueueService notifyQueueService;
	private UsrCompany usrCompany;
	private UsrPerson usrPerson;
	private Map<String,String> profileMap;
	private List<OrdLoanAllocation> loanAllocationList;
	private OrdLoanAllocation loanAllocation;
	private OrdLoanRequest loan;
	private List<PrdFinance> recommendProducts;
	private Integer[] prdIds;
	private Integer[] userIds;
	private UsrUser user;
	// 处理意见
	private String allocationContent;
	// 获取一条融资需求的ID
	private Integer requestId;
	// 分页相关数据
	private FindFinanceAdminSpModel spModel = new FindFinanceAdminSpModel();
	/**
	 * 融资意向查询
	 */
	public String execute() {
		spModel.setPager(this.getPagerObj());
		pager = loanRequestService.getAdminRequest(spModel);
		return "adminRequests";
	}

	private Pager getPagerObj(){
		if(pager==null){
			pager = new Pager();
			pager.setPageCount(10);
			pager.setCurrentPage(1);
		}
		return pager;
	}
	/**
	 * 根据ID获取某一条融资需求的详细信息
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-19| 下午4:25:03
	 * @return
	 */
	public String getRequest() {
		loan = loanRequestService.getOrdDetailById(requestId);
		if(loan.getApplyType().intValue() == 136){//企业经营快速申请
			return viewBusiLoan();
		}else{			
			return viewPersonLoan();
		}
	}
	/**
	 * 企业经营快速申请查看
	 * @return
	 */
	public String viewBusiLoan(){
		usrCompany = (UsrCompany)profileService.getProfiles(loan.getUserId());
		user = accountService.getUserById(loan.getUserId());
		profileMap=new HashMap<String,String>();
		
		if(usrCompany.getIndustryid()!=null && usrCompany.getIndustryid()!=0){
			//所属行业
			profileMap.put("industry", dictoryDataService.getIndustryById(usrCompany.getIndustryid()).getName());
		}
		//企业类型
		profileMap.put("companyType", dictoryDataService.getDicUserTypeById(user.getType().intValue()).getName());
//		profileMap.put("companyType", dictoryDataService.getValueNameById(usrCompany.getEnterprisetypeid()));
		//企业经营地址
		profileMap.put("bizaddress",dictoryDataService.getPCDNameByIds(usrCompany.getBizprovinceid(), usrCompany.getBizcityid(), usrCompany.getBizdistrictid()));
		/**
		 * 资金网已处理
		 */
		if(loan.getApplyStatus().intValue() == Constants.ORD_LOAN_ST_CHECK && loan.getToOrgStatus() != null && loan.getToOrgStatus() == 1){
			List<Integer> proIds = ordLrRecommendService.getByRequestId(loan.getId(), 0);//0:资金网推荐
			if (proIds != null && proIds.size() > 0) {
				recommendProducts = ordLrRecommendService.getListByIds(proIds.toArray());
			}
		}
		/**
		 * 资金方已处理
		 */
		if(loan.getToOrgStatus() != null && loan.getToOrgStatus() == 2){
			loanAllocationList = this.loanRequestService.getLoanAllocation(loan.getId());
		}
		
		return "busi_request_view";
	}
	/**
	 * 个人经营快速申请查看
	 * @return
	 */
	public String viewPersonLoan(){
		usrPerson = (UsrPerson)profileService.getProfiles(loan.getUserId());
		user = accountService.getUserById(loan.getUserId());
		usrPerson.setRealName(user.getRealname());
		profileMap=new HashMap<String,String>();
		profileMap.put("address", dictoryDataService.getPCDNameByIds(usrPerson.getProvinceid(), usrPerson.getCityid(), usrPerson.getDistrictid()));
		if(loan.getRunningTrade() != null && loan.getRunningTrade() !=0){
			profileMap.put("parentIndustry", dictoryDataService.getIndustryById(loan.getRunningTrade()).getName());
		}
		if(loan.getRunningTradeChild()!=null && loan.getRunningTradeChild()!=0){
			profileMap.put("industry", dictoryDataService.getIndustryById(loan.getRunningTradeChild()).getName());//所属行业
		}
		/**
		 * 资金网已处理
		 */
		if(loan.getApplyStatus().intValue() == Constants.ORD_LOAN_ST_CHECK && loan.getToOrgStatus() == 1){
			List<Integer> proIds = ordLrRecommendService.getByRequestId(loan.getId(), 0);//0:资金网推荐
			if (proIds != null && proIds.size() > 0) {
				recommendProducts = ordLrRecommendService.getListByIds(proIds.toArray());
			}
		}
		/**
		 * 资金方已处理
		 */
		if(loan.getApplyStatus().intValue() == Constants.ORD_LOAN_ST_CHECK && loan.getToOrgStatus() == 2){
			loanAllocationList = this.loanRequestService.getLoanAllocation(loan.getId());
		}
		
		return "adminRequest";
	}
	/**
	 * 管理员处理意向单并推荐产品
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-20| 上午11:20:23
	 * @return
	 */
	public String allocation() {
		/**
		 * 更改意向单状态为已处理
		 */
		loan = new OrdLoanRequest();
		loan.setId(requestId);
		loan.setApplyStatus(Constants.ORD_LOAN_ST_CHECK);//已处理
		loan.setToOrgStatus(1);//资金网
		loan.setToOrgMemo(allocationContent);
		ActionContext context = ActionContext.getContext();
		AdmUser user = (AdmUser) context.getSession().get("_admin");
		
		loanRequestService.updateZj198Allocation(loan, user.getId(), prdIds, Constants.ORD_LOAN_RECOMMEND_TYPE_ZJ);
		
		return getRequest();
	}
	public String toOrg(){
		/**
		 * 更改意向单状态为已处理
		 */
		loan = new OrdLoanRequest();
		loan.setId(requestId);
		loan.setApplyStatus(Constants.ORD_LOAN_ST_ORGWAIT);//待金融机构处理
		loan.setToOrgStatus(2);//金融机构
		loan.setToOrgMemo(allocationContent);
		
		ActionContext context = ActionContext.getContext();
		AdmUser user = (AdmUser) context.getSession().get("_admin");
		loanRequestService.updateZj198ToOrg(loan, user.getId(), userIds);
		return getRequest();
	}
	
	//setter and getter
	public void setLoanRequestService(LoanRequestService loanRequestService) {
		this.loanRequestService = loanRequestService;
	}

	public FindFinanceAdminSpModel getSpModel() {
		return spModel;
	}

	public void setSpModel(FindFinanceAdminSpModel spModel) {
		this.spModel = spModel;
	}

	public Integer getRequestId() {
		return requestId;
	}

	public void setRequestId(Integer requestId) {
		this.requestId = requestId;
	}

	public OrdLoanRequest getLoan() {
		return loan;
	}

	public void setLoan(OrdLoanRequest loan) {
		this.loan = loan;
	}

	public List<PrdFinance> getRecommendProducts() {
		return recommendProducts;
	}

	public void setRecommendProducts(List<PrdFinance> recommendProducts) {
		this.recommendProducts = recommendProducts;
	}

	public void setOrdLrRecommendService(OrdLrRecommendService ordLrRecommendService) {
		this.ordLrRecommendService = ordLrRecommendService;
	}

	public UsrCompany getUsrCompany() {
		return usrCompany;
	}

	public void setUsrCompany(UsrCompany usrCompany) {
		this.usrCompany = usrCompany;
	}

	public UsrPerson getUsrPerson() {
		return usrPerson;
	}

	public void setUsrPerson(UsrPerson usrPerson) {
		this.usrPerson = usrPerson;
	}

	public Map<String, String> getProfileMap() {
		return profileMap;
	}

	public void setProfileMap(Map<String, String> profileMap) {
		this.profileMap = profileMap;
	}

	public List<OrdLoanAllocation> getLoanAllocationList() {
		return loanAllocationList;
	}

	public void setLoanAllocationList(List<OrdLoanAllocation> loanAllocationList) {
		this.loanAllocationList = loanAllocationList;
	}

	public OrdLoanAllocation getLoanAllocation() {
		return loanAllocation;
	}

	public void setLoanAllocation(OrdLoanAllocation loanAllocation) {
		this.loanAllocation = loanAllocation;
	}

	public OrdLrRecommendService getOrdLrRecommendService() {
		return ordLrRecommendService;
	}

	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}

	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}

	public Integer[] getPrdIds() {
		return prdIds;
	}

	public void setPrdIds(Integer[] prdIds) {
		this.prdIds = prdIds;
	}

	public String getAllocationContent() {
		return allocationContent;
	}

	public void setAllocationContent(String allocationContent) {
		this.allocationContent = allocationContent;
	}

	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}

	public Integer[] getUserIds() {
		return userIds;
	}

	public void setUserIds(Integer[] userIds) {
		this.userIds = userIds;
	}

	public UsrUser getUser() {
		return user;
	}

	public void setUser(UsrUser user) {
		this.user = user;
	}

	public void setNotifyQueueService(NotifyQueueService notifyQueueService) {
		this.notifyQueueService = notifyQueueService;
	}

}
