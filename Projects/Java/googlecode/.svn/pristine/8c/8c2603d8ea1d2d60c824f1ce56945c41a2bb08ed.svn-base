package com.zj198.action.finance;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opensymphony.xwork2.Action;
import com.zj198.action.BaseAction;
import com.zj198.model.DicCommon;
import com.zj198.model.FudBase;
import com.zj198.model.FudHisvalue;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.finservice.FinanceProdService;
import com.zj198.util.Pagination;

public class FundAction extends BaseAction  implements Action {
	
	private static final Logger log = LoggerFactory.getLogger(FundAction.class);
	private static final int PAGE_SIZE = 20;
	/*
	 * 参数传递
	 */
	private String fundCode;
	private FudBase fundInfo;
	private String typeId;
	private List<FudHisvalue> fundHistoryList;
	private List<DicCommon> fundTypeList;
	private Pagination pagination;
	private int pageNo=1;
	/*
	 *　服务
	 */
	private FinanceProdService financeProdService;
	private DictoryDataService dictoryDataService;
	/*
	 * 查询条件
	 */
	private String[] query;

	
	@Override
	public String execute() throws Exception {
		return null;
	}
	
	public String showHome() throws Exception {
		if (null != null && query.length>2) {
			this.fundHistoryList = null;
		} else {
			this.fundHistoryList = financeProdService.findRecentlyList();
		}
		log.debug("FundHistoryList Size: "+ String.valueOf(this.fundHistoryList.size()));
		return "home";
	}
	
	@SuppressWarnings("unchecked")
	public String searchByType() throws Exception {
		this.fundTypeList = this.dictoryDataService.findCommonDataByGroupId(4);
		String typeName = this.getTypeName();
		Map<String, Object> map= this.financeProdService.findRecentlyList(typeName, PAGE_SIZE, pageNo);
		this.pagination = (Pagination) map.get("pagination");
		this.fundHistoryList = (List<FudHisvalue>) map.get("list");
		return "home";
	}
	
	@SuppressWarnings("unchecked")
	public String showHistory() throws Exception {
		if (StringUtils.isBlank(fundCode)) {
			this.msg = "FundCode can't be null!";
			return ERROR;
		} 
		fundInfo = financeProdService.getBaseByFundCode(fundCode);
		Map<String, Object> map = this.financeProdService.findAllByFundCode(fundCode, PAGE_SIZE, pageNo);
		this.pagination = (Pagination) map.get("pagination");
		this.fundHistoryList = (List<FudHisvalue>) map.get("list");
		log.debug("Fund History Value:" + String.valueOf(this.fundHistoryList.size()));
		return "history";
	}
	
	private String getTypeName() {
		String result = "";
		if (StringUtils.isBlank(typeId)) {
			typeId = "13";
		}
		for (int i=0; i<this.fundTypeList.size(); i++) {
			DicCommon dc = fundTypeList.get(i);
			int id= Integer.valueOf(typeId).intValue();
			if (id == dc.getId()) {
				result = dc.getName();
				break;
			}
		}
		return result;
	}
	
	//setter and getter
	public String getFundCode() {
		return fundCode;
	}

	public void setFundCode(String fundCode) {
		this.fundCode = fundCode;
	}

	public List<FudHisvalue> getFundHistoryList() {
		return fundHistoryList;
	}

	public void setFundHistoryList(List<FudHisvalue> fundHistoryList) {
		this.fundHistoryList = fundHistoryList;
	}

	public FinanceProdService getFinanceProdService() {
		return financeProdService;
	}

	public void setFinanceProdService(FinanceProdService financeProdService) {
		this.financeProdService = financeProdService;
	}

	public FudBase getFundInfo() {
		return fundInfo;
	}

	public void setFundInfo(FudBase fundInfo) {
		this.fundInfo = fundInfo;
	}

	public String[] getQuery() {
		return query;
	}

	public void setQuery(String[] query) {
		this.query = query;
	}

	public DictoryDataService getDictoryDataService() {
		return dictoryDataService;
	}

	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}

	public List<DicCommon> getFundTypeList() {
		return fundTypeList;
	}

	public void setFundTypeList(List<DicCommon> fundTypeList) {
		this.fundTypeList = fundTypeList;
	}

	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	

}
