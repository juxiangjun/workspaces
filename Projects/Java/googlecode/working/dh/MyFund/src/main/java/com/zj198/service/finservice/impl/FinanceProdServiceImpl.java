package com.zj198.service.finservice.impl;

import java.util.List;
import java.util.Map;

import com.zj198.dao.FudBaseDAO;
import com.zj198.dao.FudHisvalueDAO;
import com.zj198.dao.PrdBankfinanceDAO;
import com.zj198.model.FudBase;
import com.zj198.model.FudHisvalue;
import com.zj198.model.PrdBankfinance;
import com.zj198.service.finservice.FinanceProdService;

public class FinanceProdServiceImpl implements FinanceProdService {
	
	private FudBaseDAO fundBaseDAO;
	private FudHisvalueDAO fundHistoryDAO;
	private PrdBankfinanceDAO prdBankfinanceDAO;
	

	/**
	 * @function: 根据基金类型进行查询,并分页.
	 * @param typeName
	 * @param pageSize
	 * @param pageNo
	 * @return
	 */
	@Override
	public Map<String, Object> findRecentlyList(String typeName, int pageSize,
			int pageNo) {
		return this.fundHistoryDAO.findRecentlyList(typeName, pageSize, pageNo);
	}
	
	/*
	 * 取得最近时间的基金数据
	 * @see com.zj198.service.finservice.FinanceProdService#findRecentlyList()
	 */
	@Override
	public List<FudHisvalue> findRecentlyList() {
		return this.fundHistoryDAO.findRecentlyList();
	}
	
	/*
	 * 根据基金代码查询基金的历史数据
	 * @see com.zj198.service.finservice.FinanceProdService#findAllByFundCode(java.lang.String)
	 */
	@Override
	public List<FudHisvalue> findAllByFundCode(String fundCode) {
		return this.fundHistoryDAO.findByFundCode(fundCode);
	}
	/*
	 * 根据基金代码查询基金的历史数据,分页
	 */

	@Override
	public Map<String, Object>  findAllByFundCode(String fundCode, int pageSize,
			int pageNo) {
		return this.fundHistoryDAO.findAllByFundCode(fundCode, pageSize, pageNo);
	}

	/*
	 * 根据收益率进行排名,取前Ｎ个.
	 * @see com.zj198.service.finservice.FinanceProdService#findByBenefitRate(java.lang.Integer)
	 */
	@Override
	public List<PrdBankfinance> findByBenefitRate(Integer num) {
		return this.prdBankfinanceDAO.findByBenefitRate(num);
	}

	/*
	 * 根据银行产品代码进行查询具体信息
	 * @see com.zj198.service.finservice.FinanceProdService#getBankfinanceByCode(java.lang.String)
	 */
	@Override
	public PrdBankfinance getBankfinanceByCode(String code) {
		return this.prdBankfinanceDAO.getByCode(code);
	}
	
	/*
	 * 查找全部银行产品,并分页
	 * @see com.zj198.service.finservice.FinanceProdService#findAll(int, int)
	 */
	@Override
	public Map<String, Object> findAll(int pageSize, int pageNo) {
		return this.prdBankfinanceDAO.findAll(pageSize, pageNo);
	}

	/**
	 * 根据多条件进行查询,条件内容写在Query数据中,并分页.此条件由URL传入,以顺序编号,共六个条件.
	 * query[0]:销售状态
	 * query[1]:银行
	 * query[2]:投资期限
	 * query[3]:产品年收益率
	 * query[4]:最低投资金额
	 * queyr[5]:根据用户输入的基金名称进行模糊查询
	 * @see com.zj198.service.finservice.FinanceProdService#findBankProductsByMultiQuery(java.lang.String[], int, int)
	 */
	public Map<String, Object> findBankProductsByMultiQuery(String[] query,
			int pageSize, int pageNo) {
		return this.prdBankfinanceDAO.findByMultiConditions(query, pageSize, pageNo);
	}

	@Override
	public Map<String, Object> findFundItemByMultiQuery(String[] query,
			int pageSize, int pageNo) {
		return null;
	}
	
	public void setPrdBankfinanceDAO(PrdBankfinanceDAO prdBankfinanceDAO) {
		this.prdBankfinanceDAO = prdBankfinanceDAO;
	}
	
	public void setFundBaseDAO(FudBaseDAO fundBaseDAO) {
		this.fundBaseDAO = fundBaseDAO;
	}
	public void setFundHistoryDAO(FudHisvalueDAO fundHistoryDAO) {
		this.fundHistoryDAO = fundHistoryDAO;
	}
	
	@Override
	public FudBase getBaseByFundCode(String fundCode) {
		return this.fundBaseDAO.getByFudCode(fundCode);
	}



}
