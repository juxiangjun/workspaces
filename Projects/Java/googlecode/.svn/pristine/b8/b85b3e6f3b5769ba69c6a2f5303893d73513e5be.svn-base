package com.zj198.action.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.DicCommon;
import com.zj198.model.DicIndustry;
import com.zj198.model.DicProvince;
import com.zj198.model.UsrBank;
import com.zj198.model.UsrCompany;
import com.zj198.model.UsrFinanceorg;
import com.zj198.model.UsrPerson;
import com.zj198.model.UsrServiceorg;
import com.zj198.model.UsrUser;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.user.ProfileService;
import com.zj198.util.Constants;

/**
 * profile类
 * @author Patrick
 *
 */
public class ProfileAction extends BaseAction {
	private UsrPerson usrPerson;
	private UsrBank usrBank;
	private UsrFinanceorg usrFinanceorg;
	private UsrServiceorg usrServiceorg;
	private UsrCompany usrCompany;
    private int nb;
	
	private DictoryDataService  dictoryDataService;
	private ProfileService profileService;
    private List<DicProvince> listProvince;
	private Map<String,List<DicCommon>> dataMap;
	private List<DicIndustry> industryList;


	/**
	 * 如果用户没有填写过profile信息 则强制填写  但可以跳过
	 * @return
	 */
	@Override
	public String execute(){
		ActionContext ctx = ActionContext.getContext();
		UsrUser user = (UsrUser)ctx.getSession().get("_user");
		if(profileService.getProfiles(user.getId())!=null){
			nb=1;
		}else{
			nb=0;
			msg="请填写资料，可以跳过。";
		}
		listProvince=dictoryDataService.findAllProvince();
		dataMap = new HashMap<String,List<DicCommon>>();
		int groupid = profileService.getGroupidByUserType(user.getType());
		switch (groupid){
			case Constants.USERTYPE_GROUP_BANK:
				usrBank = (UsrBank)profileService.getProfiles(user.getId());
				return "editBankProfile";
			case Constants.USERTYPE_GROUP_COMPANY:
				usrCompany = (UsrCompany)profileService.getProfiles(user.getId());
				dataMap.put("companyType", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_COMPANYTYPE));
				dataMap.put("companyTmployee", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_COMPANYEMPLOYEE));
				dataMap.put("eduAtion", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_EDUCATION));
				dataMap.put("marry", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_MARRY));
				dataMap.put("workYears", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_WORKYEARS));
				industryList = dictoryDataService.findIndustryByParentid(0);
				return "editCompanyProfile";
			case Constants.USERTYPE_GROUP_FINANCEORG:
				usrFinanceorg = (UsrFinanceorg)profileService.getProfiles(user.getId());
				dataMap.put("companyType", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_COMPANYTYPE));
				return "editFinanceorgProfile";
			case Constants.USERTYPE_GROUP_PERSONAL:
				usrPerson = (UsrPerson)profileService.getProfiles(user.getId());
				dataMap.put("psersoncareer", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_PERSONCAREER));
				dataMap.put("mtool", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_IMTOOL));
				return "editPersonProfile";
			case Constants.USERTYPE_GROUP_SERVICEORG:
				usrServiceorg = (UsrServiceorg)profileService.getProfiles(user.getId());
				dataMap.put("companyType", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_COMPANYTYPE));
				return "editServiceorgProfile";
		}
		return ERROR;
	}
	
	/**
	 * 编辑信息页
	 * @return
	 */
//	public String edit(){
//		listProvince=dictoryDataService.findAllProvince();
//		dataMap = new HashMap<String,List<DicCommon>>();
//		ActionContext ctx = ActionContext.getContext();
//		UsrUser user = (UsrUser)ctx.getSession().get("_user");
//		int groupid = profileService.getGroupidByUserType(user.getType());
//		switch (groupid){
//			case Constants.USERTYPE_GROUP_BANK:
//				usrBank = (UsrBank)profileService.getProfiles(user.getId());
//				return "editBankProfile";
//			case Constants.USERTYPE_GROUP_COMPANY:
//				usrCompany = (UsrCompany)profileService.getProfiles(user.getId());
//				dataMap.put("companyType", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_COMPANYTYPE));
//				dataMap.put("companyTmployee", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_COMPANYEMPLOYEE));
//				dataMap.put("eduAtion", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_EDUCATION));
//				dataMap.put("marry", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_MARRY));
//				dataMap.put("workYears", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_WORKYEARS));
//				industryList = dictoryDataService.findIndustryByParentid(0);
//				return "editCompanyProfile";
//			case Constants.USERTYPE_GROUP_FINANCEORG:
//				usrFinanceorg = (UsrFinanceorg)profileService.getProfiles(user.getId());
//				dataMap.put("companyType", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_COMPANYTYPE));
//				return "editFinanceorgProfile";
//			case Constants.USERTYPE_GROUP_PERSONAL:
//				usrPerson = (UsrPerson)profileService.getProfiles(user.getId());
//				dataMap.put("psersoncareer", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_PERSONCAREER));
//				dataMap.put("mtool", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_IMTOOL));
//				return "editPersonProfile";
//			case Constants.USERTYPE_GROUP_SERVICEORG:
//				usrServiceorg = (UsrServiceorg)profileService.getProfiles(user.getId());
//				dataMap.put("companyType", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_COMPANYTYPE));
//				return "editServiceorgProfile";
//		}
//		return ERROR;
//	}
	
	/**
	 * 保存profile信息,同时根据结果更新session中的status
	 * @return
	 */
	public String update(){
		ActionContext ctx = ActionContext.getContext();
		UsrUser user = (UsrUser)ctx.getSession().get("_user");
		int groupid = profileService.getGroupidByUserType(user.getType());
		switch (groupid){
			case Constants.USERTYPE_GROUP_BANK:
				profileService.saveorupdate(usrBank);
				break;
			case Constants.USERTYPE_GROUP_COMPANY:
				profileService.saveorupdate(usrCompany);
				break;
			case Constants.USERTYPE_GROUP_FINANCEORG:
				profileService.saveorupdate(usrFinanceorg);
				break;
			case Constants.USERTYPE_GROUP_PERSONAL:
				profileService.saveorupdate(usrPerson);
				break;
			case Constants.USERTYPE_GROUP_SERVICEORG:
				profileService.saveorupdate(usrServiceorg);
				break;
			default:
				return ERROR;
		}
		return SUCCESS;
	}
	
	//setter and getter
	
	public UsrPerson getUsrPerson() {
		return usrPerson;
	}
	public List<DicProvince> getListProvince() {
		return listProvince;
	}

	public int getNb() {
		return nb;
	}

	public void setUsrPerson(UsrPerson usrPerson) {
		this.usrPerson = usrPerson;
	}
	public UsrBank getUsrBank() {
		return usrBank;
	}
	public void setUsrBank(UsrBank usrBank) {
		this.usrBank = usrBank;
	}
	public UsrFinanceorg getUsrFinanceorg() {
		return usrFinanceorg;
	}
	public void setUsrFinanceorg(UsrFinanceorg usrFinanceorg) {
		this.usrFinanceorg = usrFinanceorg;
	}
	public UsrServiceorg getUsrServiceorg() {
		return usrServiceorg;
	}
	public void setUsrServiceorg(UsrServiceorg usrServiceorg) {
		this.usrServiceorg = usrServiceorg;
	}
	public UsrCompany getUsrCompany() {
		return usrCompany;
	}
	public void setUsrCompany(UsrCompany usrCompany) {
		this.usrCompany = usrCompany;
	}
	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}
	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}
	public Map<String, List<DicCommon>> getDataMap() {
		return dataMap;
	}
	public List<DicIndustry> getIndustryList() {
		return industryList;
	}
}
