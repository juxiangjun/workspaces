package com.zj198.action.loan;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.OrdLoanAllocation;
import com.zj198.model.OrdLoanRequest;
import com.zj198.model.PrdFinance;
import com.zj198.model.UsrUser;
import com.zj198.service.loan.FinanceProductService;
import com.zj198.service.loan.LoanRequestService;
import com.zj198.service.loan.OrdLrRecommendService;
import com.zj198.service.loan.model.RecommendPrdSpModel;
import com.zj198.util.Constants;

public class OrdLrRecommendAction extends BaseAction {
	private LoanRequestService loanRequestService;
	private FinanceProductService financeProductService;
	private OrdLrRecommendService ordLrRecommendService;
	private OrdLoanRequest loan;
	private List<PrdFinance> recommendProducts;
	// 获取一条融资需求的ID
	private Integer requestId;
	private String prdName;
	private Integer orgId;
	private OrdLoanAllocation loanAllocation;
	
	public String execute() {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		loan = loanRequestService.getOrdDetailById(requestId);
		
		RecommendPrdSpModel recommendSpModel = new RecommendPrdSpModel();
		if(loan.getApplyType() == 136){//企业经营快速申请			
			recommendSpModel.setFinanceType(Constants.ORD_TYPE_COMPANY);
		}else if(loan.getApplyType() == 138){//个人经营性快速申请
			recommendSpModel.setFinanceType(Constants.ORD_TYPE_USER);
		}
		recommendSpModel.setLoanMonth(loan.getLoanMonth());
		recommendSpModel.setLoanAmount(loan.getLoanAmount());
		recommendSpModel.setPrdName(prdName);
		recommendSpModel.setUserId(user.getId());
		
		recommendProducts = this.financeProductService.recommendPrd(recommendSpModel);
		
		return "recommendProduct";
	}
	/**
	 * 非金融机构查看推荐产品
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
	/**
	 * 金融机构：选择最多三条推荐产品
	 * 
	 * @author: zeroleavebaoyang@gmail.com
	 * @since: 2012-7-18 | 14:34:13
	 * @return
	 */
//	public String selectRecProdcut() {
//		if (checkId != null && checkId.length > 0) {
//			int[] intTemp = new int[checkId.length];
//			for (int i = 0; i < intTemp.length; i++) {
//				intTemp[i] = Integer.parseInt(checkId[i]);
//			}
//			ActionContext context = ActionContext.getContext();
//			UsrUser user = (UsrUser) context.getSession().get("_user");
//			List<OrdLrRecommend> list = new ArrayList<OrdLrRecommend>();
//			for (int i = 0; i < intTemp.length; i++) {
//				OrdLrRecommend o = new OrdLrRecommend();
//				o.setFinanceId(intTemp[i]);
//				o.setRequestId(requestId);
//				o.setCreatedt(new Date());
//				o.setRecommendType(0);
//				o.setCreateUserId(user.getId());
//				list.add(o);
//			}
//			ordLrRecommendService.saveSelRecProByLoan(requestId, list);
//		}
//		return null;
//	}

	
//	public String lookRecPro() {
//		loan = loanRequestService.getOrdDetailById(requestId);
//		List<Integer> proIds = ordLrRecommendService.getByRequestId(requestId, 0);
//		if (proIds != null && proIds.size() > 0) {
//			recommendByOrg = ordLrRecommendService.getListByIds(proIds.toArray());
//		}
//		List<Integer> pids = ordLrRecommendService.getByRequestId(requestId, 1);
//		if (pids != null && pids.size() > 0) {
//			recommendByAdm = ordLrRecommendService.getListByIds(pids.toArray());
//		}
//		return "lookRecPro";
//	}
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

	public String getPrdName() {
		return prdName;
	}

	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}

	public void setLoanRequestService(LoanRequestService loanRequestService) {
		this.loanRequestService = loanRequestService;
	}

	public void setFinanceProductService(FinanceProductService financeProductService) {
		this.financeProductService = financeProductService;
	}

	public Integer getOrgId() {
		return orgId;
	}

	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}

	public OrdLoanAllocation getLoanAllocation() {
		return loanAllocation;
	}

	public void setLoanAllocation(OrdLoanAllocation loanAllocation) {
		this.loanAllocation = loanAllocation;
	}

	public void setOrdLrRecommendService(OrdLrRecommendService ordLrRecommendService) {
		this.ordLrRecommendService = ordLrRecommendService;
	}

}
