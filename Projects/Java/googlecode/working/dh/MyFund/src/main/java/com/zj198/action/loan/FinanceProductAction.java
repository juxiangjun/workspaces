package com.zj198.action.loan;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.DicCommon;
import com.zj198.model.DicUsertype;
import com.zj198.model.OrdFinanceProduct;
import com.zj198.model.UsrUser;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.loan.FinanceProductService;
import com.zj198.service.loan.model.FinanceProductSpModel;
import com.zj198.util.Pagination;
/**
 * @author 岳龙
 * Description:
 * CreateAuthor:岳龙
 * CreateDate:2012-7-05 14:54:57
 */
public class FinanceProductAction extends BaseAction {
	
	
	private FinanceProductService financeProductService;
	private OrdFinanceProduct product;
	private FinanceProductSpModel financeProductSpModel;
	private Integer pageNo;
    private Pagination pagination;
    private List<OrdFinanceProduct> OrdFinanceProducts;
	private final int pageSize = 10;
	private Map<String, List<?>> dataMap;
	private List<DicUsertype> finaceTypeList;
	private DictoryDataService dictoryDataService;
	private List<DicCommon> mortgageTypeList;

	private List<DicCommon> repaymentTypeList;




	

	public String execute() {
		return null;
	}
	
	public String newfin(){
		
		return "new_finanace_page";
	}
	
	/**
	 * @author 岳龙
	 * Description:
	 * CreateAuthor:岳龙
	 * CreateDate:2012-7-05 14:54:57
	 * @param 
	 * @return 
	 */
	public String savefin() { 
		// INIT
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		financeProductSpModel.setProduct(product);
//		spModel.setUserId(user.getId());
		financeProductService.saveFinance(financeProductSpModel);
		return "view_finance";
	} 
	
	public String financeSearch(){
		
		return "financeSearch";
	}
	
	/**
	 * @author: zeroleavebaoyang@gmail.com
	 * @since: 2012-7-10 | 11:04:12
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String financeSearchDetail(){
		// TODO
		//获得贷款类型
		Integer type = product.getFinanceType();

		switch (type) {
		case 151:// 企业经营贷款

			// 从DIC_USERTYPE中取得融资渠道类型
			dataMap = new HashMap<String, List<?>>();
			finaceTypeList = (List<DicUsertype>) dictoryDataService.findUserTypeByGroup(3);
			// 从DIC_COMMON中取得融资担保方式
			mortgageTypeList = dictoryDataService.findCommonDataByGroupId(35);
			// 从DIC_COMMON中取得融资担保方式
			repaymentTypeList = dictoryDataService.findCommonDataByGroupId(34);
			dataMap.put("finaceType", finaceTypeList);
			dataMap.put("mortgageType", mortgageTypeList);
			dataMap.put("repaymentType", repaymentTypeList);

			break;
		case 152:// 个人经营性贷款

			break;
		case 153:// 个人综合消费贷款

			break;
		case 154:// 个人购房贷款

			break;
		}

		pageNo = null == pageNo ? 1 : pageNo;
		Map<String, Object> map  = financeProductService.getByCondition(product, pageSize, pageNo);
		OrdFinanceProducts =(List<OrdFinanceProduct>) map.get("list");
		pagination = (Pagination) map.get("pagination");
		return "financeSearchDetail";
	}

	/**
	 * @author 岳龙
	 * Description:
	 * CreateAuthor:岳龙
	 * CreateDate:2012-7-05 14:54:57
	 * @param 
	 * @return 
	 */
	public String findFinance() { 
		// INIT
		financeProductService.findFinance();
		return "findFinance";
	 }

	/**
	 * @author 岳龙
	 * Description:
	 * CreateAuthor:岳龙
	 * CreateDate:2012-7-05 14:54:57
	 * @param 
	 * @return 
	 */
	public String getFinance() { 
		// INIT
		financeProductService.getFinance();
		return "getFinance";
	 } 

	/**
	 * @author 岳龙
	 * Description:
	 * CreateAuthor:岳龙
	 * CreateDate:2012-7-05 14:54:57
	 * @param 
	 * @return 
	 */
	public String searchDateFile() { 
		// INIT
		financeProductService.searchDateFile();
		return "searchDateFile";
	 } 
	public void setFinanceProductService(FinanceProductService financeProductService) {
		this.financeProductService = financeProductService;
	} 
	/**
	 * @author 岳龙
	 * Description:
	 * CreateAuthor:岳龙
	 * CreateDate:2012-7-05 14:54:57
	 * @param 
	 * @return 
	 */
	public String updateFinance() { 
		// INIT
		financeProductService.updateFinance();
		return "updateFinance";
	 }

	public OrdFinanceProduct getProduct() {
		return product;
	}

	public void setProduct(OrdFinanceProduct product) {
		this.product = product;
	}

	public FinanceProductSpModel getFinanceProductSpModel() {
		return financeProductSpModel;
	}

	public void setFinanceProductSpModel(FinanceProductSpModel financeProductSpModel) {
		this.financeProductSpModel = financeProductSpModel;
	} 

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}

	public int getPageSize() {
		return pageSize;
	}
	public List<OrdFinanceProduct> getOrdFinanceProducts() {
		return OrdFinanceProducts;
	}

	public void setOrdFinanceProducts(List<OrdFinanceProduct> ordFinanceProducts) {
		OrdFinanceProducts = ordFinanceProducts;
	}


	public Map<String, List<?>> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, List<?>> dataMap) {
		this.dataMap = dataMap;
	}

	public List<DicUsertype> getFinaceTypeList() {
		return finaceTypeList;
	}

	public void setFinaceTypeList(List<DicUsertype> finaceTypeList) {
		this.finaceTypeList = finaceTypeList;
	}

	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}

	public List<DicCommon> getMortgageTypeList() {
		return mortgageTypeList;
	}

	public void setMortgageTypeList(List<DicCommon> mortgageTypeList) {
		this.mortgageTypeList = mortgageTypeList;
	}

	public List<DicCommon> getRepaymentTypeList() {
		return repaymentTypeList;
	}

	public void setRepaymentTypeList(List<DicCommon> repaymentTypeList) {
		this.repaymentTypeList = repaymentTypeList;
	}
}
