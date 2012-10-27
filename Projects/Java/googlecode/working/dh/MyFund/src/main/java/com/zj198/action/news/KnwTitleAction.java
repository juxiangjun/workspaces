package com.zj198.action.news;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import com.zj198.action.BaseAction;
import com.zj198.model.KnwTitle;
import com.zj198.model.KnwType;
import com.zj198.service.news.NewsService;
import com.zj198.util.Pagination;

public class KnwTitleAction extends BaseAction {

	private boolean continueToAdd = false;
	private Integer id;
	private Integer typeId = 0;
	private Integer pageSize = 20;
	private Integer pageNo = 1;
	private KnwTitle knwTitle;
	private List<KnwTitle> knwTitleList;
	private List<KnwType> knwTypeList;
	private Pagination pagination;
	private NewsService newsService;
	
	@Override
	public String execute() throws Exception {
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public String showHome() {
		Map<String, Object> map = this.newsService.findKnwTitleByType(typeId, pageSize, pageNo);
		this.knwTitleList = (List<KnwTitle>) map.get("list");
		this.pagination = (Pagination) map.get("pagination");
		return SUCCESS;
	}
	
	public String edit() {
		this.knwTypeList = this.newsService.findAllKnwType();
		this.getKnwTitleById(this.id);
		if (knwTitle.getTypeId() == null || knwTitle.getTypeId().intValue()<1) {
			KnwType type = this.newsService.getKnwTypeById(Integer.valueOf(this.typeId));
			this.knwTitle.setTypeId(type.getId());
			this.knwTitle.setTypeName(type.getName());
		}
		return "edit";
	}
	
	public String save() {
		String redirect;
		knwTitle.setIssuedDate(Calendar.getInstance().getTime());
		this.newsService.saveKnwTitle(knwTitle);
		this.typeId = knwTitle.getTypeId();
		if (this.continueToAdd) {
			this.id = 0;
			redirect = this.showHome();
		} else {
			redirect = this.edit();
		}
		return redirect;
	}
	
	public String delete() {
		this.getKnwTitleById(this.id);
		this.newsService.deleteKnwTitle(knwTitle);
		return this.showHome();
	}
	
	@SuppressWarnings("unchecked")
	public String findUnAuthenticatedTitles() {
		Map<String, Object> map = this.newsService.findUnAuthenticatedTitleList(pageSize, pageNo);
		this.knwTitleList = (List<KnwTitle>) map.get("list");
		this.pagination = (Pagination) map.get("pagination");
		return SUCCESS;
	}
	
	private void getKnwTitleById(Integer id) {
		if (this.id == null) {
			this.knwTitle = new KnwTitle();
		} else {
			this.knwTitle = this.newsService.getKnwTitleById(id);
		}
	}
	

	public Integer getKnwTypeId() {
		return typeId;
	}

	public void setKnwTypeId(Integer knwTypeId) {
		this.typeId = knwTypeId;
	}

	public NewsService getNewsService() {
		return newsService;
	}

	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}

	public KnwTitle getKnwTitle() {
		return knwTitle;
	}

	public void setKnwTitle(KnwTitle knwTitle) {
		this.knwTitle = knwTitle;
	}

	public List<KnwTitle> getKnwTitleList() {
		return knwTitleList;
	}

	public void setKnwTitleList(List<KnwTitle> knwTitleList) {
		this.knwTitleList = knwTitleList;
	}

	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public boolean isContinueToAdd() {
		return continueToAdd;
	}

	public void setContinueToAdd(boolean continueToAdd) {
		this.continueToAdd = continueToAdd;
	}

	public List<KnwType> getKnwTypeList() {
		return knwTypeList;
	}

	public void setKnwTypeList(List<KnwType> knwTypeList) {
		this.knwTypeList = knwTypeList;
	}
	
	

}
