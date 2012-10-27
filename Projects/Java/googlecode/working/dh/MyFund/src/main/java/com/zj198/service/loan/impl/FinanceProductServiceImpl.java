package com.zj198.service.loan.impl;
import java.util.Date;
import java.util.Map;

import com.zj198.action.loan.model.FinanceProductExtendModel;
import com.zj198.dao.OrdFinanceProductDAO;
import com.zj198.model.OrdFinanceProduct;
import com.zj198.service.loan.FinanceProductService;
import com.zj198.service.loan.model.FinanceProductSpModel;
import com.zj198.service.loan.model.FinanceProductSrModel;
import com.zj198.util.StringUtil;
/**
 * @author 岳龙
 * Description:
 * CreateAuthor:岳龙
 * CreateDate:2012-7-05 14:54:57
 */
public class FinanceProductServiceImpl implements FinanceProductService {
	
	private OrdFinanceProductDAO ordFinanceProductDAO;
	
	public void setOrdFinanceProductDAO(OrdFinanceProductDAO ordFinanceProductDAO) {
		this.ordFinanceProductDAO = ordFinanceProductDAO;
	}
	/**
	 * @author 岳龙
	 * Description:
	 * CreateAuthor:岳龙
	 * CreateDate:2012-7-05 14:54:57
	 * @param 
	 * @return 
	 */
	public void findFinance() {
	}
	/**
	 * @author 岳龙
	 * Description:
	 * CreateAuthor:岳龙
	 * CreateDate:2012-7-05 14:54:57
	 * @param 
	 * @return 
	 */
	public FinanceProductSrModel saveFinance(FinanceProductSpModel spModel) {
		FinanceProductSrModel srModel = new FinanceProductSrModel();
		OrdFinanceProduct product = spModel.getProduct();
		FinanceProductExtendModel pe = spModel.getFinanceExtend();
		
		Integer financeType = product.getFinanceType();
		
		product.setProSpecial(StringUtil.getStrByArray(spModel.getProductSpecial()));
		product.setUploadWay(StringUtil.getStrByArray(spModel.getUploadWay()));
	
		if(financeType.intValue() == 151){
			product.setRepaymentType(StringUtil.getStrByArray(spModel.getRepaymentType()));
			product.setMortgageType(StringUtil.getStrByArray(spModel.getMortgage()));
			product.setPurposeType(StringUtil.getStrByArray(spModel.getPurposeCompany()));
			product.setCompanyAllAsset(pe.getCompanyAllAsset());
			product.setOperatIncome(pe.getOperatIncome());
			product.setSettingYear(pe.getSettingYear());
		}else if(financeType.intValue() == 152){
			product.setRepaymentType(StringUtil.getStrByArray(spModel.getRepaymentType()));
			product.setMortgageType(StringUtil.getStrByArray(spModel.getMortgage()));
			product.setPurposeType(StringUtil.getStrByArray(spModel.getPurposePersonRunning()));
			product.setCompanyAllAsset(pe.getCompanyAllAsset());
			product.setNeedEnsure(pe.getNeedEnsure());
			product.setExperience(pe.getExperience());
			product.setRunningArea(pe.getRunningArea());
			product.setCreditAcount(pe.getCreditAcount());
			product.setBankSalaryList(pe.getBankSalaryList());
		}else if(financeType.intValue() == 153){
			product.setRepaymentType(StringUtil.getStrByArray(spModel.getRepaymentType()));
			product.setMortgageType(StringUtil.getStrByArray(spModel.getMortgage()));
			product.setPurposeType(StringUtil.getStrByArray(spModel.getPurposePersonBuy()));
			product.setSalaryIncome(pe.getSalaryIncome());
			product.setSalaryPutWay(pe.getSalaryPutWay());
			product.setWorkTime(pe.getWorkTime());
			product.setHouse(pe.getHouse());
			product.setCreditAcount(pe.getCreditAcount());
			product.setBankSalaryList(pe.getBankSalaryList());
		}else if(financeType.intValue() == 154){
			product.setHouseProperty(StringUtil.getStrByArray(spModel.getHousePro()));
			product.setRepaymentType(StringUtil.getStrByArray(spModel.getRepaymentTypeHouse()));
			product.setUseTime(pe.getUseTime());
			product.setSurplus(pe.getSurplus());
			product.setSalaryIncome(pe.getSalaryIncome());
			product.setSalaryPutWay(pe.getSalaryPutWay());
			product.setWorkTime(pe.getWorkTime());
			product.setHouse(pe.getHouse());
			product.setCreditAcount(pe.getCreditAcount());
			product.setBankSalaryList(pe.getBankSalaryList());
		}
		
		product.setUserId(spModel.getUserId());
		product.setCreatedt(new Date());
		product.setProStatus(new Integer(177));//发布状态  待审核
		ordFinanceProductDAO.save(product);
		
		return srModel;
	}
	
	/**
	 * @author 岳龙
	 * Description:
	 * CreateAuthor:岳龙
	 * CreateDate:2012-7-05 14:54:57
	 * @param 
	 * @return 
	 */
	public void getFinance() {
	}
	/**
	 * @author 岳龙
	 * Description:
	 * CreateAuthor:岳龙
	 * CreateDate:2012-7-05 14:54:57
	 * @param 
	 * @return 
	 */
	public void updateFinance() {
	}
	/**
	 * @author 岳龙
	 * Description:
	 * CreateAuthor:岳龙
	 * CreateDate:2012-7-05 14:54:57
	 * @param 
	 * @return 
	 */
	public void searchDateFile() {
	}

	public Map<String, Object> getByCondition(OrdFinanceProduct obj, int pageSize, int pageNo) {
		
		return ordFinanceProductDAO.findByCondition(obj, pageSize, pageNo);
	}
}
