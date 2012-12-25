
package com.zj198.action.club;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.ClbRequestInfo;
import com.zj198.model.ClbSupplyInfo;
import com.zj198.model.DicIndustry;
import com.zj198.model.DicInvestRange;
import com.zj198.model.DicProvince;
import com.zj198.model.UsrUser;
import com.zj198.service.club.SupplyRequestService;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.user.ProfileService;
import com.zj198.util.Constants;
import com.zj198.util.CookieOperateUtil;


public class ClubAction extends BaseAction {
	
	private ProfileService profileService;
	private DictoryDataService dictoryDataService;
	private SupplyRequestService supplyRequestService;
	
	private List<DicProvince> provinceList;
	private List<ClbRequestInfo> requestInfoList;
	private List<ClbSupplyInfo> supplyInfoList;
	private List<DicInvestRange> amountRangeList;
	private List<DicIndustry> industryList;
	private List<DicInvestRange> financingTypeList;
	private List<DicInvestRange> investStyleList;
	private List<ClbSupplyInfo> supplyInfoListForQueryPanel;
	private List<ClbRequestInfo> requestInfoListForQueryPanel;
	
	public String execute() throws Exception {
		this.saveReference();
		industryList = dictoryDataService.findIndustryByParentid(0);
		requestInfoList = supplyRequestService.findLastRequestInfo(10);
		supplyInfoList = supplyRequestService.findLastSupplyInfo(10);
		this.provinceList = this.dictoryDataService.findAllProvince();
		this.amountRangeList = this.supplyRequestService.findDicInvestRangeList(Constants.CLUB_AMOUNT_RANGE);
		this.financingTypeList = this.supplyRequestService.findDicInvestRangeList(Constants.CLUB_FINANCE_TYPE);
		this.investStyleList = this.supplyRequestService.findDicInvestRangeList(Constants.CLUB_INVEST_STYLE);
		return "home";
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
	
	public String getSupplyInfoByAllType() {
		industryList = dictoryDataService.findIndustryByParentid(0);
		this.provinceList = this.dictoryDataService.findAllProvince();
		this.investStyleList = this.supplyRequestService.findDicInvestRangeList(Constants.CLUB_INVEST_STYLE);
		supplyInfoList = new ArrayList<ClbSupplyInfo>();
		supplyInfoListForQueryPanel = supplyRequestService.findLastSupplyInfo(10);
		for (DicInvestRange investType : investStyleList) {
			List<ClbSupplyInfo> result = this.supplyRequestService.findSupplyInfoByType(investType.getCode(), 5);
			supplyInfoList.addAll(result);
		}
		return "supplyInfoByAllType";
	}
	
	public String getRequestInfoByAllType(){
		industryList = dictoryDataService.findIndustryByParentid(0);
		this.provinceList = this.dictoryDataService.findAllProvince();
		this.financingTypeList = this.supplyRequestService.findDicInvestRangeList(Constants.CLUB_FINANCE_TYPE);
		requestInfoListForQueryPanel = supplyRequestService.findLastRequestInfo(10);
		requestInfoList = new ArrayList<ClbRequestInfo>();
		for (DicIndustry industry : industryList) {
			List<ClbRequestInfo> result = this.supplyRequestService.findRequestInfoByType(industry.getName(), 5);
			requestInfoList.addAll(result);
		}
		return "requestInfoByAllType";
	}

	public String home() throws Exception {
		String result = null;
		ActionContext context = ActionContext.getContext();	
		UsrUser user = (UsrUser)context.getSession().get("_user");
		int group = profileService.getGroupidByUserType(user.getType().shortValue());
		if (group == Constants.USERTYPE_GROUP_COMPANY || group == Constants.USERTYPE_GROUP_PERSONAL) {
			result = "requestHome";
		}
		if (group == Constants.USERTYPE_GROUP_BANK || group == Constants.USERTYPE_GROUP_FINANCEORG) {
			result = "supplyHome";
		}
		return result;
	}

	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}

	public List<DicProvince> getProvinceList() {
		return provinceList;
	}

	public List<ClbRequestInfo> getRequestInfoList() {
		return requestInfoList;
	}

	public List<ClbSupplyInfo> getSupplyInfoList() {
		return supplyInfoList;
	}

	public List<DicInvestRange> getAmountRangeList() {
		return amountRangeList;
	}

	public List<DicIndustry> getIndustryList() {
		return industryList;
	}

	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}

	public void setSupplyRequestService(SupplyRequestService supplyRequestService) {
		this.supplyRequestService = supplyRequestService;
	}

	public List<DicInvestRange> getFinancingTypeList() {
		return financingTypeList;
	}

	public List<DicInvestRange> getInvestStyleList() {
		return investStyleList;
	}

	public List<ClbSupplyInfo> getSupplyInfoListForQueryPanel() {
		return supplyInfoListForQueryPanel;
	}

	public List<ClbRequestInfo> getRequestInfoListForQueryPanel() {
		return requestInfoListForQueryPanel;
	}
	
	
}
