package com.zj198.action.admin.loan;

import java.util.ArrayList;
import java.util.List;

import com.zj198.action.BaseAction;
import com.zj198.model.OrdLoanRequest;
import com.zj198.model.UsrBank;
import com.zj198.model.UsrFinanceorg;
import com.zj198.model.UsrUser;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.loan.LoanRequestService;
import com.zj198.service.user.AccountService;
import com.zj198.service.user.ProfileService;

public class LoanToOrgAction extends BaseAction {
	private LoanRequestService loanRequestService;
	private ProfileService profileService;
	private AccountService accountService;
	private DictoryDataService dictoryDataService;
	
	private String orgName;
	private Integer requestId;
	private List<UsrBank> bankList;
	private List<UsrFinanceorg> financeorgList;
	
	/**
	 * 机构查询
	 */
	public String execute() {
		OrdLoanRequest loan = loanRequestService.getOrdDetailById(requestId);
		String types = loan.getLoanOrganization();
		if(types != null && types.length() > 0){
			String[] str = types.split(",");
			List<String> orgtype = new ArrayList<String>();
			for(String s : str){
				if(s.equals("6")){
					bankList = profileService.getUsrBanks(orgName);
				}else if(s != null && s.trim().length() > 0){
					orgtype.add(s.trim());
				}
			}
			if(orgtype.size() > 0){
				Integer[] userType = new Integer[orgtype.size()];
				for(int i = 0; i< orgtype.size(); i++){
					userType[i] = new Integer(orgtype.get(i));
				}
				financeorgList = profileService.getFinanceOrgs(orgName, userType);
				for(UsrFinanceorg f : financeorgList){
					UsrUser user = accountService.getUserById(f.getUserid());
					f.setTypeName(dictoryDataService.getDicUserTypeById(user.getType().intValue()).getName());
				}
			}
		}
		
		return "orgList";
	}

	//setter and getter
	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public Integer getRequestId() {
		return requestId;
	}

	public void setRequestId(Integer requestId) {
		this.requestId = requestId;
	}

	public List<UsrBank> getBankList() {
		return bankList;
	}

	public void setBankList(List<UsrBank> bankList) {
		this.bankList = bankList;
	}

	public List<UsrFinanceorg> getFinanceorgList() {
		return financeorgList;
	}

	public void setFinanceorgList(List<UsrFinanceorg> financeorgList) {
		this.financeorgList = financeorgList;
	}

	public void setLoanRequestService(LoanRequestService loanRequestService) {
		this.loanRequestService = loanRequestService;
	}

	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}

	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}

	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}
}
