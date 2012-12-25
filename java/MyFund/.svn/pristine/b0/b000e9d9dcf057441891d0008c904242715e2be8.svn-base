package com.zj198.action.loan;

import java.io.File;
import java.util.List;

import com.zj198.action.BaseAction;
import com.zj198.model.PrdAttachTemplate;
import com.zj198.model.PrdFinanceDatafile;
import com.zj198.service.loan.FinanceAttachService;

public class ProductAttachAction extends BaseAction {
	private FinanceAttachService financeAttachService;
	private File upload;
	private String uploadFileName;
	private String uploadContentType;
	private List<PrdFinanceDatafile> prdDataList;
	private List<PrdAttachTemplate> prdTemplateList;
	private Integer prdId;
	private Integer dataId;
	
	/**
	 * 上传融资产品附件
	 */
	public String execute() {
		financeAttachService.updatePrdAttach(upload, uploadFileName, uploadContentType, prdId);
		
		return SUCCESS;
	}
	
	/**
	 * 模版上传
	 * @return
	 */
	public String uploadTemplate(){
		financeAttachService.savePrdTemplate(upload, uploadFileName, uploadContentType, dataId);
		return "templateUploadSuccess";
	}
	/**
	 * 资料清单显示
	 * @return
	 */
	public String applyDataList(){
		prdDataList = financeAttachService.findPrdFinanceDatafile(prdId);
		return "templateUpload";
	}
	/**
	 * 已上传模版查看
	 * @return
	 */
	public String getDataTemplates(){
		prdTemplateList = financeAttachService.findPrdAttachTemplate(dataId);
		return "viewTemplate";
	}
	
	public String delTemp(){
		financeAttachService.deletePrdTemplate(dataId);
		writeJson("{\"success\":\"true\"}");
		return null;
	}

	//setter and getter
	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public Integer getPrdId() {
		return prdId;
	}

	public void setPrdId(Integer prdId) {
		this.prdId = prdId;
	}

	public void setFinanceAttachService(FinanceAttachService financeAttachService) {
		this.financeAttachService = financeAttachService;
	}

	public List<PrdFinanceDatafile> getPrdDataList() {
		return prdDataList;
	}

	public List<PrdAttachTemplate> getPrdTemplateList() {
		return prdTemplateList;
	}

	public Integer getDataId() {
		return dataId;
	}

	public void setDataId(Integer dataId) {
		this.dataId = dataId;
	}
}
