package com.zj198.action.admin.loan;

import java.io.InputStream;

import com.zj198.action.BaseAction;
import com.zj198.model.PrdAttachTemplate;
import com.zj198.model.PrdFinance;
import com.zj198.service.loan.FinanceAttachService;
import com.zj198.service.loan.FinanceProductService;
import com.zj198.util.UploadUtil;

public class PrdAttachDownloadAction extends BaseAction{
	private FinanceProductService financeProductService;
	private FinanceAttachService financeAttachService;
	private String fileName;
	private Integer prdId;
	private Integer tempId;
	
	public InputStream getAttachStream(){
		PrdFinance prd = financeProductService.getFinance(prdId);
		try {
			String downloadname = prd.getFinanceName() + prd.getAttach().substring(prd.getAttach().lastIndexOf("."));
			fileName = java.net.URLEncoder.encode(downloadname, "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		InputStream is = UploadUtil.getFileStream(prd.getAttach());
		return is;
	}
	public String execute() throws Exception {
		return SUCCESS;
	}
	
	public String downTemp(){
		return "templateDown";
	}
	public InputStream getTempStream(){
		PrdAttachTemplate t = financeAttachService.getPrdAttachTemplate(tempId);
		try {
			fileName = java.net.URLEncoder.encode(t.getOldName(), "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		InputStream is = UploadUtil.getFileStream(t.getFilePath());
		
		return is;
	}
	
	//setter and getter
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public void setFinanceAttachService(FinanceAttachService financeAttachService) {
		this.financeAttachService = financeAttachService;
	}
	public Integer getTempId() {
		return tempId;
	}
	public void setTempId(Integer tempId) {
		this.tempId = tempId;
	}
	public Integer getPrdId() {
		return prdId;
	}
	public void setPrdId(Integer prdId) {
		this.prdId = prdId;
	}
	public void setFinanceProductService(FinanceProductService financeProductService) {
		this.financeProductService = financeProductService;
	}
	
}
