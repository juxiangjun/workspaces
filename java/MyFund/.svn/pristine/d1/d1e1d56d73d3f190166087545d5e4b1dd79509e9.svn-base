package com.zj198.action.admin.fund;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.zj198.action.BaseAction;
import com.zj198.model.DicBank;
import com.zj198.model.Fund;
import com.zj198.model.FundAnnouncement;
import com.zj198.model.FundCharge;
import com.zj198.model.FundCompany;
import com.zj198.model.FundDividend;
import com.zj198.model.FundFile;
import com.zj198.model.FundInvest;
import com.zj198.model.FundManager;
import com.zj198.model.FundRoi;
import com.zj198.model.FundSales;
import com.zj198.model.PrdBankfinance;
import com.zj198.model.PrdRecommendation;
import com.zj198.service.finservice.FinanceProdService;
import com.zj198.service.fund.FundService;
import com.zj198.util.Constants;
import com.zj198.util.Pager;
import com.zj198.util.StringUtil;

/**
 * @author Administrator
 *
 */
public class FundAction extends BaseAction {
	private FundService fundService;
	private FinanceProdService financeProdService;
	private Fund fund;
	
	private Integer detailId;
	private Integer fundId;
	private String status;
	private Integer typeId;
	
	private String catelogName;
	private String companyName;
	private String fundCode;
	private String fullName;
	private Date[] issuedDt;
	
	private List<FundManager> fundManagerList;
	private List<FundRoi> fundRoiList;
	private List<FundInvest> fundInvestList;
	private List<FundDividend> fundDividendList;
	private List<FundCharge> fundChargeList;
	private List<FundSales> fundSalesList;
	private List<FundCompany> fundCompanyList;
	private FundCompany fundCompany;
	private List<String> fundTabs; //tabs
	
	private FundManager fundManager;
	private FundFile fundFile;
	private FundAnnouncement fundAnnouncement;
	
	private PrdRecommendation prdRecommendation;
	
	private Integer recommendationStatus=1;  //推荐状态  0  未推荐  1已推荐 2停用
	private int oldSequence;
	
	private static final Integer pageSize =10;
	private Integer pageNo = 1;
	private Pager pager;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**基金基本信息列表*/
	public String fundList(){

		pager=fundService.findFundAll(catelogName, companyName, fundCode, fullName, issuedDt, pageSize, pageNo,status,recommendationStatus);
		return "fundList";
	}
	
	/**基金Fund详细信息*/
	public String fundProfile(){
		fundCompanyList=this.fundService.findComAllIssue();
		if(fundId==null){
			fund=new Fund();
		}else{
			fund=fundService.getFundById(fundId);
		}
		return "fundProfile";
	}
	
	/**admin修改基金Fund详细信息*/
	public String updateFundProfile(){
		fundCompanyList=this.fundService.findComAllIssue();
		if(fund.getId() == null){
			fund.setImitateId(this.getSessionAdm().getId());
			fund.setIsSource(Constants.ADMIN_IMITATE_USER_SOURCE);
		}
		fundService.updateFund(fund);
		msg="修改成功。";
		return "fundProfile";
		
	}
	
	/**推荐基金产品*/
	public String editPrdRecommedation() {
		Fund prdFund=this.fundService.getFundById(fundId);
		fundCompanyList=this.fundService.findComAllIssue();
		this.prdRecommendation = this.financeProdService.getPrdRecommendationByProduct(typeId, fundId);
		
		if (prdRecommendation == null) {
			this.prdRecommendation = new PrdRecommendation();
		}
		
		if (prdRecommendation.getId() == null) {
			this.prdRecommendation.setOriginalName(prdFund.getFullName());
			this.prdRecommendation.setTypeId(typeId);
			this.prdRecommendation.setStatus(1);
			this.prdRecommendation.setSequence(1);
			this.prdRecommendation.setProdId(fundId);
			this.prdRecommendation.setCreatedDate(Calendar.getInstance().getTime());
			this.prdRecommendation.setLastUpdatedDate(Calendar.getInstance().getTime());
			for(FundCompany fc:fundCompanyList){
				if(fc.getId() == prdFund.getFundCompanyId()){
					prdRecommendation.setBankId(fc.getId());
//					if (StringUtils.isNotBlank(fc.getLogo())){
						prdRecommendation.setLogo(fc.getLogo());
//					}
				}
			}
		}
		this.oldSequence = this.prdRecommendation.getSequence();
		return "recommedation";
	}
	/**保存推荐产品*/
	public String savePrdRecommendation() {
		
		if (prdRecommendation.getBankId() != null) {
			FundCompany com = this.fundService.getFundCompanyById(prdRecommendation.getBankId());
			prdRecommendation.setLogo(com.getLogo());
		}
		
		this.financeProdService.savePrdRecommendation(prdRecommendation, oldSequence);
		
		msg="推荐成功";
		return fundList();
	}
	
	/**基金公司列表*/
	public String companyHome(){
		pager=fundService.findComAll(pageSize, pageNo);
		return "fund_company_home";
	}
	/**基金明细*/
	public String fundDetails(){
		if(fundId != null && fundId >0){
			fund=fundService.getFundById(fundId);
			fundCompany=fundService.getFundCompanyById(fund.getFundCompanyId());
			if(fundCompany != null && fundCompany.getTabs() !=null){
				fundTabs=StringUtil.getStringList(fundCompany.getTabs());
				return "fund_details";
			}
		}
		return ERROR;
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
	/**基金经理 */
	public String editFundManager(){
		fundManager=fundService.getManagerById(detailId);
		return "edit_manager";
	}
	/**基金文件 */
	public String editFundFile(){
		fundFile=fundService.getFundFileById(detailId);
		return "edit_file";
	}
	/**基金公告 */
	public String editFundAnnouncement(){
		fundAnnouncement=this.fundService.getFundAnnouncementById(detailId);
		return "edit_announcement";
	}
	/**更新基金经理*/
	public String updateManager(){
		if(fundManager!=null){
			fundService.updateManager(fundManager);
			detailId=fundManager.getId();
		}
		msg="更新成功";
		return editFundManager();
	}
	/**更新基金文件*/
	public String updateFile(){
		if(fundFile!=null){
			fundService.updateFile(fundFile);
			detailId=fundFile.getId();
		}
		msg="更新成功";
		return editFundFile();
	}
	/**更新基金公告*/
	public String updateAnnouncement(){
		if(fundAnnouncement!=null){
			this.fundService.updateAnnouncement(fundAnnouncement);
			detailId=fundAnnouncement.getId();
		}
		msg="更新成功";
		return editFundAnnouncement();
	}
	//------------get  set-----------------
	public Integer getPageNo() {
		return pageNo;
	}
	public Pager getPager() {
		return pager;
	}
	public void setFundService(FundService fundService) {
		this.fundService = fundService;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public Fund getFund() {
		return fund;
	}
	public void setFund(Fund fund) {
		this.fund = fund;
	}
	public void setFundId(Integer fundId) {
		this.fundId = fundId;
	}
	public Integer getFundId() {
		return fundId;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
	public FundCompany getFundCompany() {
		return fundCompany;
	}
	public List<String> getFundTabs() {
		return fundTabs;
	}
	public FundManager getFundManager() {
		return fundManager;
	}
	public void setFundManager(FundManager fundManager) {
		this.fundManager = fundManager;
	}
	public void setDetailId(Integer detailId) {
		this.detailId = detailId;
	}
	public FundFile getFundFile() {
		return fundFile;
	}
	public void setFundFile(FundFile fundFile) {
		this.fundFile = fundFile;
	}
	public FundAnnouncement getFundAnnouncement() {
		return fundAnnouncement;
	}
	public void setFundAnnouncement(FundAnnouncement fundAnnouncement) {
		this.fundAnnouncement = fundAnnouncement;
	}
	public Integer getRecommendationStatus() {
		return recommendationStatus;
	}
	public void setRecommendationStatus(Integer recommendationStatus) {
		this.recommendationStatus = recommendationStatus;
	}
	public PrdRecommendation getPrdRecommendation() {
		return prdRecommendation;
	}
	public void setPrdRecommendation(PrdRecommendation prdRecommendation) {
		this.prdRecommendation = prdRecommendation;
	}
	public void setFinanceProdService(FinanceProdService financeProdService) {
		this.financeProdService = financeProdService;
	}
	public List<FundCompany> getFundCompanyList() {
		return fundCompanyList;
	}
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	public int getOldSequence() {
		return oldSequence;
	}
	public void setOldSequence(int oldSequence) {
		this.oldSequence = oldSequence;
	}
	
}
