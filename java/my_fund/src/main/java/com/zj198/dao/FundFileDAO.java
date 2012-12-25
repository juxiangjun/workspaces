package com.zj198.dao;

import com.zj198.model.FundFile;
import com.zj198.util.Pager;

public interface FundFileDAO extends BaseDAO<FundFile, Integer> {
	/**根据基金id法律文件----分页*/
	public Pager findFileByFundId(Integer id,Integer pageNo, Integer pageSize);
}
