package com.zj198.service.loan.impl;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.zj198.dao.OrdBaseRateDAO;
import com.zj198.dao.OrdLoanRequestDAO;
import com.zj198.dao.UsrBankDAO;
import com.zj198.dao.UsrUserDAO;
import com.zj198.model.OrdBaseRate;
import com.zj198.model.OrdLoanRequest;
import com.zj198.model.UsrBank;
import com.zj198.model.UsrUser;
import com.zj198.service.loan.LoanRequestService;
import com.zj198.util.OrderNOCreator;
/**
 * @author 岳龙
 * Description:
 * CreateAuthor:岳龙
 * CreateDate:2012-6-20 10:07:46
 */
public class LoanRequestServiceImpl implements LoanRequestService {
	private UsrBankDAO usrBankDAO;
	private UsrUserDAO usrUserDAO;
	private OrdLoanRequestDAO ordLoanRequestDAO;
	private OrdBaseRateDAO ordBaseRateDAO;

    public Map<String, Object> getByObjCondition(OrdLoanRequest obj, Map<String, Map<String, Object>> map, int pageSize, int pageNo) {
        return ordLoanRequestDAO.getByObjCondition(obj, map, pageSize, pageNo);
    }
    public OrdLoanRequest getOrdDetailById(int id) {
        return ordLoanRequestDAO.get(id);
    }
    public Map<String, Object> getPagationList(String url, int userId, int pageSize, int pageNo) {
        return ordLoanRequestDAO.getPagationList(url, userId, pageSize, pageNo);
    }

	public Long countBankNum(){
		List<UsrBank> list = usrBankDAO.findAllBank();
		if(list != null && list.size() > 0){
			return Long.valueOf(list.size());
		}else{			
			return Long.valueOf(0);
		}
	}
	public Long countUserByType(Short type){
		List<UsrUser> list = usrUserDAO.findUserByType(type);
		System.out.println("d1#" + list.size());
		if(list != null && list.size() > 0){
			return Long.valueOf(list.size());
		}else{			
			return Long.valueOf(0);
		}
	}
	public Double getBaseRate(Integer month){
		Double baseRate = new Double(0);//基准利率
		List<OrdBaseRate> list = ordBaseRateDAO.findAllBaseRate();
		for(int i = 0; i < list.size() ; i++){
			OrdBaseRate rate = list.get(i);
			if(month > rate.getStartdt() && month <= rate.getEnddt()){
				baseRate = rate.getRate();
			}
		}
		return baseRate;
	}
	public String saveLoanRequest(OrdLoanRequest loan, String[] loanObjects, Integer minBound, Integer maxBound){
		/**
		 * 将用户选择的贷款机构组合成一个字符串，以“，”分隔
		 */
		String loanOrg = "";
		if(loanObjects != null && loanObjects.length > 0){
			loanOrg = ",";
			for(int i = 0; i<loanObjects.length; i++){
				loanOrg += loanObjects[i] + ",";
			}
		}
		/**
		 * 根据基准利率计算用户可接受的利率范围
		 */
//		Double baseRate = new Double(0);//基准利率
//		List<OrdBaseRate> list = ordBaseRateDAO.findAllBaseRate();
//		for(int i = 0; i < list.size() ; i++){
//			OrdBaseRate rate = list.get(i);
//			if(loan.getLoanMonth()>rate.getStartdt() && loan.getLoanMonth() <= rate.getEnddt()){
//				baseRate = rate.getRate();
//			}
//		}
//		Double rateLower = baseRate * (minBound/100);
//		Double rateUpper = baseRate * (maxBound/100);
//		loan.setRateLowerLimit(rateLower);
//		loan.setRateUpperLimit(rateUpper);
		
		loan.setLoanOrganization(loanOrg);
		loan.setCreatedt(new Date());
		loan.setIsdeleted(new Integer(0));
		loan.setApplyStatus(new Integer(143));//待审核
		ordLoanRequestDAO.save(loan);
		
		String applyNum = OrderNOCreator.rapidRequestOrderNO(loan.getId().intValue());//申请编号
		loan.setApplyNum(applyNum);
		ordLoanRequestDAO.update(loan);
		
		return applyNum;
	}

	public void setUsrBankDAO(UsrBankDAO usrBankDAO) {
		this.usrBankDAO = usrBankDAO;
	}
	public void setUsrUserDAO(UsrUserDAO usrUserDAO) {
		this.usrUserDAO = usrUserDAO;
	}
	public void setOrdLoanRequestDAO(OrdLoanRequestDAO ordLoanRequestDAO) {
		this.ordLoanRequestDAO = ordLoanRequestDAO;
	}
	public void setOrdBaseRateDAO(OrdBaseRateDAO ordBaseRateDAO) {
		this.ordBaseRateDAO = ordBaseRateDAO;
	}




}
