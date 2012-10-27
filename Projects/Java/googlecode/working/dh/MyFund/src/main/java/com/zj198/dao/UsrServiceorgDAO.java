package com.zj198.dao;

import com.zj198.model.UsrServiceorg;

public interface UsrServiceorgDAO extends BaseDAO<UsrServiceorg, Integer>{
	public UsrServiceorg getByUid(Integer uid);
}
