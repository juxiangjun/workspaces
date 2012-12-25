package com.zj198.action.loan;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.action.loan.model.RequestSearch;
import com.zj198.model.DicCommon;
import com.zj198.model.OrdLoanAllocation;
import com.zj198.model.OrdLoanRequest;
import com.zj198.model.PrdFinance;
import com.zj198.model.UsrCompany;
import com.zj198.model.UsrPerson;
import com.zj198.model.UsrUser;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.loan.LoanRequestService;
import com.zj198.service.loan.OrdLrRecommendService;
import com.zj198.service.user.AccountService;
import com.zj198.service.user.ProfileService;
import com.zj198.util.Constants;

/**
 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-6-20 10:07:45
 * @modify: zeroleavebaoyang@gmail.com
 * @modifytime: 2012-6-28 13:21:23
 */
public class UserLoanRequestAction extends BaseAction {
	private DictoryDataService dictoryDataService;
	private LoanRequestService loanRequestService;
	private ProfileService profileService;
	private OrdLrRecommendService ordLrRecommendService;
	private AccountService accountService;
	private UsrCompany usrCompany;
	private UsrPerson usrPerson;
	private OrdLoanRequest loan;
	private Map<String,String> profileMap;
	private List<OrdLoanAllocation> loanAllocationList;
	private OrdLoanAllocation loanAllocation;
	private List<PrdFinance> recommendPrdList;
	private String allocationContent;
	private Integer[] prdIds;
	private List<OrdLoanRequest> topThree;
	private RequestSearch requestSearch;
	
	private Integer typeId;
	private List<DicCommon> purposeTypeList;

	/**
	 * 融资意向单查询
	 */
	public String execute() {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		if (user == null) {
			return "index";
		}
		Integer groupType = user.getUserTypeGroup().intValue();
		if (groupType == 2 || groupType == 3) {// 银行或贷款机构
			// 银行只能查看到 个人用户选择了银行贷款机构的信息
			if(requestSearch == null){
				requestSearch = new RequestSearch();
			}
			requestSearch.setOrgId(user.getId());
			pager = loanRequestService.findReqByCon(pager == null ? 1 : pager.getCurrentPage(), pager == null ? 10 : pager.getPageCount(), requestSearch, user.getType().intValue());
			for(Object obj: pager.getData()){
				OrdLoanRequest r = (OrdLoanRequest)obj;
				OrdLoanAllocation a = loanRequestService.getOrgLoanAllocation(r.getId(), user.getId());
				if(a.getOrgCheckStatus() != 1){
					r.setApplyStatus(Constants.ORD_LOAN_ST_ZJWAIT);
				}
			}
		} else {
			// 个人用户只能看到自己的融资需求
			pager = this.loanRequestService.getPagationList(user.getId(), pager == null ? 1 : pager.getCurrentPage(), pager == null ? 10 : pager.getPageCount());
		}
		return "loanManage";
	}

	/**
	 * 融资意向单查看
	 * @return
	 */
	public String loanManageDetail() {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		if (user == null) {
			return "index";
		}
		this.loan = loanRequestService.getOrdDetailById(loan.getId());
		if (loan.getApplyType().intValue() == 136) {// 企业经营快速申请查看
			return viewBusiLoan();
		}else{//个人经营快速申请查看
			return viewPersonLoan();
		}
	}
	/**
	 * 企业经营快速申请查看
	 * @return
	 */
	public String viewBusiLoan(){
		usrCompany = (UsrCompany)profileService.getProfiles(loan.getUserId());
		UsrUser user = accountService.getUserById(loan.getUserId());
		profileMap=new HashMap<String,String>();
		if(usrCompany.getIndustryparentid() != null && usrCompany.getIndustryparentid() !=0){
			profileMap.put("parentIndustry", dictoryDataService.getIndustryById(usrCompany.getIndustryparentid()).getName());
		}
		if(usrCompany.getIndustryid()!=null && usrCompany.getIndustryid()!=0){
			profileMap.put("industry", dictoryDataService.getIndustryById(usrCompany.getIndustryid()).getName());//所属行业
		}
		profileMap.put("companyType", dictoryDataService.getDicUserTypeById(user.getType().intValue()).getName());//企业类型
		//企业经营地址
		profileMap.put("bizaddress",dictoryDataService.getPCDNameByIds(usrCompany.getBizprovinceid(), usrCompany.getBizcityid(), usrCompany.getBizdistrictid()));
		
		ActionContext context = ActionContext.getContext();
		UsrUser sessionUser = (UsrUser) context.getSession().get("_user");
		if(sessionUser.getUserTypeGroup() == 2 || sessionUser.getUserTypeGroup() == 3){//银行或金融机构
			loanAllocation = loanRequestService.getOrgLoanAllocation(loan.getId(), sessionUser.getId());
			
			if(loanAllocation.getOrgCheckStatus() == 1){//已处理
				List<Integer> proIds = ordLrRecommendService.getRequestByOrg(loan.getId(), sessionUser.getId());
				if (proIds != null && proIds.size() > 0) {
					recommendPrdList = ordLrRecommendService.getListByIds(proIds.toArray());
				}
			}
			return "busiLoanOrgView";
		}else{
			/**
			 * 资金网已处理
			 */
			if(loan.getApplyStatus().intValue() == Constants.ORD_LOAN_ST_CHECK && loan.getToOrgStatus() == 1){
				List<Integer> proIds = ordLrRecommendService.getByRequestId(loan.getId(), 0);//0:资金网推荐
				if (proIds != null && proIds.size() > 0) {
					recommendPrdList = ordLrRecommendService.getListByIds(proIds.toArray());
				}
			}
			/**
			 * 资金方已处理
			 */
			if(loan.getApplyStatus().intValue() == Constants.ORD_LOAN_ST_CHECK && loan.getToOrgStatus() == 2){
				loanAllocationList = this.loanRequestService.getLoanAllocation(loan.getId());
			}
			
			return "busi_request_view";
		}
	}
	/**
	 * 个人经营快速申请查看
	 * @return
	 */
	public String viewPersonLoan(){
		usrPerson = (UsrPerson)profileService.getProfiles(loan.getUserId());
		UsrUser user = accountService.getUserById(loan.getUserId());
		usrPerson.setRealName(user.getRealname());
		profileMap=new HashMap<String,String>();
		profileMap.put("address", dictoryDataService.getPCDNameByIds(usrPerson.getProvinceid(), usrPerson.getCityid(), usrPerson.getDistrictid()));
		if(loan.getRunningTrade() != null && loan.getRunningTrade() !=0){
			profileMap.put("parentIndustry", dictoryDataService.getIndustryById(loan.getRunningTrade()).getName());
		}
		if(loan.getRunningTradeChild()!=null && loan.getRunningTradeChild()!=0){
			profileMap.put("industry", dictoryDataService.getIndustryById(loan.getRunningTradeChild()).getName());//所属行业
		}
		ActionContext context = ActionContext.getContext();
		UsrUser sessionUser = (UsrUser) context.getSession().get("_user");
		if(sessionUser.getUserTypeGroup() == 2 || sessionUser.getUserTypeGroup() == 3){//银行或金融机构
			loanAllocation = loanRequestService.getOrgLoanAllocation(loan.getId(), sessionUser.getId());
			
			if(loanAllocation.getOrgCheckStatus() == 1){//已处理
				List<Integer> proIds = ordLrRecommendService.getRequestByOrg(loan.getId(), sessionUser.getId());
				if (proIds != null && proIds.size() > 0) {
					recommendPrdList = ordLrRecommendService.getListByIds(proIds.toArray());
				}
			}
			return "personLoanOrgView";
		}else{
			/**
			 * 资金网已处理
			 */
			if(loan.getApplyStatus().intValue() == Constants.ORD_LOAN_ST_CHECK && loan.getToOrgStatus() == 1){
				List<Integer> proIds = ordLrRecommendService.getByRequestId(loan.getId(), 0);//0:资金网推荐
				if (proIds != null && proIds.size() > 0) {
					recommendPrdList = ordLrRecommendService.getListByIds(proIds.toArray());
				}
			}
			/**
			 * 资金方已处理
			 */
			if(loan.getApplyStatus().intValue() == Constants.ORD_LOAN_ST_CHECK && loan.getToOrgStatus() == 2){
				loanAllocationList = this.loanRequestService.getLoanAllocation(loan.getId());
			}
			
			return "loanManageDetail";
		}
	}
	
	/**
	 * 用户中心首页显示三条融资意向单
	 * @return
	 */
	public String loanRequestHome(){
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		if (user.getUserTypeGroup().intValue() == 2 || user.getUserTypeGroup().intValue() == 3) {// 银行或其它贷款机构
			topThree = loanRequestService.getTopThrees(user.getId());
			for(OrdLoanRequest r: topThree){
				OrdLoanAllocation a = loanRequestService.getOrgLoanAllocation(r.getId(), user.getId());
				if(a.getOrgCheckStatus() != 1){
					r.setApplyStatus(Constants.ORD_LOAN_ST_ZJWAIT);
				}
			}
		}else{//企业或人个用户
			topThree = loanRequestService.getTopThree(user.getId());
		}
		return "loanRequestHome";
	}
	
	/**
	 * 融资意向查询时，根据意向类型，动态显示贷款用途
	 * @return
	 */
	public String loanPurposeByTypeId() {
		if (typeId > 0) {
			purposeTypeList = dictoryDataService.findCommonDataByGroupId(typeId);
		}
		return "purposes";
	}
	
	/**
	 * 管理员处理意向单并推荐产品
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-20| 上午11:20:23
	 * @return
	 */
	public String allocation() {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		this.loanRequestService.updateAllocation(loan.getId(), user.getId(), allocationContent, prdIds, Constants.ORD_LOAN_RECOMMEND_TYPE_BANK);
		return loanManageDetail();
	}

	//setter and getter
	public OrdLoanRequest getLoan() {
		return loan;
	}

	public void setLoan(OrdLoanRequest loan) {
		this.loan = loan;
	}

	public List<OrdLoanRequest> getTopThree() {
		return topThree;
	}

	public void setTopThree(List<OrdLoanRequest> topThree) {
		this.topThree = topThree;
	}

	public RequestSearch getRequestSearch() {
		return requestSearch;
	}

	public void setRequestSearch(RequestSearch requestSearch) {
		this.requestSearch = requestSearch;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public List<DicCommon> getPurposeTypeList() {
		return purposeTypeList;
	}

	public void setPurposeTypeList(List<DicCommon> purposeTypeList) {
		this.purposeTypeList = purposeTypeList;
	}

	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}

	public void setLoanRequestService(LoanRequestService loanRequestService) {
		this.loanRequestService = loanRequestService;
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
	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
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

	public List<PrdFinance> getRecommendPrdList() {
		return recommendPrdList;
	}

	public void setRecommendPrdList(List<PrdFinance> recommendPrdList) {
		this.recommendPrdList = recommendPrdList;
	}

	public void setOrdLrRecommendService(OrdLrRecommendService ordLrRecommendService) {
		this.ordLrRecommendService = ordLrRecommendService;
	}

	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}

	public String getAllocationContent() {
		return allocationContent;
	}

	public void setAllocationContent(String allocationContent) {
		this.allocationContent = allocationContent;
	}

	public Integer[] getPrdIds() {
		return prdIds;
	}

	public void setPrdIds(Integer[] prdIds) {
		this.prdIds = prdIds;
	}

	
}
