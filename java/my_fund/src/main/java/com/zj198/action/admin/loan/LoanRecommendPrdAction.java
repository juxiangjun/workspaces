package com.zj198.action.admin.loan;

import java.util.List;

import com.zj198.action.BaseAction;
import com.zj198.model.OrdLoanAllocation;
import com.zj198.model.OrdLoanRequest;
import com.zj198.model.PrdFinance;
import com.zj198.service.loan.FinanceProductService;
import com.zj198.service.loan.LoanRequestService;
import com.zj198.service.loan.OrdLrRecommendService;
import com.zj198.service.loan.model.RecommendPrdSpModel;
import com.zj198.util.Constants;

public class LoanRecommendPrdAction extends BaseAction {
	private LoanRequestService loanRequestService;
	private FinanceProductService financeProductService;
	private OrdLrRecommendService ordLrRecommendService;
	private OrdLoanRequest loan;
	private List<PrdFinance> recommendProducts;
	// 获取一条融资需求的ID
	private Integer requestId;
	private String orgName;
	private String prdName;
	private OrdLoanAllocation loanAllocation;
	private Integer orgId;
	/**
	 * 推荐产品查询
	 */
	public String execute() {
		loan = loanRequestService.getOrdDetailById(requestId);
		
		RecommendPrdSpModel recommendSpModel = new RecommendPrdSpModel();
		if(loan.getApplyType() == 136){//企业经营快速申请			
			recommendSpModel.setFinanceType(Constants.ORD_TYPE_COMPANY);
		}else if(loan.getApplyType() == 138){//个人经营性快速申请
			recommendSpModel.setFinanceType(Constants.ORD_TYPE_USER);
		}
		recommendSpModel.setLoanMonth(loan.getLoanMonth());
		recommendSpModel.setLoanAmount(loan.getLoanAmount());
		recommendSpModel.setOrgId(loan.getLoanOrganization());
		recommendSpModel.setOrgName(orgName);
		recommendSpModel.setPrdName(prdName);
		
		recommendProducts = this.financeProductService.recommendPrd(recommendSpModel);
		
		return "recommendProduct";
	}
	
	/**
	 * 查看金融机构推荐产品
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-19| 下午1:41:12
	 * @return
	 */
	public String lookRecPro() {
		loan = loanRequestService.getOrdDetailById(requestId);
		loanAllocation = loanRequestService.getOrgLoanAllocation(requestId, orgId);

		List<Integer> pids = ordLrRecommendService.getRequestByOrg(requestId, orgId);
		if (pids != null && pids.size() > 0) {
			recommendProducts = ordLrRecommendService.getListByIds(pids.toArray());
		}
		
		return "lookRecPro";
	}
	
	//setter and getter
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

	public Integer getRequestId() {
		return requestId;
	}

	public void setRequestId(Integer requestId) {
		this.requestId = requestId;
	}

	public void setLoanRequestService(LoanRequestService loanRequestService) {
		this.loanRequestService = loanRequestService;
	}

	public void setFinanceProductService(FinanceProductService financeProductService) {
		this.financeProductService = financeProductService;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getPrdName() {
		return prdName;
	}

	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}

	public OrdLoanAllocation getLoanAllocation() {
		return loanAllocation;
	}

	public void setLoanAllocation(OrdLoanAllocation loanAllocation) {
		this.loanAllocation = loanAllocation;
	}

	public Integer getOrgId() {
		return orgId;
	}

	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}

	public void setOrdLrRecommendService(OrdLrRecommendService ordLrRecommendService) {
		this.ordLrRecommendService = ordLrRecommendService;
	}
}
