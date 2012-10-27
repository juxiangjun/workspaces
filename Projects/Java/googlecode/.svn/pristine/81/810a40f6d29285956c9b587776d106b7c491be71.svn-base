package com.zj198.dao;

import java.util.List;

import com.zj198.model.KnwContent;

public interface KnwContentDAO extends BaseDAO<KnwContent, Integer> {
	
	/**根据新闻主题查找相应的内容*/
	public List<KnwContent> findKnwContentByTitle(Integer titleId);
	/**根据内容页查找*/
	public KnwContent getKnwContentByPageId(int titleId, int pageId);
}
