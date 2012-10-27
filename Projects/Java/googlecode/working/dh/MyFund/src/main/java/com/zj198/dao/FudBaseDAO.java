package com.zj198.dao;

import java.util.List;
import java.util.Map;

import com.zj198.model.FudBase;

public interface FudBaseDAO extends BaseDAO<FudBase, String> {

	public FudBase getByFudCode(String fundCode);
	public List<String> findUniqueFundCompany();
	public Map<String, Object> findFudItemsByMultiQuery(String[] query, int pageSize, int pageNo);
}
