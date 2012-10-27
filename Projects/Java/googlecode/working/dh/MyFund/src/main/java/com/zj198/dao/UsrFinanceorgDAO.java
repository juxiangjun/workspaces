package com.zj198.dao;

import com.zj198.model.UsrFinanceorg;

public interface UsrFinanceorgDAO extends BaseDAO<UsrFinanceorg, Integer>{
	public UsrFinanceorg getByUid(Integer uid);
}
