package com.zj198.action.loan;

import java.io.File;
import java.util.List;

import com.zj198.action.BaseAction;
import com.zj198.model.PrdAttachTemplate;
import com.zj198.model.vo.FinanceApplyAttachModel;
import com.zj198.service.loan.FinanceAttachService;

public class SupplyTempAttachAction extends BaseAction {
	private FinanceAttachService financeAttachService;
	private File upload;
	private String uploadFileName;
	private String uploadContentType;
	private Integer applyId;
	private List<FinanceApplyAttachModel> applySupplyAttachList;
	private List<PrdAttachTemplate> prdTemplateList;
	private Integer dataId;
	/**
	 * 补充资料清单显示
	 */
	public String execute() {
		applySupplyAttachList = financeAttachService.findApplyAttachSupply(applyId);
		return "templateUpload";
	}
	
	/**
	 * 模版上传
	 * @return
	 */
	public String uploadTemplate(){
		financeAttachService.saveOrdTemplate(upload, uploadFileName, uploadContentType, dataId);
		return "templateUploadSuccess";
	}
	/**
	 * 已上传模版查看
	 * @return
	 */
	public String getDataTemplates(){
		prdTemplateList = financeAttachService.findOrdSupplyTemplate(dataId);
		return "viewTemplate";
	}
	
	public String delTemp(){
		financeAttachService.deleteOrdTemplate(dataId);
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

	public Integer getApplyId() {
		return applyId;
	}

	public void setApplyId(Integer applyId) {
		this.applyId = applyId;
	}

	public List<FinanceApplyAttachModel> getApplySupplyAttachList() {
		return applySupplyAttachList;
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

	public void setFinanceAttachService(FinanceAttachService financeAttachService) {
		this.financeAttachService = financeAttachService;
	}
}
