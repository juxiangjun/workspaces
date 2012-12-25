package com.zj198.action.fund;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.zj198.action.BaseAction;
import com.zj198.action.fund.model.FundIntention;
import com.zj198.model.Fund;
import com.zj198.model.FundAnnouncement;
import com.zj198.model.FundCharge;
import com.zj198.model.FundCompany;
import com.zj198.model.FundDividend;
import com.zj198.model.FundInvest;
import com.zj198.model.FundManager;
import com.zj198.model.FundRoi;
import com.zj198.model.FundSales;
import com.zj198.model.PrdRecommendation;
import com.zj198.service.finservice.FinanceProdService;
import com.zj198.service.fund.FundService;
import com.zj198.service.loan.FinanceApplyService;
import com.zj198.util.Constants;
import com.zj198.util.StringUtil;

public class FundAction extends BaseAction {
	private FinanceApplyService financeApplyService;
	private FinanceProdService financeProdService;
	private FundService fundService;
	private FundIntention fundIntention;
	private List<PrdRecommendation> bankFinanceRecommendationList;
	private List<FundManager> fundManagerList;
	private List<FundRoi> fundRoiList;
	private List<FundInvest> fundInvestList;
	private List<FundDividend> fundDividendList;
	private List<FundCharge> fundChargeList;
	private List<FundSales> fundSalesList;
	private FundCompany fundCompany;
	private List<FundCompany> fundCompanyList;
	private Fund fund;
	private List<String> fundTabs; //tabs
	//----------
	private String catelogName;
	private String companyName;
	private String fundCode;
	private String fullName;
	private Date[] issuedDt;
	
	private Integer fundId;
	private Integer companyId;
	
	private static final Integer pageSize =20;
	private Integer pageNo;
//	private Pager pager;
	/**新增了3个产品*/
	private int jtype;
	
	public String execute() {
		bankFinanceRecommendationList = this.financeProdService.findRecommendationByTopNumber(1, 4);
		String j = "SUCCESS";
		switch (jtype) {
		case 1:
			j = "view_fund1";
			break;
		case 2:
			j = "view_fund2";
			break;
		case 3:
			j = "view_fund3";
			break;
		}
		return j;
	}
	
	public String inputIntention(){
		return "input_intention";
	}
	
	public String saveIntention(){
		financeApplyService.saveFundIntention(fundIntention);
		return "success";
	}
	//-----------linm----------------------
	/**基金基本信息列表*/
	public String fundHome(){
		pager=fundService.findFundAll(catelogName, companyName, fundCode, fullName, issuedDt, pageSize, pageNo,"1",null);
		return "fund_home";
	}
	/**基金公司列表*/
	public String companyHome(){
		pager=fundService.findComAll(pageSize, pageNo);
		return "fund_company_home";
	}
	/**基金明细*/
	public String fundDetails(){
		if(fundId != null && fundId >0){
			this.bankFinanceRecommendationList = this.financeProdService.findRecommendationByTopNumber(1, 5);
			fund=fundService.getFundById(fundId);
			fundCompany=fundService.getFundCompanyById(fund.getFundCompanyId());
			if(fundCompany != null && fundCompany.getTabs() !=null){
				fundTabs=StringUtil.getStringList(fundCompany.getTabs());
				return "fund_details";
			}
		}
		return ERROR;
	}
	
	/**用户管理基金产品*/
	public String userFundManage(){
		
		return "userFundHome";
	}
	/**用户发布基金产品*/
	public String editFund(){
		if(fundId == null){
			fundCompanyList=this.fundService.findComAllIssue();
			fund=new Fund();
		}
		return "edit_fund";
	}
	
	/**用户保存发布基金产品*/
	public String saveUsrFund(){
		if(fund.getId() == null){
			fund.setImitateId(this.getSessionUser().getImitateUserAdminId());
			fund.setIsSource(Constants.ADMIN_IMITATE_USER_SOURCE);
			fund.setCreatedTime(Calendar.getInstance().getTime());
		}
		fundService.updateFund(fund);
		msg="修改成功。";
		fundId=fund.getId();
		return fundDetails();
	}
	
	/**基金相关公告*/
	public String fundAnnouncement(){
		pager=this.fundService.findFundAnnouncementByFundId(fundId, pageNo, pageSize);
		return "fund_announcement";
	}
	/**基金经理*/
	public String fundManager(){
		fundManagerList=fundService.findManagerByFundId(fundId);
		return "fund_manager";
	}
	/**基金投次回报*/
	public String fundRoi(){
		fundRoiList=fundService.findRoiByFundId(fundId);
		return "fund_roi";
	}
	/**基金投资组合*/
	public String fundInvest(){
		fundInvestList=fundService.findInvestByFundId(fundId);
		return "fund_invest";
	}
	/**基金法律文件*/
	public String fundFile(){
		pager=this.fundService.findFileByFundId(fundId, pageNo, pageSize);
		return "fund_file";
	}
	/**基金分红*/
	public String fundDividend(){
		fundDividendList=fundService.findDividendByFundId(fundId);
		return "fund_dividend";
	}
	/**基金费率*/
	public String fundCharge(){
		fundChargeList=fundService.findChargeByFundId(fundId);
		return "find_charge";
	}
	/**基金sales*/
	public String fundSales(){
		fundSalesList=fundService.findSalesByFundId(fundId);
		return "fund_sales";
	}
	/**基金Nav */
	public String fundNav(){
		pager=fundService.getNavByFundId(fundId, pageNo, pageSize);
		return "fund_nav";
	}
	/**基金Fund详细信息*/
	public String fundProfile(){
		fund=fundService.getFundById(fundId);
		return "fProfile";
	}

	//setter and getter
	public FundIntention getFundIntention() {
		return fundIntention;
	}

	public void setFundIntention(FundIntention fundIntention) {
		this.fundIntention = fundIntention;
	}

	public void setFinanceApplyService(FinanceApplyService financeApplyService) {
		this.financeApplyService = financeApplyService;
	}

	public List<PrdRecommendation> getBankFinanceRecommendationList() {
		return bankFinanceRecommendationList;
	}

	public void setFinanceProdService(FinanceProdService financeProdService) {
		this.financeProdService = financeProdService;
	}

	public int getJtype() {
		return jtype;
	}

	public void setJtype(int jtype) {
		this.jtype = jtype;
	}
	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

//	public Pager getPager() {
//		return pager;
//	}

	public void setFundService(FundService fundService) {
		this.fundService = fundService;
	}

	public List<String> getFundTabs() {
		return fundTabs;
	}

	public Fund getFund() {
		return fund;
	}

	public void setFund(Fund fund) {
		this.fund = fund;
	}

	public Integer getFundId() {
		return fundId;
	}

	public void setFundId(Integer fundId) {
		this.fundId = fundId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public List<FundManager> getFundManagerList() {
		return fundManagerList;
	}

	public List<FundRoi> getFundRoiList() {
		return fundRoiList;
	}

	public List<FundInvest> getFundInvestList() {
		return fundInvestList;
	}

	public List<FundDividend> getFundDividendList() {
		return fundDividendList;
	}

	public List<FundCharge> getFundChargeList() {
		return fundChargeList;
	}

	public List<FundSales> getFundSalesList() {
		return fundSalesList;
	}

	public String getCatelogName() {
		return catelogName;
	}

	public String getCompanyName() {
		return companyName;
	}

	public String getFundCode() {
		return fundCode;
	}

	public String getFullName() {
		return fullName;
	}

	public Date[] getIssuedDt() {
		return issuedDt;
	}

	public void setCatelogName(String catelogName) {
		this.catelogName = catelogName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public void setFundCode(String fundCode) {
		this.fundCode = fundCode;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public void setIssuedDt(Date[] issuedDt) {
		this.issuedDt = issuedDt;
	}

	public List<FundCompany> getFundCompanyList() {
		return fundCompanyList;
	}
	
}
