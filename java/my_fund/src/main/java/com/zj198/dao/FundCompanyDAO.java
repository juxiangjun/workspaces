package com.zj198.dao;

import java.util.List;

import com.zj198.model.FundCompany;
import com.zj198.util.Pager;

public interface FundCompanyDAO extends BaseDAO<FundCompany, Integer> {
	/**基金公司----page*/
	public Pager findAll(int pageSize, int pageNo);
	
	/**基金公司----list---所有抓取到得基金公司*/
	public List<FundCompany> findComAllIssue();
}
