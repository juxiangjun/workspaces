package com.zj198.dao;

import java.util.List;
import java.util.Map;

import com.zj198.model.FudHisvalue;

public interface FudHisvalueDAO extends BaseDAO<FudHisvalue, Integer> {
	
	public List<FudHisvalue> findRecentlyList();
	public List<FudHisvalue> findByFundCode(String fundCode);
	public Map<String, Object> findAllByFundCode(String fundCode, int pageSize, int pageNo);
	/**
	 * @function: 根据基金类型进行查询,并分页.
	 * @param typeName
	 * @param pageSize
	 * @param pageNo
	 * @return
	 */
	public Map<String, Object> findRecentlyList(String typeName, int pageSize, int pageNo);
}
