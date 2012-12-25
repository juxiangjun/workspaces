package com.zj198.service.loan.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.zj198.action.loan.model.FindFinanceAdminSpModel;
import com.zj198.action.loan.model.RequestSearch;
import com.zj198.dao.DicBaseRateDAO;
import com.zj198.dao.DicCommonDAO;
import com.zj198.dao.OrdLoanAllocationDAO;
import com.zj198.dao.OrdLoanRequestDAO;
import com.zj198.dao.UsrBankDAO;
import com.zj198.dao.UsrUserDAO;
import com.zj198.model.DicBaseRate;
import com.zj198.model.NtyMessageQueue;
import com.zj198.model.OrdLoanAllocation;
import com.zj198.model.OrdLoanRequest;
import com.zj198.model.UsrBank;
import com.zj198.model.UsrUser;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.common.NotifyQueueService;
import com.zj198.service.loan.LoanRequestService;
import com.zj198.service.loan.OrdLrRecommendService;
import com.zj198.service.loan.model.SaveLoanRequestSpModel;
import com.zj198.service.message.NtyMessageService;
import com.zj198.service.message.model.SendMobileMspSpModel;
import com.zj198.service.message.model.SendWebMsgSpModel;
import com.zj198.service.user.AccountService;
import com.zj198.util.Constants;
import com.zj198.util.FreemarkerUtil;
import com.zj198.util.OrderNOCreator;
import com.zj198.util.Pager;
import com.zj198.util.PropertiesUtil;
import com.zj198.util.StringUtil;

/**
 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-6-20 10:07:46
 */
public class LoanRequestServiceImpl implements LoanRequestService {
	private UsrBankDAO usrBankDAO;
	private UsrUserDAO usrUserDAO;
	private OrdLoanRequestDAO ordLoanRequestDAO;
	private DicBaseRateDAO dicBaseRateDAO;
	private NotifyQueueService notifyQueueService;
	private OrdLoanAllocationDAO ordLoanAllocationDAO;
	private DictoryDataService dictoryDataService;
	private OrdLrRecommendService ordLrRecommendService;
	private NtyMessageService ntyMessageService;
	private AccountService accountService;

	public Pager findReqByCon(int currentPage, int pageCount, RequestSearch rq, Integer type) {
		return ordLoanRequestDAO.findReqByCon(currentPage, pageCount, rq, type);
	}

	public OrdLoanRequest getOrdDetailById(int id) {
		return ordLoanRequestDAO.get(id);
	}

	public Pager getPagationList(int userId, int pageNo, int pageSize) {
		return ordLoanRequestDAO.getPagationList(userId, pageNo, pageSize);
	}

	public Long countBankNum() {
		List<UsrBank> list = usrBankDAO.findAll();
		if (list != null && list.size() > 0) {
			return Long.valueOf(list.size());
		} else {
			return Long.valueOf(0);
		}
	}

	public Long countUserByType(Short type) {
		List<UsrUser> list = usrUserDAO.findUserByType(type);
//		System.out.println("d1#" + list.size());
		if (list != null && list.size() > 0) {
			return Long.valueOf(list.size());
		} else {
			return Long.valueOf(0);
		}
	}

	public Double getBaseRate(Integer month) {
		Double baseRate = new Double(0);// 基准利率
		List<DicBaseRate> list = dicBaseRateDAO.findAll();
		for (int i = 0; i < list.size(); i++) {
			DicBaseRate rate = list.get(i);
			if (month > rate.getStartdt() && month <= rate.getEnddt()) {
				baseRate = rate.getRate();
			}
		}
		return baseRate;
	}

	public String saveLoanRequest(SaveLoanRequestSpModel spModel) {
		OrdLoanRequest loan = spModel.getLoan();
		String[] loanObjects = spModel.getLoanObject();
		/**
		 * 将用户选择的贷款机构组合成一个字符串，以“，”分隔
		 */
		String loanOrg = "";
		if (loanObjects != null && loanObjects.length > 0) {
			loanOrg = ",";
			for (int i = 0; i < loanObjects.length; i++) {
				loanOrg += loanObjects[i] + ",";
			}
		}

		loan.setLoanOrganization(loanOrg);
		loan.setCreatedt(new Date());
		loan.setIsdeleted(new Integer(0));
		loan.setApplyStatus(new Integer(143));// 待审核
		ordLoanRequestDAO.save(loan);

		String applyNum = OrderNOCreator.rapidRequestOrderNO(loan.getId().intValue());// 申请编号
		loan.setApplyNum(applyNum);
		ordLoanRequestDAO.update(loan);
		
		try {
			//给客户发送EMAIL
			Map<String, Object> m = new HashMap<String, Object>();
			String body;
//			if(loan.getApplyType().intValue() == Constants.ORD_LOAN_TYPE_COMPANY){//企业
//				m.put("userName", spModel.getCompany().getCompanyname());
//			}else{
//				m.put("userName", spModel.getUser().getRealname());
//			}
			String content = "";
			if(spModel.getUserStatus() == 0){//已登陆用户
				content = String.format(PropertiesUtil.getByKey("loan.msg.new.apply"));
			}else{
				content = String.format(PropertiesUtil.getByKey("loan.msg.new.anduser"),spModel.getUser().getUsername());
			}
			m.put("pointContent", content);
			body = FreemarkerUtil.getContent("loanRequestTemplate.htm", m, false, null, null);
			NtyMessageQueue j = new NtyMessageQueue();
			j.setTitle("融资意向单提交 - 中国资金网");
			j.setContent(body);
			j.setReceiver(spModel.getUser().getEmail());
			j.setType(Constants.NTYMESSAGEQUEUE_TYPE_EMAIL);
			notifyQueueService.addNewMessage(j);
			
			//给客户发送站内消息
			ntyMessageService.sendWebMsg(new SendWebMsgSpModel(spModel.getUser().getId(),0, "融资意向单提交", content));
			//给资金网客服发送EMAIL
			Map<String, Object> m1 = new HashMap<String, Object>();
			m1.put("currentTime", new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
			m1.put("loanNum", loan.getApplyNum());
			m1.put("loanAmount", loan.getLoanAmount());
			m1.put("userName", spModel.getUser().getRealname());
			m1.put("userMobile", spModel.getUser().getMobile());
			m1.put("userEmail", spModel.getUser().getEmail());
			if(loan.getApplyType().intValue() == Constants.ORD_LOAN_TYPE_COMPANY){//企业
				m1.put("companyName", "企业名称：" + spModel.getCompany().getCompanyname());
				m1.put("address", dictoryDataService.getPCDNameByIds(spModel.getCompany().getBizprovinceid(), spModel.getCompany().getBizcityid(), spModel.getCompany().getBizdistrictid()));
			}else{
				m1.put("companyName","");
				m1.put("address", dictoryDataService.getPCDNameByIds(spModel.getPerson().getProvinceid(), spModel.getPerson().getCityid(), spModel.getPerson().getDistrictid()));
			}
			String body1 = FreemarkerUtil.getContent("loanRequestAdminTemplate.htm", m1, false, null, null);
			List<String> ms = StringUtil.getStringList(PropertiesUtil.getByKey(Constants.EMAIL_ZJ198));
			if(ms != null && ms.size() > 0){
				for(String email: ms){
					NtyMessageQueue j1 = new NtyMessageQueue();
					j1.setTitle("融资意向单提交 - 中国资金网");
					j1.setContent(body1);
					j1.setReceiver(email);
					j1.setType(Constants.NTYMESSAGEQUEUE_TYPE_EMAIL);
					notifyQueueService.addNewMessage(j1);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return applyNum;
	}
	
	public Pager getAdminRequest(FindFinanceAdminSpModel spModel) {
		return ordLoanRequestDAO.getAdminRequest(spModel);
	}
	
	public void updateLoan(OrdLoanRequest olr) {
		OrdLoanRequest o = ordLoanRequestDAO.get(olr.getId());
		o.setApplyStatus(olr.getApplyStatus());
		o.setToOrgStatus(olr.getToOrgStatus());
		o.setToOrgMemo(olr.getToOrgMemo());
		
		ordLoanRequestDAO.saveOrUpdate(o);
	}
	
	public void updateZj198Allocation(OrdLoanRequest olr, Integer userId, Integer[] prdIds, Integer type){
		OrdLoanRequest o = ordLoanRequestDAO.get(olr.getId());
		o.setApplyStatus(olr.getApplyStatus());
		o.setToOrgStatus(olr.getToOrgStatus());
		o.setToOrgMemo(olr.getToOrgMemo());
		
		ordLoanRequestDAO.saveOrUpdate(o);
		/**
		 * 保存推荐产品
		 */
		ordLrRecommendService.saveSelRecProByAdmin(o.getId(), userId, prdIds, Constants.ORD_LOAN_RECOMMEND_TYPE_ZJ);
		
		try {
			//给客户发送EMAIL
			Map<String, Object> m = new HashMap<String, Object>();
			String body;
			String content = String.format(PropertiesUtil.getByKey("loan.msg.zj198.allocation"));
			m.put("pointContent", content);
			body = FreemarkerUtil.getContent("loanRequestTemplate.htm", m, false, null, null);
			NtyMessageQueue j = new NtyMessageQueue();
			j.setTitle("融资意向已处理 - 中国资金网");
			j.setContent(body);
			j.setReceiver(accountService.getUserById(o.getUserId()).getEmail());
			j.setType(Constants.NTYMESSAGEQUEUE_TYPE_EMAIL);
			notifyQueueService.addNewMessage(j);
			
			//给客户发送站内消息
			ntyMessageService.sendWebMsg(new SendWebMsgSpModel(o.getUserId(), userId, "融资意向已处理", content));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void updateZj198ToOrg(OrdLoanRequest olr, Integer userId, Integer[] orgIds){
		this.updateLoan(olr);
		if(orgIds != null && orgIds.length > 0){
			for(Integer i : orgIds){
				OrdLoanAllocation a = new OrdLoanAllocation();
				a.setRequestId(olr.getId());
				a.setOrgId(i);
				a.setCreateUserId(userId);
				a.setCreateDt(new Date());
				a.setOrgCheckStatus(0);//未处理
				ordLoanAllocationDAO.save(a);
			}
		}
		try {
			for(int i =0 ; i< orgIds.length; i++){
				Map<String, Object> m = new HashMap<String, Object>();
				String body;
				String content = String.format(PropertiesUtil.getByKey("loan.msg.to.org"));
				m.put("pointContent", content);
				body = FreemarkerUtil.getContent("loanRequestTemplate.htm", m, false, null, null);
				NtyMessageQueue j = new NtyMessageQueue();
				j.setTitle("融资意向单推荐- 中国资金网");
				j.setContent(body);
				j.setReceiver(accountService.getUserById(orgIds[i]).getEmail());
				j.setType(Constants.NTYMESSAGEQUEUE_TYPE_EMAIL);
				notifyQueueService.addNewMessage(j);
				
				//给客户发送站内消息
				ntyMessageService.sendWebMsg(new SendWebMsgSpModel(orgIds[i], userId, "融资意向单推荐", content));
			}
			//给客户发送EMAIL
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<OrdLoanRequest> getTopThree(int userId) {
		return ordLoanRequestDAO.getTopThree(userId);
	}
	
	public List<OrdLoanRequest> getTopThrees(int userId) {
		return ordLoanRequestDAO.getTopThrees(userId);
	}
	
	public List<OrdLoanAllocation> getLoanAllocation(Integer loanId){
		List<OrdLoanAllocation> list = this.ordLoanAllocationDAO.getLoanAllocation(loanId);
		for(OrdLoanAllocation a : list){
			a.setOrgName(this.dictoryDataService.getCompanyNameByUserId(a.getOrgId()));
			a.setLogo(usrUserDAO.get(a.getOrgId()).getLogo());
		}
		return list;
	}
	public OrdLoanAllocation getOrgLoanAllocation(Integer loanId, Integer orgId){
		return this.ordLoanAllocationDAO.getOrgLoanAllocation(loanId, orgId);
	}
	
	public void addLoanToOrg(Integer requestId, Integer userId, Integer[] orgIds){
		if(orgIds != null && orgIds.length > 0){
			for(Integer i : orgIds){
				OrdLoanAllocation a = new OrdLoanAllocation();
				a.setRequestId(requestId);
				a.setOrgId(i);
				a.setCreateUserId(userId);
				a.setCreateDt(new Date());
				a.setOrgCheckStatus(0);//未处理
				ordLoanAllocationDAO.save(a);
			}
		}
	}
	
	public void updateAllocation(Integer requestId, Integer userId, String allocationContent, Integer[] prdIds, Integer type){
		/**
		 * 意向单状态改为已处理
		 */
		OrdLoanRequest r = this.ordLoanRequestDAO.get(requestId);
		r.setApplyStatus(Constants.ORD_LOAN_ST_CHECK);
		this.ordLoanRequestDAO.update(r);
		/**
		 * 保存银行处理意见
		 */
		OrdLoanAllocation a = ordLoanAllocationDAO.getOrgLoanAllocation(requestId, userId);
		a.setOrgCheckStatus(1);//已处理
		a.setOrgCheckDt(new Date());
		a.setOrgCheckMemo(allocationContent);
		this.ordLoanAllocationDAO.update(a);
		/**
		 * 保存推荐产品
		 */
		this.ordLrRecommendService.saveSelRecProByAdmin(requestId, userId, prdIds, type);
		
		try {
			//给客户发送EMAIL
			Map<String, Object> m = new HashMap<String, Object>();
			String body;
			String bankName = dictoryDataService.getCompanyNameByUserId(userId);
			String content = String.format(PropertiesUtil.getByKey("loan.msg.org.allocation"),bankName);
			m.put("pointContent", content);
			body = FreemarkerUtil.getContent("loanRequestTemplate.htm", m, false, null, null);
			NtyMessageQueue j = new NtyMessageQueue();
			j.setTitle("融资意向" + bankName + "已回复- 中国资金网");
			j.setContent(body);
			j.setReceiver(accountService.getUserById(r.getUserId()).getEmail());
			j.setType(Constants.NTYMESSAGEQUEUE_TYPE_EMAIL);
			notifyQueueService.addNewMessage(j);
			
			//给客户发送站内消息
			ntyMessageService.sendWebMsg(new SendWebMsgSpModel(r.getUserId(), userId, "融资意向" + bankName + "已回复", content));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//setter and getter
	public void setUsrBankDAO(UsrBankDAO usrBankDAO) {
		this.usrBankDAO = usrBankDAO;
	}

	public void setUsrUserDAO(UsrUserDAO usrUserDAO) {
		this.usrUserDAO = usrUserDAO;
	}

	public void setOrdLoanRequestDAO(OrdLoanRequestDAO ordLoanRequestDAO) {
		this.ordLoanRequestDAO = ordLoanRequestDAO;
	}

	public void setDicBaseRateDAO(DicBaseRateDAO dicBaseRateDAO) {
		this.dicBaseRateDAO = dicBaseRateDAO;
	}
	public void setNotifyQueueService(NotifyQueueService notifyQueueService) {
		this.notifyQueueService = notifyQueueService;
	}

	public void setOrdLoanAllocationDAO(OrdLoanAllocationDAO ordLoanAllocationDAO) {
		this.ordLoanAllocationDAO = ordLoanAllocationDAO;
	}

	public DictoryDataService getDictoryDataService() {
		return dictoryDataService;
	}

	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}

	public void setOrdLrRecommendService(OrdLrRecommendService ordLrRecommendService) {
		this.ordLrRecommendService = ordLrRecommendService;
	}

	public void setNtyMessageService(NtyMessageService ntyMessageService) {
		this.ntyMessageService = ntyMessageService;
	}

	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}
}
