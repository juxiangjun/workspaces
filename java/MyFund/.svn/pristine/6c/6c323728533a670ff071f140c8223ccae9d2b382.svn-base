package com.zj198.dao;

import java.util.List;

import com.zj198.model.OrdLoanAllocation;

public interface OrdLoanAllocationDAO extends BaseDAO<OrdLoanAllocation, Integer>{
	/**
	 * 查询融资意向单分配金融机构列表
	 * @param loanId
	 * @return
	 */
	public List<OrdLoanAllocation> getLoanAllocation(Integer loanId);
	/**
	 * 查询某意向单分配给金融机构的详细信息
	 * @param loanId
	 * @param orgId
	 * @return
	 */
	public OrdLoanAllocation getOrgLoanAllocation(Integer loanId, Integer orgId);
}
