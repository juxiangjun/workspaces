package com.zj198.service.news;

import java.util.List;
import java.util.Map;

import com.zj198.model.KnwContent;
import com.zj198.model.KnwTitle;
import com.zj198.model.KnwType;

public interface NewsService {
	
	/**根据ID查找相应的新闻类型*/
	public KnwType getKnwTypeById(Integer id);
	/**查找所有的类别,供管理员操作*/
	public List<KnwType> findAllKnwType();
	/**保存管理对新闻类别的新增或改动*/
	public void saveKnwType(KnwType instance);
	/**删除(只做逻辑删除,将deletedFlag标记为1.*/
	public void deleteKnwType(KnwType instance);
	/**获取首页新闻类别*/
	public List<KnwType> findHomePageNewsType();
	
	
	/**根据Id查找某条具体新闻主题*/
	public KnwTitle getKnwTitleById(Integer id);
	/**查找全部的新闻*/
	public List<KnwTitle> findAllKnwTitle();
	/**根据新闻类别查找,并分页*/
	public Map<String, Object> findKnwTitleByType(Integer typeId, int pageSize, int pageNo);
	/**查找未经审核的新闻*/
	public Map<String, Object> findUnAuthenticatedTitleList(int pageSize, int pageNo);
	/**保存*/
	public void saveKnwTitle(KnwTitle instance);
	/**删除*/
	public void deleteKnwTitle(KnwTitle instance);
	/***获取首页公告*/
	public List<KnwTitle> findAnnouncements();
	/***获取理财资讯*/
	public List<KnwTitle> findFinanceNews(int pageSize);
	
	/**Get By Id*/
	public KnwContent getKnwContentById(Integer id);
	public KnwContent findKnwContentByTitle(Integer titleId, Integer pageId);
	
	/**根据新闻主题查找相应的内容*/
	public List<KnwContent> findKnwContentByTitle(Integer titleId);
	/**保存*/
	public void saveKnwContent(KnwContent instance);
	/**删除*/
	public void deleteKnwContent(KnwContent instance);
	
}
