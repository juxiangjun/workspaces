package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.OrdLoanAllocationDAO;
import com.zj198.model.OrdLoanAllocation;

public class OrdLoanAllocationDAOImpl  extends HibernateDAO<OrdLoanAllocation, Integer> implements OrdLoanAllocationDAO {
	public List<OrdLoanAllocation> getLoanAllocation(Integer loanId){
		String hql = "from OrdLoanAllocation t where t.requestId = :loanId";
		return this.list(hql, "loanId", loanId);
	}
	
	public OrdLoanAllocation getOrgLoanAllocation(Integer loanId, Integer orgId){
		String hql = "from OrdLoanAllocation t where t.requestId = :loanId and t.orgId= :orgId";
		List<OrdLoanAllocation> list = this.list(hql, "loanId", loanId, "orgId", orgId);
		if(list != null && list.size() > 0){
			return list.get(0);
		}else{
			return null;
		}
	}
}
