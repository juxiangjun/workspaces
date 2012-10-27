package com.zj198.service.loan;

import java.util.Map;

import com.zj198.model.OrdFinanceProduct;
import com.zj198.service.loan.model.FinanceProductSpModel;
import com.zj198.service.loan.model.FinanceProductSrModel;

/**
 * @author 岳龙
 * Description:
 * CreateAuthor:岳龙
 * CreateDate:2012-7-05 14:54:57
 */
public interface FinanceProductService {

	public void findFinance();
	public FinanceProductSrModel saveFinance(FinanceProductSpModel spModel);
	public void getFinance();
	public void updateFinance();
	public void searchDateFile();
	
	/**
	 * 查询产品结果
	 * @param obj
	 * @param pageSize
	 * @param pageNo
	 * @return
	 */
	public Map<String, Object> getByCondition(OrdFinanceProduct obj, int pageSize, int pageNo);
}
