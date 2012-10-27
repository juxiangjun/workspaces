package com.zj198.service.news.impl;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import com.zj198.dao.*;
import com.zj198.model.KnwContent;
import com.zj198.model.KnwTitle;
import com.zj198.model.KnwType;
import com.zj198.service.news.NewsService;

public class NewsServiceImpl implements NewsService {

	private KnwTypeDAO knwTypeDAO;
	private KnwTitleDAO knwTitleDAO;
	private KnwContentDAO knwContentDAO;
	
	/**理财主页上的新闻,默认新闻类型为5*/
	@SuppressWarnings("unchecked")
	@Override
	public List<KnwTitle> findFinanceNews(int pageSize) {
		Map<String, Object> map = this.knwTitleDAO.findKnwTitleByType(5, pageSize, 1);
		return (List<KnwTitle>) map.get("list");
	}
	
	/**首页上新闻*/
	@Override
	public List<KnwType> findHomePageNewsType() {
		return this.knwTypeDAO.findHomePageNewsType();
	}

	/**新闻类型*/
	@Override
	public KnwType getKnwTypeById(Integer id) {
		return this.knwTypeDAO.get(id);
	}
	
	/**首页公告*/
	@Override
	public List<KnwTitle> findAnnouncements() {
		return this.knwTitleDAO.findKnwTitleByType(Integer.valueOf(1));
	}
	
	/**所有新闻类型*/
	@Override
	public List<KnwType> findAllKnwType() {
		return this.knwTypeDAO.findAll();
	}
	/**保存新闻类型*/
	@Override
	public void saveKnwType(KnwType instance) {
		this.knwTypeDAO.saveOrUpdate(instance);
	}
	/**删除新闻类型*/
	@Override
	public void deleteKnwType(KnwType instance) {
		this.knwTypeDAO.deleteObject(instance);
	}
	/**新闻标题*/
	@Override
	public KnwTitle getKnwTitleById(Integer id) {
		return this.knwTitleDAO.get(id);
	}
	/**获取全部新闻标题*/
	@Override
	public List<KnwTitle> findAllKnwTitle() {
		return this.knwTitleDAO.findAll();
	}
	/**根据新闻类型查询相关新闻标题*/
	@Override
	public Map<String, Object> findKnwTitleByType(Integer typeId, int pageSize,
			int pageNo) {
		return this.knwTitleDAO.findKnwTitleByType(typeId, pageSize, pageNo);
	}
	/**未经审核的新闻标题*/
	@Override
	public Map<String, Object> findUnAuthenticatedTitleList(int pageSize, int pageNo) {
		return this.knwTitleDAO.findUnAuthenticatedList(pageSize, pageNo);
	}
	/**保存新闻标题*/
	@Override
	public void saveKnwTitle(KnwTitle instance) {
	
		if (instance.getId()==null) {
			instance.setIsAuthenticated(Short.valueOf("1"));
			instance.setDeletedFlag(Short.valueOf("0"));
			instance.setTotalPages(1);
			instance.setDeletedFlag((short) 0);
			instance.setIssuedDate(Calendar.getInstance().getTime());
			this.knwTitleDAO.save(instance);
		} else {
			this.knwTitleDAO.update(instance);
		}
		
	}
	/**删除新闻标题*/
	@Override
	public void deleteKnwTitle(KnwTitle instance) {
		this.knwTitleDAO.deleteObject(instance);
	}
	/**新闻内容*/
	@Override
	public KnwContent getKnwContentById(Integer id) {
		return this.knwContentDAO.get(id);
	}
	/**根据标题查询新闻内容*/
	@Override
	public List<KnwContent> findKnwContentByTitle(Integer titleId) {
		return this.knwContentDAO.findKnwContentByTitle(titleId);
	}
	/**保存新闻内容*/
	@Override
	public void saveKnwContent(KnwContent instance) {
		this.knwContentDAO.saveOrUpdate(instance);
	}
	/**删除新闻内容*/
	@Override
	public void deleteKnwContent(KnwContent instance) {
		this.knwContentDAO.deleteObject(instance);
	}
	/**根据新闻标题与内容页码查询指定内容*/
	@Override
	public KnwContent findKnwContentByTitle(Integer titleId,
			Integer pageId) {
		return this.knwContentDAO.getKnwContentByPageId(titleId, pageId);
	}
	
	/**Setter and Getter.*/
	public KnwTypeDAO getKnwTypeDAO() {
		return knwTypeDAO;
	}
	public void setKnwTypeDAO(KnwTypeDAO knwTypeDAO) {
		this.knwTypeDAO = knwTypeDAO;
	}
	public KnwTitleDAO getKnwTitleDAO() {
		return knwTitleDAO;
	}
	public void setKnwTitleDAO(KnwTitleDAO knwTitleDAO) {
		this.knwTitleDAO = knwTitleDAO;
	}
	public KnwContentDAO getKnwContentDAO() {
		return knwContentDAO;
	}
	public void setKnwContentDAO(KnwContentDAO knwContentDAO) {
		this.knwContentDAO = knwContentDAO;
	}

}
