package com.zj198.dao;

import java.util.List;
import java.util.Map;

import com.zj198.model.PrdBankfinance;

public interface PrdBankfinanceDAO extends BaseDAO<PrdBankfinance, Integer> {

	public List<PrdBankfinance> findByBenefitRate(int top);
	public Map<String, Object> findAll(int pageSize, int pageNo);
	public PrdBankfinance getByCode(String code);
	
	public Map<String, Object> findByMultiConditions(String[] query, int pageSize, int pageNo);
}
