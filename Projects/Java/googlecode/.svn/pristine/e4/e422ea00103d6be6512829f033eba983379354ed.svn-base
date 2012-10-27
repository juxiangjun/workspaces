package com.zj198.dao;

import java.util.List;
import java.util.Map;

import com.zj198.model.KnwTitle;

public interface KnwTitleDAO extends BaseDAO<KnwTitle, Integer> {

	/**根据新闻类别查找,并分页*/
	public Map<String, Object> findKnwTitleByType(Integer typeId, int pageSize, int pageNo);
	/**不分页*/
	public List<KnwTitle> findKnwTitleByType(Integer typeId);
	/**查找未经审核的新闻*/
	public Map<String, Object> findUnAuthenticatedList(int pageSize, int pageNo);

}
