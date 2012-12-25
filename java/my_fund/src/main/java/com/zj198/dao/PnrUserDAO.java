package com.zj198.dao;

import com.zj198.model.PnrUser;

public interface PnrUserDAO extends BaseDAO<PnrUser, Integer>{
	public PnrUser findPnrUserByName(String userName);
}
