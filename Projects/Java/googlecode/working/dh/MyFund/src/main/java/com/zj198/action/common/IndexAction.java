package com.zj198.action.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.KnwTitle;
import com.zj198.model.KnwType;
import com.zj198.model.PrdBankfinance;
import com.zj198.model.SinItem;
import com.zj198.service.finservice.FinanceProdService;
import com.zj198.service.news.NewsService;
import com.zj198.service.sin.ServiceInfoService;

public class IndexAction extends BaseAction{
	private static final Logger log = LoggerFactory.getLogger(IndexAction.class);
	
	private List<PrdBankfinance> bankFinanceList;
	private List<KnwTitle> announcements;
	private List<KnwTitle> financeInfo;
	private List<KnwType> newsTypeList;
	private List<Object> newsGroupTitles;
	private List<SinItem> serviceItemList;
	
	private FinanceProdService financeProdService;
	private NewsService newsService;
	private ServiceInfoService serviceInfoService;
	
	//整站首页
	public String execute(){
		bankFinanceList = financeProdService.findByBenefitRate(3);
		this.getNewsRelatedData();
		this.getServiceInfoList();
		return SUCCESS;
	}
	
	private void getServiceInfoList() {
		this.serviceItemList = this.serviceInfoService.findSinItemByRecentN(3);
		log.debug(String.valueOf(this.serviceItemList.size()));
	}
	
	@SuppressWarnings("unchecked")
	private void getNewsRelatedData() {
		this.announcements = newsService.findAnnouncements();
		newsTypeList = newsService.findHomePageNewsType();
		newsGroupTitles = new ArrayList<Object>();
		for (int i=0; i<newsTypeList.size(); i++) {
			KnwType knwType = newsTypeList.get(i);
			Integer typeId =knwType.getId();
			Map<String, Object> map = this.newsService.findKnwTitleByType(typeId, 3, 1);
			List<KnwTitle> list = (List<KnwTitle>) map.get("list");
			this.newsGroupTitles.add(list);
		}
		
		ActionContext context = ActionContext.getContext();
		Map<String, Object> application = context.getApplication();
		application.put("announcements", this.announcements);
	}
	
	//setter and getter
	public List<PrdBankfinance> getBankFinanceList() {
		return bankFinanceList;
	}

	public List<KnwTitle> getFinanceInfo() {
		return financeInfo;
	}

	public void setFinanceInfo(List<KnwTitle> financeInfo) {
		this.financeInfo = financeInfo;
	}

	public List<KnwType> getNewsTypeList() {
		return newsTypeList;
	}

	public void setNewsGroupTitles(List<Object> newsGroupTitles) {
		this.newsGroupTitles = newsGroupTitles;
	}

	public List<Object> getNewsGroupTitles() {
		return newsGroupTitles;
	}

	public void setNewsTypeList(List<KnwType> newsTypeList) {
		this.newsTypeList = newsTypeList;
	}

	public void setFinanceProdService(FinanceProdService financeProdService) {
		this.financeProdService = financeProdService;
	}

	public List<KnwTitle> getAnnouncements() {
		return announcements;
	}

	public void setAnnouncements(List<KnwTitle> announcements) {
		this.announcements = announcements;
	}

	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}

	public List<SinItem> getServiceItemList() {
		return serviceItemList;
	}

	public void setServiceItemList(List<SinItem> serviceItemList) {
		this.serviceItemList = serviceItemList;
	}

	public ServiceInfoService getServiceInfoService() {
		return serviceInfoService;
	}

	public void setServiceInfoService(ServiceInfoService serviceInfoService) {
		this.serviceInfoService = serviceInfoService;
	}
	
	
}
