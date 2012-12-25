package com.zj198.action.loan;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.action.loan.model.LoanOrgCountModel;
import com.zj198.model.DicCity;
import com.zj198.model.DicCommon;
import com.zj198.model.DicDistrict;
import com.zj198.model.DicIndustry;
import com.zj198.model.DicProvince;
import com.zj198.model.DicUsertype;
import com.zj198.model.OrdLoanRequest;
import com.zj198.model.UsrCompany;
import com.zj198.model.UsrPerson;
import com.zj198.model.UsrUser;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.loan.LoanRequestService;
import com.zj198.service.loan.model.SaveLoanRequestSpModel;
import com.zj198.service.user.AccountService;
import com.zj198.service.user.ProfileService;
import com.zj198.service.user.model.RegisterUserSrModel;
import com.zj198.util.Constants;
import com.zj198.util.CookieOperateUtil;

/**
 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-6-20 10:07:45
 * @modify: zeroleavebaoyang@gmail.com
 * @modifytime: 2012-6-28 13:21:23
 */
public class LoanRequestAction extends BaseAction {
	private DictoryDataService dictoryDataService;
	private LoanRequestService loanRequestService;
	private AccountService accountService;
	private ProfileService profileService;
	private UsrCompany usrCompany;
	private UsrPerson usrPerson;
	private UsrUser newUser;
	private OrdLoanRequest loan;
	private Map<String,String> profileMap;
	private Map<String,List<DicCity>> cityMap;
	private Map<String,List<DicDistrict>> districtMap;
	private Map<String, List<DicCommon>> dataMap;
	private List<DicIndustry> industryList;// 行业
	private List<DicProvince> listProvince;// 所有省份
	private Double baseRate;//基准利率
	private String[] loanObjects;
	private Integer maxBound;
	private Integer minBound;
	private String applyNum;
	private List<DicIndustry> industry;
	private List<DicUsertype> userTypeList;
	private Integer industryId;
	private Integer typeId;
	private List<DicCommon> purposeTypeList;
	
//	private LoanOrgCountModel loanOrgCountModel;// 贷款机构汇总
//	private Short userType;
//	private Integer groupType;
	/**
	 * 企业快速申请融资第一步
	 * 
	 * @return
	 */
	public String busiFirst(){
		userTypeList = dictoryDataService.findUserTypeByGroup(Integer.valueOf(Constants.BASEDATA_GROUP_RUNNINGTYPE));
		industryList = dictoryDataService.findIndustryByParentid(0);
		listProvince = dictoryDataService.findAllProvince();
		cityMap = new HashMap<String,List<DicCity>>();
		districtMap = new HashMap<String,List<DicDistrict>>();
		
		UsrUser user = (UsrUser) ActionContext.getContext().getSession().get("_user");
		profileMap=new HashMap<String,String>();
		if(user != null){			
			usrCompany = (UsrCompany)profileService.getProfiles(user.getId());
			if(user.getType() != null && user.getType() > 0){
				for(DicUsertype t: userTypeList){
					if(user.getType().intValue() == t.getId()){
						profileMap.put("companyType", t.getName());
					}
				}
			}
		}
		if(usrCompany != null){
			industry=dictoryDataService.findIndustryByParentid(usrCompany.getIndustryparentid());
			cityMap.put("city", dictoryDataService.findCityByProvinceid(usrCompany.getBizprovinceid()));
			districtMap.put("district", dictoryDataService.findDistrictByCityid(usrCompany.getBizcityid()));
//			int type = -1;
//			if(user != null && user.getType() != null && user.getType() > 0){
//				type = user.getType().intValue();
//			}
//			if(loan != null && loan.getBusiRunningType() != null){
//				type = loan.getBusiRunningType();
//			}
//			if(type > -1){
//				for(DicUsertype t: userTypeList){
//					if(type == t.getId()){
//						profileMap.put("companyType", t.getName());
//					}
//				}
//			}
		}
		
		return "busiFirst";
	}
	public String busiSecond(){
		UsrUser user = (UsrUser) ActionContext.getContext().getSession().get("_user");
		/**
		 * 验证企业信息
		 */
		String message=usrCompany.validAuditFieldsLoan(usrCompany);
		if(message.startsWith("1#")){
			/**
			 * 验证失败，返回上一个页面
			 */
			msg=message.substring(2, message.length());
			return busiFirst();
		}
		SaveLoanRequestSpModel saveLoanSpModel = new SaveLoanRequestSpModel();
		/**
		 * 用户是否登陆
		 */
		if(user == null){//未登陆
			/**
			 * 注册用户
			 */
			ActionContext context = ActionContext.getContext();
			HttpServletRequest request = ServletActionContext.getRequest();
			newUser.setType(loan.getBusiRunningType().shortValue());
			
			String reference = CookieOperateUtil.getPartnerCookie(request);
			if(reference != null && reference.trim().length() > 0){			
				newUser.setReferenceId(Integer.valueOf(reference));
			}
			
			RegisterUserSrModel srModel = accountService.addRegisterUser(newUser, request.getRemoteAddr());//注册
			if(srModel.getUser() == null){//注册失败，返回
				msg = srModel.getMsg();
				return busiFirst();
			}else{//注册成功
				user = srModel.getUser();
				context.getSession().put("_user", user);
				/**
				 * 保存企业信息
				 */
				profileService.saveorupdate(usrCompany,user.getId());
				/**
				 * 保存快速申请
				 */
				loan.setUserId(user.getId());
				saveLoanSpModel.setLoan(loan);
				saveLoanSpModel.setLoanObject(loanObjects);
				saveLoanSpModel.setUserStatus(1);
				saveLoanSpModel.setCompany(usrCompany);
				saveLoanSpModel.setUser(user);
				applyNum = loanRequestService.saveLoanRequest(saveLoanSpModel);
			}
		}else{//已登陆
			if(user.getType() < 1){
				accountService.updateUserType(user.getId(),loan.getBusiRunningType().shortValue());
			}else{
				loan.setBusiRunningType(user.getType().intValue());
			}
			/**
			 * 保存企业信息
			 */
			UsrCompany old_UsrCompany = (UsrCompany)profileService.getProfiles(user.getId());
			if(old_UsrCompany!=null){
				old_UsrCompany.setAuditFieldsLoan(usrCompany);
				profileService.saveorupdate(old_UsrCompany,user.getId());
			}else{
				profileService.saveorupdate(usrCompany,user.getId());
			}
			/**
			 * 保存快速申请
			 */
			loan.setUserId(user.getId());
			saveLoanSpModel.setLoan(loan);
			saveLoanSpModel.setLoanObject(loanObjects);
			saveLoanSpModel.setUserStatus(0);
			saveLoanSpModel.setCompany(usrCompany);
			saveLoanSpModel.setUser(user);
			applyNum = loanRequestService.saveLoanRequest(saveLoanSpModel);
		}
		return "loanThird";
	}
	
	public String perrunFirst() {
		industryList = dictoryDataService.findIndustryByParentid(0);
		listProvince=dictoryDataService.findAllProvince();
		dataMap = new HashMap<String,List<DicCommon>>();
		cityMap = new HashMap<String,List<DicCity>>();
		districtMap = new HashMap<String,List<DicDistrict>>();
		
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		if(user != null){
			usrPerson = (UsrPerson)profileService.getProfiles(user.getId());
		}
		if(usrPerson!=null){
			cityMap.put("city", dictoryDataService.findCityByProvinceid(usrPerson.getProvinceid()));
			districtMap.put("district", dictoryDataService.findDistrictByCityid(usrPerson.getCityid()));
		}
		dataMap.put("psersoncareer", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_PERSONCAREER));
		dataMap.put("eduAtion", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_EDUCATION));
		if(loan != null && loan.getRunningTrade() != null){			
			industry=dictoryDataService.findIndustryByParentid(loan.getRunningTrade());
		}
		
		return "perrunFirst";
	}
	
	public String perrunSecond(){
		UsrUser user = (UsrUser) ActionContext.getContext().getSession().get("_user");
		/**
		 * 验证个人信息
		 */
		String message=usrPerson.validOthersFieldsLoan(usrPerson);
		if(message.startsWith("1#")){
			/**
			 * 验证失败，返回上一个页面
			 */
			msg=message.substring(2, message.length());
			
			return perrunFirst();
		}
		SaveLoanRequestSpModel saveLoanSpModel = new SaveLoanRequestSpModel();
		/**
		 * 用户是否登陆
		 */
		if(user == null){//未登陆
			/**
			 * 注册用户
			 */
			ActionContext context = ActionContext.getContext();
			HttpServletRequest request = ServletActionContext.getRequest();
			newUser.setType(Constants.USER_TYPE_PERSON);
			
			String reference = CookieOperateUtil.getPartnerCookie(request);
			if(reference != null && reference.trim().length() > 0){			
				newUser.setReferenceId(Integer.valueOf(reference));
			}
			
			RegisterUserSrModel srModel = accountService.addRegisterUser(newUser, request.getRemoteAddr());//注册
			if(srModel.getUser() == null){//注册失败，返回
				msg = srModel.getMsg();
				return perrunFirst();
			}else{//注册成功
				user = srModel.getUser();
				context.getSession().put("_user", user);
				/**
				 * 保存企业信息
				 */
				profileService.saveorupdate(usrPerson,user.getId());
				/**
				 * 保存快速申请
				 */
				loan.setUserId(user.getId());
				saveLoanSpModel.setLoan(loan);
				saveLoanSpModel.setLoanObject(loanObjects);
				saveLoanSpModel.setUserStatus(1);
				saveLoanSpModel.setPerson(usrPerson);
				saveLoanSpModel.setUser(user);
				applyNum = loanRequestService.saveLoanRequest(saveLoanSpModel);
			}
		}else{//已登陆
			if(user.getType() < 1){
				accountService.updateUserType(user.getId(),Constants.USER_TYPE_PERSON);
			}
			/**
			 * 保存企业信息
			 */
			UsrPerson old_UsrPerson = (UsrPerson)profileService.getProfiles(user.getId());
			if(old_UsrPerson!=null){
				old_UsrPerson.setAuditFieldsLoan(usrPerson);
				profileService.saveorupdate(old_UsrPerson,user.getId());
			}else{
				profileService.saveorupdate(usrPerson,user.getId());
			}
			/**
			 * 保存快速申请
			 */
			loan.setUserId(user.getId());
			saveLoanSpModel.setLoan(loan);
			saveLoanSpModel.setLoanObject(loanObjects);
			saveLoanSpModel.setUserStatus(0);
			saveLoanSpModel.setPerson(usrPerson);
			saveLoanSpModel.setUser(user);
			applyNum = loanRequestService.saveLoanRequest(saveLoanSpModel);
		}
		return "loanThird";
	}
	
	
//	public String busiFirst() {
//		dataMap = new HashMap<String, List<DicCommon>>();
//		/**
//		 * 获取企业贷款用途字典
//		 */
//		dataMap.put("loanpurpose", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_LOANPURPOSE));
//		userTypeList = dictoryDataService.findUserTypeByGroup(Integer.valueOf(Constants.BASEDATA_GROUP_RUNNINGTYPE));
//		return "busiFirst";
//	}
	/**
	 * 个人经营快速申请融资第一步
	 * 
	 * @return
	 */
//	public String perrunFirst() {
//		dataMap = new HashMap<String, List<DicCommon>>();
//		industryList = dictoryDataService.findIndustryByParentid(0);
//		dataMap.put("loanpurpose", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_PERSONRUNNING));
//		dataMap.put("allyearsales", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_ALLYEARSALES));
//		dataMap.put("salarylist", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_SALARYLIST));
//		return "perrunFirst";
//	}
	public String execute() {
		this.saveReference();
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		if (user != null) {
			int appType = loan.getApplyType().intValue();
			if (user.getUserTypeGroup().intValue() != 1 && user.getUserTypeGroup().intValue() != 5) {
				msg = "2";// 只有个人用户与企业用户可以申请融资！
			}
			if (appType == 136 && user.getUserTypeGroup() == 5) {
				msg = "3";// 个人用户不允许申请企业融资！
			}
			if (appType > 136 && user.getUserTypeGroup() == 1) {
				msg = "4";// 企业用户不允许申请个人融资！
			}
			if(msg != null && msg.length() > 0){
				return "loanThird";
			}
		}
		if (loan.getApplyType().intValue() == 136) {
			return busiFirst();
		} else if (loan.getApplyType().intValue() == 138) {
			return perrunFirst();
		}
		return busiFirst();
	}
	private void saveReference(){
		try {
			String[] str = (String[]) ActionContext.getContext().getParameters().get(Constants.PNR_URL_PARAM_NAME);
			if(str != null && str.length > 0 && str[0].trim().length() > 0){					
				CookieOperateUtil.addPartnerCookie(str[0].trim(), ServletActionContext.getResponse());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 企业快速申请融资第二步 统计各种贷款机构的数量
	 * 
	 * @return
	 */
//	public String loanSecond() {
//		/**
//		 * validate data
//		 */
//		if (loan.getApplyType().intValue() == 136) {// 企业快速申请融资
//			if (loan.getLoanAmount() == null || loan.getLoanMonth() == null || loan.getLastyearCost() == null || loan.getLastyearDebt() == null || loan.getLastyearProfit() == null || loan.getLastyearVolume() == null || loan.getHaveMortgage() == null) {
//				msg = "请填写完所有必填项，再提交申请！";
//				return busiFirst();
//			}
//		}
//		if (loan.getApplyType().intValue() == 138) {// 个人经营快速申请
//			if (loan.getLoanAmount() == null || loan.getLoanMonth() == null || loan.getHaveMortgage() == null || loan.getRunningTrade() == null || loan.getExperience() == null || loan.getAllyearVolume() == null || loan.getRunningArea() == null || loan.getHostoryLoan() == null || loan.getUserCreditCard() == null || loan.getBankSalaryList() == null) {
//				msg = "请填写完所有必填项，再提交申请！";
//				return perrunFirst();
//			}
//		}
//
//		loanOrgCountModel = new LoanOrgCountModel();
//		loanOrgCountModel.setBankNum(loanRequestService.countBankNum());
//		loanOrgCountModel.setFinanceOrg(loanRequestService.countUserByType(Short.valueOf(Constants.USER_TYPE_RENT)));
//		loanOrgCountModel.setInsuranceOrg(loanRequestService.countUserByType(Short.valueOf(Constants.USER_TYPE_INSURANCE)));
//		loanOrgCountModel.setLittleLoan(loanRequestService.countUserByType(Short.valueOf(Constants.USER_TYPE_LOAN)));
//		loanOrgCountModel.setPawnOrg(loanRequestService.countUserByType(Short.valueOf(Constants.USER_TYPE_HOCK)));
//		loanOrgCountModel.setPopularOrg(loanRequestService.countUserByType(Short.valueOf(Constants.USER_TYPE_PRIORG)));
//		loanOrgCountModel.setWarrantOrg(loanRequestService.countUserByType(Short.valueOf(Constants.USER_TYPE_GUARANTEE)));
//
//		baseRate = loanRequestService.getBaseRate(loan.getLoanMonth());
//		return "loanSecond";
//	}

//	/**
//	 * 企业快速申请融资第三步
//	 * 
//	 * @return
//	 */
//	public String loanThird() {
//		ActionContext context = ActionContext.getContext();
//		UsrUser user = (UsrUser) context.getSession().get("_user");
////		UsrUser usrUser =accountService.getUserById(user.getId());
//		if(user.getAuditstatus() != Constants.USER_AUDITSTATUS_DONE){
//			if(user.getUserTypeGroup() == Constants.USERTYPE_GROUP_COMPANY){
//				listProvince=dictoryDataService.findAllProvince();
//				cityMap = new HashMap<String,List<DicCity>>();
//				districtMap = new HashMap<String,List<DicDistrict>>();
//				usrCompany = (UsrCompany)profileService.getProfiles(user.getId());
//				if(usrCompany!=null){
//					cityMap.put("bizCity", dictoryDataService.findCityByProvinceid(usrCompany.getBizprovinceid()));
//					districtMap.put("bizDistrict", dictoryDataService.findDistrictByCityid(usrCompany.getBizcityid()));
//					industry=dictoryDataService.findIndustryByParentid(usrCompany.getIndustryparentid());
//				}
//				industryList = dictoryDataService.findIndustryByParentid(0);
//			}else if(user.getUserTypeGroup() == Constants.USERTYPE_GROUP_PERSONAL){
//				listProvince=dictoryDataService.findAllProvince();
//				dataMap = new HashMap<String,List<DicCommon>>();
//				cityMap = new HashMap<String,List<DicCity>>();
//				districtMap = new HashMap<String,List<DicDistrict>>();
//				usrPerson = (UsrPerson)profileService.getProfiles(user.getId());
//				if(usrPerson!=null){
//					cityMap.put("city", dictoryDataService.findCityByProvinceid(usrPerson.getProvinceid()));
//					districtMap.put("district", dictoryDataService.findDistrictByCityid(usrPerson.getCityid()));
//				}
//				dataMap.put("psersoncareer", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_PERSONCAREER));
//				dataMap.put("mtool", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_IMTOOL));
//				dataMap.put("eduAtion", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_EDUCATION));
//			}
//		}
//		if (context.getSession().get("_user") == null) {
//			msg = "1";//用户未登陆，不允许申请融资！
//			return "loanThird";
//		}
//		int appType = loan.getApplyType().intValue();
//		if (user.getUserTypeGroup().intValue() != 1 && user.getUserTypeGroup().intValue() != 5) {
//			msg = "2";//只有个人用户与企业用户可以申请融资！
//		}
//		if (appType == 136 && user.getUserTypeGroup() == 5) {
//			msg = "3";//个人用户不允许申请企业融资！
//		}
//		if (appType > 136 && user.getUserTypeGroup() == 1) {
//			msg = "4";//企业用户不允许申请个人融资！
//		}
//		if(msg != null && msg.length() > 0){
//			return "loanThird";
//		}
//		
//		loan.setUserId(user.getId());
//		applyNum = loanRequestService.saveLoanRequest(loan, loanObjects);
//		return "loanThird";
//	}
//
//	/**
//	 * 用户更新profile信息   
//	 * 
//	 * @return
//	 */
//	public String auditProfile(){
//		if(usrCompany==null && usrPerson==null){
//			msg="不可重复提交";
//			return ERROR;
//		}
//		String message;  //验证返回的msg
//		ActionContext ctx = ActionContext.getContext();
//		UsrUser user = (UsrUser)ctx.getSession().get("_user");
//		UsrUser usrUser =accountService.getUserById(user.getId());
//		int groupid = profileService.getGroupidByUserType(user.getType());
//		switch (groupid){
//			case Constants.USERTYPE_GROUP_COMPANY:
//				//TODO:需要对保护的字段不验证
//				if(usrUser.getAuditstatus()==Constants.USER_AUDITSTATUS_NONE){//判断user auditstatus - Patrick
//					message=usrCompany.validAuditFields(usrCompany);
//					if(message.startsWith("1#")){
//						/**
//						 * 验证失败，返回上一个页面
//						 */
//						msg=message.substring(2, message.length());
//						listProvince=dictoryDataService.findAllProvince();
//						cityMap = new HashMap<String,List<DicCity>>();
//						districtMap = new HashMap<String,List<DicDistrict>>();
//						cityMap.put("bizCity", dictoryDataService.findCityByProvinceid(usrCompany.getBizprovinceid()));
//						districtMap.put("bizDistrict", dictoryDataService.findDistrictByCityid(usrCompany.getBizcityid()));
//						industry=dictoryDataService.findIndustryByParentid(usrCompany.getIndustryparentid());
//						industryList = dictoryDataService.findIndustryByParentid(0);
//						return "loanThird";
//					}
//				}
//				//判断user auditstatus 如果为1  或者2 需对不可修改字段进行保护    《管理员审核时 对不可修改字段必须填写才可通过》
//				UsrCompany old_UsrCompany = (UsrCompany)profileService.getProfiles(usrUser.getId());
//				if(old_UsrCompany!=null){
//					old_UsrCompany.setAuditFields(usrCompany);
//					profileService.saveorupdate(old_UsrCompany,user.getId());
//				}else{
//					profileService.saveorupdate(usrCompany,user.getId());
//				}
//				break;
//			case Constants.USERTYPE_GROUP_PERSONAL:
//				//TODO:需要对保护的字段不验证
//				message=usrPerson.validOthersFields(usrPerson);
//				if(message.startsWith("1#")){
//					/**
//					 * 验证失败，返回上一个页面
//					 */
//					msg=message.substring(2, message.length());
//					
//					listProvince=dictoryDataService.findAllProvince();
//					dataMap = new HashMap<String,List<DicCommon>>();
//					cityMap = new HashMap<String,List<DicCity>>();
//					districtMap = new HashMap<String,List<DicDistrict>>();
//					cityMap.put("city", dictoryDataService.findCityByProvinceid(usrPerson.getProvinceid()));
//					districtMap.put("district", dictoryDataService.findDistrictByCityid(usrPerson.getCityid()));
//					dataMap.put("psersoncareer", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_PERSONCAREER));
//					dataMap.put("mtool", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_IMTOOL));
//					dataMap.put("eduAtion", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_EDUCATION));
//					return "loanThird";
//				}
//				//判断user auditstatus 如果为1  或者2 需对不可修改字段进行保护    《管理员审核时 对不可修改字段必须填写才可通过》
//				
//				profileService.saveorupdate(usrPerson,user.getId());
//				break;
//		}
//		msg="保存成功。";
//		return "profileSuccess";
//	}

	

	public String loanPurposeByTypeId() {
		if (typeId > 0) {
			purposeTypeList = dictoryDataService.findCommonDataByGroupId(typeId);
		}
		return "purposes";
	}

	public String getApplyNum() {
		return applyNum;
	}

	public void setApplyNum(String applyNum) {
		this.applyNum = applyNum;
	}

	public Map<String, List<DicCommon>> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, List<DicCommon>> dataMap) {
		this.dataMap = dataMap;
	}

	public Integer getIndustryId() {
		return industryId;
	}

	public void setIndustryId(Integer industryId) {
		this.industryId = industryId;
	}

	public List<DicIndustry> getIndustryList() {
		return industryList;
	}

	public void setIndustryList(List<DicIndustry> industryList) {
		this.industryList = industryList;
	}

	public List<DicProvince> getListProvince() {
		return listProvince;
	}

	public void setListProvince(List<DicProvince> listProvince) {
		this.listProvince = listProvince;
	}

	public OrdLoanRequest getLoan() {
		return loan;
	}

	public void setLoan(OrdLoanRequest loan) {
		this.loan = loan;
	}

	public String[] getLoanObjects() {
		return loanObjects;
	}

	public void setLoanObjects(String[] loanObjects) {
		this.loanObjects = loanObjects;
	}

	public Integer getMaxBound() {
		return maxBound;
	}

	public void setMaxBound(Integer maxBound) {
		this.maxBound = maxBound;
	}

	public Integer getMinBound() {
		return minBound;
	}

	public void setMinBound(Integer minBound) {
		this.minBound = minBound;
	}

	public List<DicUsertype> getUserTypeList() {
		return userTypeList;
	}

	public void setUserTypeList(List<DicUsertype> userTypeList) {
		this.userTypeList = userTypeList;
	}

	public UsrPerson getUsrPerson() {
		return usrPerson;
	}

	public void setUsrPerson(UsrPerson usrPerson) {
		this.usrPerson = usrPerson;
	}

	public Map<String, List<DicCity>> getCityMap() {
		return cityMap;
	}

	public void setCityMap(Map<String, List<DicCity>> cityMap) {
		this.cityMap = cityMap;
	}

	public Map<String, List<DicDistrict>> getDistrictMap() {
		return districtMap;
	}

	public void setDistrictMap(Map<String, List<DicDistrict>> districtMap) {
		this.districtMap = districtMap;
	}

	public UsrCompany getUsrCompany() {
		return usrCompany;
	}

	public void setUsrCompany(UsrCompany usrCompany) {
		this.usrCompany = usrCompany;
	}

	public List<DicIndustry> getIndustry() {
		return industry;
	}

	public void setIndustry(List<DicIndustry> industry) {
		this.industry = industry;
	}

	public Double getBaseRate() {
		return baseRate;
	}

	public void setBaseRate(Double baseRate) {
		this.baseRate = baseRate;
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

	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
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
	public UsrUser getNewUser() {
		return newUser;
	}
	public void setNewUser(UsrUser newUser) {
		this.newUser = newUser;
	}

	
}
