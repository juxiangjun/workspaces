package com.zj198.action.finance;

import java.util.List;
import java.util.Map;

import com.zj198.action.BaseAction;
import com.zj198.model.DicBank;
import com.zj198.model.DicCommon;
import com.zj198.model.KnwTitle;
import com.zj198.model.PrdBankfinance;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.finservice.FinanceProdService;
import com.zj198.service.news.NewsService;
import com.zj198.util.Pagination;

public class FinanceProductAction extends BaseAction{

	
	private DictoryDataService dictoryDataService;
	
	/**产品的状态，分为全部，预售，在售与停售*/
	private List<DicCommon> productStatus;
	/**投资周期，分为3个月以下,３-６个月...*/
	private List<DicCommon> investmentCycle;
	/**投资额度，分为 5万以下,　５-１０万...*/
	private List<DicCommon> investmentQuota;
	/**投资回报率*/
	private List<DicCommon> investmentReturnRate;
	/**银行列表*/
	private List<DicBank> bankList;
	/**基金类型**/
	private List<DicCommon> fundTypeList;
	/**基金公司**/
	private List<String> fundFirmList;
	/**理财资讯*/
	private List<KnwTitle> knwTitleList;
	

	private final int pageSize = 6;
	private String[] query;

	private Integer pageNo;
	private Pagination pagination;
	
	private PrdBankfinance prdBankfinance;
	private List<PrdBankfinance> bankProductList;
	private FinanceProdService financeProdService;
	private NewsService newsService;
	
	
	@SuppressWarnings("unchecked")
	@Override
	public String execute() throws Exception {
		this.intialize();
		pageNo = null==pageNo ? 1: pageNo;
		Map<String, Object> map = this.financeProdService.findAll(pageSize, pageNo);
		this.pagination = (Pagination) map.get("pagination");
		this.bankProductList = (List<PrdBankfinance>) map.get("list");
		return SUCCESS;
	}
	
	private void intialize() {
		investmentCycle = this.dictoryDataService.findCommonDataByGroupId(10);
		this.investmentReturnRate = this.dictoryDataService.findCommonDataByGroupId(11);
		this.investmentQuota = this.dictoryDataService.findCommonDataByGroupId(12);
		productStatus = this.dictoryDataService.findCommonDataByGroupId(13);
		this.fundTypeList = this.dictoryDataService.findCommonDataByGroupId(4);
		this.fundFirmList = this.dictoryDataService.getUniqueFundFirmList();
		this.knwTitleList = this.newsService.findFinanceNews(pageSize);
		this.setBankList();
	}

	private void setBankList() {
		this.bankList = this.dictoryDataService.findDicBankList();
		DicBank emptyBank = new DicBank();
		emptyBank.setId(Integer.valueOf(0));
		emptyBank.setName("全部");
		bankList.add(0, emptyBank);
	}
	
	
	public List<DicCommon> getProductStatus() {
		return productStatus;
	}


	public void setProductStatus(List<DicCommon> productStatus) {
		this.productStatus = productStatus;
	}


	public List<DicCommon> getInvestmentCycle() {
		return investmentCycle;
	}


	public void setInvestmentCycle(List<DicCommon> investmentCycle) {
		this.investmentCycle = investmentCycle;
	}


	public List<DicCommon> getInvestmentQuota() {
		return investmentQuota;
	}


	public void setInvestmentQuota(List<DicCommon> investmentQuota) {
		this.investmentQuota = investmentQuota;
	}


	public List<DicCommon> getInvestmentReturnRate() {
		return investmentReturnRate;
	}


	public void setInvestmentReturnRate(List<DicCommon> investmentReturnRate) {
		this.investmentReturnRate = investmentReturnRate;
	}


	public List<DicBank> getBankList() {
		return bankList;
	}

	public List<DicCommon> getFundTypeList() {
		return fundTypeList;
	}


	public void setFundTypeList(List<DicCommon> fundTypeList) {
		this.fundTypeList = fundTypeList;
	}



	public DictoryDataService getDictoryDataService() {
		return dictoryDataService;
	}



	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}


	public List<String> getFundFirmList() {
		return fundFirmList;
	}

	public void setFundFirmList(List<String> fundFirmList) {
		this.fundFirmList = fundFirmList;
	}

	public String[] getQuery() {
		return query;
	}

	public void setQuery(String[] query) {
		this.query = query;
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

	public PrdBankfinance getPrdBankfinance() {
		return prdBankfinance;
	}

	public void setPrdBankfinance(PrdBankfinance prdBankfinance) {
		this.prdBankfinance = prdBankfinance;
	}

	public List<PrdBankfinance> getBankProductList() {
		return bankProductList;
	}

	public void setBankProductList(List<PrdBankfinance> bankProductList) {
		this.bankProductList = bankProductList;
	}

	public FinanceProdService getFinanceProdService() {
		return financeProdService;
	}

	public void setFinanceProdService(FinanceProdService financeProdService) {
		this.financeProdService = financeProdService;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setBankList(List<DicBank> bankList) {
		this.bankList = bankList;
	}

	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}

	public List<KnwTitle> getKnwTitleList() {
		return knwTitleList;
	}

	public void setKnwTitleList(List<KnwTitle> knwTitleList) {
		this.knwTitleList = knwTitleList;
	}

	public NewsService getNewsService() {
		return newsService;
	}
 
	

}
