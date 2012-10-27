package com.zj198.action.loan;
import com.zj198.service.loan.FinanceApplyService;
import javax.servlet.http.HttpServletRequest;
import com.zj198.action.BaseAction;
/**
 * @author 岳龙
 * Description:
 * CreateAuthor:岳龙
 * CreateDate:2012-7-05 15:09:58
 */
public class FinanceApplyAction extends BaseAction {
	private FinanceApplyService financeApplyService;
	public void setFinanceApplyService(FinanceApplyService financeApplyService) {
		this.financeApplyService = financeApplyService;
	}

	public String execute() {
		return null;
	}

	/**
	 * @author 岳龙
	 * Description:
	 * CreateAuthor:岳龙
	 * CreateDate:2012-7-05 15:09:58
	 * @param 
	 * @return 
	 */
	public String searchFinanceProduct() { 
		// INIT
		financeApplyService.searchFinanceProduct();
		return "searchFinanceProduct";
	 } 
	/**
	 * @author 岳龙
	 * Description:
	 * CreateAuthor:岳龙
	 * CreateDate:2012-7-05 15:09:58
	 * @param 
	 * @return 
	 */
	public String saveFinanceApply() { 
		// INIT
		financeApplyService.saveFinanceApply();
		return "saveFinanceApply";
	 } 
	/**
	 * @author 岳龙
	 * Description:
	 * CreateAuthor:岳龙
	 * CreateDate:2012-7-05 15:09:58
	 * @param 
	 * @return 
	 */
	public String searchDateFile() { 
		// INIT
		financeApplyService.searchDateFile();
		return "searchDateFile";
	 } 
	/**
	 * @author 岳龙
	 * Description:
	 * CreateAuthor:岳龙
	 * CreateDate:2012-7-05 15:09:58
	 * @param 
	 * @return 
	 */
	public String updateFinanceAttach() { 
		// INIT
		financeApplyService.updateFinanceAttach();
		return "updateFinanceAttach";
	 } 
	/**
	 * @author 岳龙
	 * Description:
	 * CreateAuthor:岳龙
	 * CreateDate:2012-7-05 15:09:58
	 * @param 
	 * @return 
	 */
	public String searchFinanaceApply() { 
		// INIT
		financeApplyService.searchFinanaceApply();
		return "searchFinanaceApply";
	 } 
	/**
	 * @author 岳龙
	 * Description:
	 * CreateAuthor:岳龙
	 * CreateDate:2012-7-05 15:09:58
	 * @param 
	 * @return 
	 */
	public String getFinanceApply() { 
		// INIT
		financeApplyService.getFinanceApply();
		return "getFinanceApply";
	 } 
	/**
	 * @author 岳龙
	 * Description:
	 * CreateAuthor:岳龙
	 * CreateDate:2012-7-05 15:09:58
	 * @param 
	 * @return 
	 */
	public String updateFinanceApply() { 
		// INIT
		financeApplyService.updateFinanceApply();
		return "updateFinanceApply";
	 } 
	/**
	 * @author 岳龙
	 * Description:
	 * CreateAuthor:岳龙
	 * CreateDate:2012-7-05 15:09:58
	 * @param 
	 * @return 
	 */
	public String saveFinanceAttach() { 
		// INIT
		financeApplyService.saveFinanceAttach();
		return "saveFinanceAttach";
	 } 
}
