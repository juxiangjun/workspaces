package com.zj198.action.admin.news;

import java.util.List;

import com.zj198.action.BaseAction;
import com.zj198.model.KnwContent;
import com.zj198.model.KnwTitle;
import com.zj198.service.news.NewsService;
import com.zj198.util.Pagination;

public class KnwContentAction extends BaseAction {

	private Boolean continuedToAdd;
	private Integer titleId;
	private Integer pageId = 1;
	private Integer contentId;
	private KnwContent content;
	private KnwTitle title;
	private List<KnwContent> knwContentList;
	private Pagination pagination;
	
	private NewsService newsService;
	
	public String showHome() {
		this.title = newsService.getKnwTitleById(titleId);
		this.content =  newsService.findKnwContentByTitle(titleId, pageId);
		return SUCCESS;
	}
	
	public String edit() {
		this.getKnwContentById();
		return SUCCESS;
	}
	
	public String save() {
		
//		String redirect = this.showHome();
//		
//		if (this.continuedToAdd) {
//			redirect = this.edit();
//		}
		content.setPageId(1);
		content.setDeletedFlag((short) 0);
		this.newsService.saveKnwContent(content);
		return showHome();
	}
	
	public String deleteKnwContent() {
		this.newsService.deleteKnwContent(content);
		return this.showHome();
	}
	
	private void getKnwContentById() {
		if (this.contentId != null) {
			this.content = this.newsService.getKnwContentById(contentId);
		} else {
			this.content = new KnwContent();
		}
	}
	
	@Override
	public String execute() throws Exception {
		return null;
	}

	public Integer getContentId() {
		return contentId;
	}

	public void setContentId(Integer contentId) {
		this.contentId = contentId;
	}

	public KnwContent getContent() {
		return content;
	}

	public void setContent(KnwContent content) {
		this.content = content;
	}

	public List<KnwContent> getKnwContentList() {
		return knwContentList;
	}

	public void setKnwContentList(List<KnwContent> knwContentList) {
		this.knwContentList = knwContentList;
	}

	public NewsService getNewsService() {
		return newsService;
	}

	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}


	public Pagination getPagination() {
		return pagination;
	}


	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}


	public Integer getTitleId() {
		return titleId;
	}


	public void setTitleId(Integer titleId) {
		this.titleId = titleId;
	}


	public Integer getPageId() {
		return pageId;
	}


	public void setPageId(Integer pageId) {
		this.pageId = pageId;
	}

	public Boolean getContinuedToAdd() {
		return continuedToAdd;
	}

	public void setContinuedToAdd(Boolean continuedToAdd) {
		this.continuedToAdd = continuedToAdd;
	}

	public KnwTitle getTitle() {
		return title;
	}

	public void setTitle(KnwTitle title) {
		this.title = title;
	}

	
}
