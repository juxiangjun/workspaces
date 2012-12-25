package com.zj198.action.admin.loan;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.zj198.action.BaseAction;
import com.zj198.action.loan.model.FinanceApplySpModel;
import com.zj198.model.OrdApplyUsrCompany;
import com.zj198.model.OrdApplyUsrPerson;
import com.zj198.model.OrdCheckLog;
import com.zj198.model.OrdCheckRecord;
import com.zj198.model.OrdCheckRecordApply;
import com.zj198.model.OrdFinanceApply;
import com.zj198.model.PrdExtendsValue;
import com.zj198.model.PrdFinance;
import com.zj198.model.UsrPerson;
import com.zj198.model.UsrUser;
import com.zj198.model.vo.FinanceApplyAttachModel;
import com.zj198.model.vo.FinanceAreaModel;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.loan.ApplyUserService;
import com.zj198.service.loan.FinanceApplyService;
import com.zj198.service.loan.FinanceProductService;
import com.zj198.service.loan.OrdApplyUsrPersonService;
import com.zj198.service.loan.OrdCheckRecordApplyService;
import com.zj198.service.loan.OrdCheckRecordService;
import com.zj198.service.loan.OrdLogService;
import com.zj198.service.user.AccountService;
import com.zj198.service.user.ProfileService;
import com.zj198.util.Constants;
import com.zj198.util.Pager;

/**
 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 15:09:58
 */
public class FinanceApplyAdminAction extends BaseAction {
	private FinanceApplyService financeApplyService;
	private FinanceProductService financeProductService;
	private OrdCheckRecordService ordCheckRecordService;
	private OrdCheckRecordApplyService ordCheckRecordApplyService;
	private OrdApplyUsrPersonService ordApplyUsrPersonService;
	private OrdLogService ordLogService;
	private OrdFinanceApply apply;
	private AccountService accountService;
	private UsrUser user;
	private OrdApplyUsrPerson userPerson;
	private PrdFinance product;
	private List<FinanceAreaModel> productAreaList;
	private FinanceApplySpModel spModel = new FinanceApplySpModel();
	// 行业级联
	private OrdCheckLog appCheck;
	private List<OrdCheckRecord> selfs;
	private List<OrdCheckRecord> asks;
	private List<OrdCheckRecordApply> cmpInfo;
	private List<OrdCheckLog> applyCheckList;
	private List<PrdExtendsValue> extendsValueList;
	private ApplyUserService applyUserService;
	private OrdApplyUsrCompany ordCompany;
	private OrdApplyUsrCompany usrCompany;
	private Map<String, String> profileMap;
	private DictoryDataService dictoryDataService;
	private List<FinanceApplyAttachModel> attachList;
	private UsrPerson usrPerson;
	private ProfileService profileService;
	private Integer applyId;
	private String pindName;
	private String cindName;
	private String left;
	private String right;
	private String loanOrgName;
	private UsrUser loanUsr;
	private Integer tp;
	private Integer cp;
	private String checkSuggest;
	

	public String execute() {
		return null;
	}

	public String applyCheckList() {
		applyCheckList = financeApplyService.findApplyCheck(applyId);
		return "applyCheckList";
	}

	private Pager getPagerObj() {
		if (pager == null) {
			pager = new Pager();
			pager.setPageCount(10);
			pager.setCurrentPage(1);
		}
		return pager;
	}

	/**
	 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 15:09:58
	 * @param
	 * @return
	 */
	public String adminFinanceApply() {
		// INIT
		spModel.setPager(this.getPagerObj());
		pager = financeApplyService.findFinanceApply(spModel);
		// this.applyList = (List<OrdFinanceApply>) map.get("list");
		// spModel.setPagination((Pagination) map.get("pagination"));
		return "finance_apply_admin";
	}

	public String adminViewApply() {
		
		apply = financeApplyService.getFinanceApply(apply.getId());
		user = accountService.getUserById(apply.getUserId());
		product = financeProductService.getFinance(apply.getFinanceId());
		loanUsr = accountService.getUserById(product.getUserId());
		loanOrgName = dictoryDataService.getCompanyNameByUserId(product.getUserId());
		productAreaList = financeProductService.findFiananceArea(product.getId());
		applyCheckList = financeApplyService.findApplyCheck(apply.getId(), 3);
		// 申贷材料列表
		attachList = financeApplyService.findApplyAttach(apply.getId());
		// apply = financeApplyService.findById(apply.getId());
		// 根据状态显示按钮
		refreshStatus(apply);
		/**
		 * 扩展属性
		 */
		extendsValueList = financeApplyService.getFinanceApplyExtendsValue(apply.getId());
		if (apply.getRunningTrade() != null) {
			pindName = dictoryDataService.getIndustryNameById(apply.getRunningTrade());
		}
		if (apply.getRunningTradeChild() != null) {
			cindName = dictoryDataService.getIndustryNameById(apply.getRunningTradeChild());
		}
		if (apply.getApplyType().intValue() == 151) {// 企业经营贷款
			selfs = ordCheckRecordService.getSelfRecord();
			asks = ordCheckRecordService.getAskRecord();
			profileMap = new HashMap<String, String>();
			usrCompany = applyUserService.getByApplyId(apply.getId());
			String industry = "";
			if (usrCompany.getIndustryid() != null && usrCompany.getIndustryid() != 0) {
				industry = dictoryDataService.getIndustryById(usrCompany.getIndustryid()).getName();
			}
			profileMap.put("industry", industry);
			profileMap.put("bizaddress", dictoryDataService.getPCDNameByIds(usrCompany.getBizprovinceid(), usrCompany.getBizcityid(), usrCompany.getBizdistrictid()));
			profileMap.put("regaddress", dictoryDataService.getPCDNameByIds(usrCompany.getRegprovinceid(), usrCompany.getRegcityid(), usrCompany.getRegdistrictid()));
			profileMap.put("lpliveaddress", dictoryDataService.getPCDNameByIds(usrCompany.getLpliveprovinceid(), usrCompany.getLplivecityid(), usrCompany.getLplivedistrictid()));
			profileMap.put("lphkaddress", dictoryDataService.getPCDNameByIds(usrCompany.getLphkprovinceid(), usrCompany.getLphkcityid(), usrCompany.getLphkdistrictid()));
			profileMap.put("companyType", dictoryDataService.getValueNameById(usrCompany.getEnterprisetypeid()));
			profileMap.put("companyTmployee", dictoryDataService.getValueNameById(usrCompany.getEmployeesid()));
			profileMap.put("eduAtion", dictoryDataService.getValueNameById(usrCompany.getLpeducation()));
			profileMap.put("marry", dictoryDataService.getValueNameById(usrCompany.getLpmarry()));
			profileMap.put("workYears", dictoryDataService.getValueNameById(usrCompany.getLpindustryyears()));
			return "view_busi_apply";
		} else {
			selfs = ordCheckRecordService.getSelfpRecord();
			asks = ordCheckRecordService.getAskpRecord();
			profileMap = new HashMap<String, String>();
			userPerson = (OrdApplyUsrPerson) ordApplyUsrPersonService.getByApplyId(apply.getId());
			profileMap.put("address", dictoryDataService.getPCDNameByIds(userPerson.getProvinceid(), userPerson.getCityid(), userPerson.getDistrictid()));
			profileMap.put("psersoncareer",dictoryDataService.getValueNameById(userPerson.getCareerid()) );
			profileMap.put("eduAtion",dictoryDataService.getValueNameById(userPerson.getEducation()) );
			profileMap.put("imtype1", dictoryDataService.getValueNameById(userPerson.getIm1type()));
			profileMap.put("imtype2",dictoryDataService.getValueNameById(userPerson.getIm2type()) );
			profileMap.put("imtype3", dictoryDataService.getValueNameById(userPerson.getIm3type()));
			return "view_person_apply";
		}
	}

	public String checkAndSearchApply() {
		financeApplyService.saveApplyStatus(apply, appCheck);
		appCheck = new OrdCheckLog();
		return adminFinanceApply();
	}

	public String checkApply() {
		financeApplyService.saveApplyStatus(apply, appCheck);
		appCheck = new OrdCheckLog();

		return adminViewApply();
	}

	/**
	 * @description 资金网初审 基本信息和申请信息
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-24|下午3:41:12
	 * @return
	 */
	public String chuShen() {
		Map<String, Object> m = getContext().getParameters();
		Map<Integer, Integer> n = new HashMap<Integer, Integer>();
		Iterator<String> it = m.keySet().iterator();
		while (it.hasNext()) {
			String param = it.next();
			if (param.contains("radio")) {
				String key = param.substring(5);
				n.put(Integer.parseInt(key), Integer.parseInt(getReq().getParameter(param)));
			}
		}
		financeApplyService.saveOrUpdateRecordApply(apply, n, tp);
		financeApplyService.updateChuShen(cp, apply, appCheck, left, right, Constants.ZJW);
		return "rtnUrl";
	}

	/**
	 * @description 资金网复审通过
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-25|上午9:54:02
	 * @return
	 */
	public String fuShenSucc() {
		financeApplyService.updateOrdStatus(apply, appCheck, Constants.ZJW, Constants.ORD_ZJW_WAIT_UPLOAD);
		return "rtnUrl";
	}

	/**
	 * @description 资金网复审不通过
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-25|上午9:54:02
	 * @return
	 */
	public String fuShenBohui() {
		financeApplyService.updateOrdStatus(apply, appCheck, Constants.ZJW, Constants.ORD_ZJW_CHECK_FAILURE);
		return "rtnUrl";
	}

	/**
	 * 退回修改，标识客户信息和申请信息需要修改
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-25|下午2:38:37
	 * @return
	 */
	public String tuiHui() {
		financeApplyService.updateTuiHui(apply, appCheck, left, right, Constants.ZJW, Constants.ORD_ZJW_WAIT_UPDATE);
		return "rtnUrl";
	}

	/**
	 * 资金网审核通过
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-26|下午1:35:52
	 * @return
	 */
	public String CheckSucc() {
		financeApplyService.updateOrdStatus(apply, appCheck, Constants.ZJW, Constants.ORD_ZJW_CHECKPASS);
		return "rtnUrl";
	}

	/**
	 * 提交给资金方
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-26|下午1:35:52
	 * @return
	 */
	public String submitZjf() {
		financeApplyService.updateOrdStatus(apply, appCheck, Constants.ZJW, Constants.ORD_ORG_WAIT_CHECK);
		return "rtnUrl";
	}

	/**
	 * 申贷材料不符合，予以退回
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-26|下午1:35:52
	 * @return
	 */
	public String backMertail() {
		financeApplyService.updateOrdStatus(apply, appCheck, Constants.ZJW, Constants.ORD_ZJW_WAIT_UPLOAD);
		return "rtnUrl";
	}
	
	/**
	 * 查看审信息
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-11-16|上午11:22:57
	 * @return
	 */
	public String lookInfo(){
		cmpInfo = ordCheckRecordApplyService.getByAppIdAndTpid(applyId, tp);
		checkSuggest = ordLogService.getSuggest(applyId, cp);
		return "lookCmpInfo";
	}

	/**
	 * 拆分客户信息和申请信息的标识(复用)
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-26|下午1:34:04
	 * @param ofa
	 */
	private void refreshStatus(OrdFinanceApply ofa) {
		String j = ofa.getBaseCheckStatus();
		if (StringUtils.isNotBlank(j)) {
			left = j.substring(0, 1);
			right = j.substring(1, 2);
		} else {
			left = "0";
			right = "0";
		}
	}

	public OrdFinanceApply getApply() {
		return apply;
	}

	public void setApply(OrdFinanceApply apply) {
		this.apply = apply;
	}

	public UsrUser getUser() {
		return user;
	}

	public void setUser(UsrUser user) {
		this.user = user;
	}

	public PrdFinance getProduct() {
		return product;
	}

	public void setProduct(PrdFinance product) {
		this.product = product;
	}

	public List<FinanceAreaModel> getProductAreaList() {
		return productAreaList;
	}

	public void setProductAreaList(List<FinanceAreaModel> productAreaList) {
		this.productAreaList = productAreaList;
	}

	public FinanceApplySpModel getSpModel() {
		return spModel;
	}

	public void setSpModel(FinanceApplySpModel spModel) {
		this.spModel = spModel;
	}

	public OrdCheckLog getAppCheck() {
		return appCheck;
	}

	public void setAppCheck(OrdCheckLog appCheck) {
		this.appCheck = appCheck;
	}

	public List<OrdCheckLog> getApplyCheckList() {
		return applyCheckList;
	}

	public void setApplyCheckList(List<OrdCheckLog> applyCheckList) {
		this.applyCheckList = applyCheckList;
	}

	public List<PrdExtendsValue> getExtendsValueList() {
		return extendsValueList;
	}

	public void setExtendsValueList(List<PrdExtendsValue> extendsValueList) {
		this.extendsValueList = extendsValueList;
	}

	public void setFinanceApplyService(FinanceApplyService financeApplyService) {
		this.financeApplyService = financeApplyService;
	}

	public void setFinanceProductService(FinanceProductService financeProductService) {
		this.financeProductService = financeProductService;
	}

	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}

	public void setApplyUserService(ApplyUserService applyUserService) {
		this.applyUserService = applyUserService;
	}

	public OrdApplyUsrCompany getOrdCompany() {
		return ordCompany;
	}

	public void setOrdCompany(OrdApplyUsrCompany ordCompany) {
		this.ordCompany = ordCompany;
	}

	public Map<String, String> getProfileMap() {
		return profileMap;
	}

	public void setProfileMap(Map<String, String> profileMap) {
		this.profileMap = profileMap;
	}

	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}

	public List<FinanceApplyAttachModel> getAttachList() {
		return attachList;
	}

	public void setAttachList(List<FinanceApplyAttachModel> attachList) {
		this.attachList = attachList;
	}

	public UsrPerson getUsrPerson() {
		return usrPerson;
	}

	public void setUsrPerson(UsrPerson usrPerson) {
		this.usrPerson = usrPerson;
	}

	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}

	public Integer getApplyId() {
		return applyId;
	}

	public void setApplyId(Integer applyId) {
		this.applyId = applyId;
	}

	public String getLeft() {
		return left;
	}

	public void setLeft(String left) {
		this.left = left;
	}

	public String getRight() {
		return right;
	}

	public void setRight(String right) {
		this.right = right;
	}

	public String getLoanOrgName() {
		return loanOrgName;
	}

	public void setLoanOrgName(String loanOrgName) {
		this.loanOrgName = loanOrgName;
	}

	public String getPindName() {
		return pindName;
	}

	public void setPindName(String pindName) {
		this.pindName = pindName;
	}

	public String getCindName() {
		return cindName;
	}

	public void setCindName(String cindName) {
		this.cindName = cindName;
	}

	public OrdApplyUsrCompany getUsrCompany() {
		return usrCompany;
	}

	public void setUsrCompany(OrdApplyUsrCompany usrCompany) {
		this.usrCompany = usrCompany;
	}

	public UsrUser getLoanUsr() {
		return loanUsr;
	}

	public void setLoanUsr(UsrUser loanUsr) {
		this.loanUsr = loanUsr;
	}

	public void setOrdCheckRecordService(OrdCheckRecordService ordCheckRecordService) {
		this.ordCheckRecordService = ordCheckRecordService;
	}

	public List<OrdCheckRecord> getSelfs() {
		return selfs;
	}

	public void setSelfs(List<OrdCheckRecord> selfs) {
		this.selfs = selfs;
	}

	public List<OrdCheckRecord> getAsks() {
		return asks;
	}

	public void setAsks(List<OrdCheckRecord> asks) {
		this.asks = asks;
	}

	public List<OrdCheckRecordApply> getCmpInfo() {
		return cmpInfo;
	}

	public void setCmpInfo(List<OrdCheckRecordApply> cmpInfo) {
		this.cmpInfo = cmpInfo;
	}

	public Integer getTp() {
		return tp;
	}

	public void setTp(Integer tp) {
		this.tp = tp;
	}

	public void setOrdCheckRecordApplyService(OrdCheckRecordApplyService ordCheckRecordApplyService) {
		this.ordCheckRecordApplyService = ordCheckRecordApplyService;
	}

	public String getCheckSuggest() {
		return checkSuggest;
	}

	public void setCheckSuggest(String checkSuggest) {
		this.checkSuggest = checkSuggest;
	}

	public void setOrdLogService(OrdLogService ordLogService) {
		this.ordLogService = ordLogService;
	}

	public Integer getCp() {
		return cp;
	}

	public void setCp(Integer cp) {
		this.cp = cp;
	}

	public OrdApplyUsrPerson getUserPerson() {
		return userPerson;
	}

	public void setUserPerson(OrdApplyUsrPerson userPerson) {
		this.userPerson = userPerson;
	}

	public void setOrdApplyUsrPersonService(OrdApplyUsrPersonService ordApplyUsrPersonService) {
		this.ordApplyUsrPersonService = ordApplyUsrPersonService;
	}
	

}
