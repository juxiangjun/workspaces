package com.zj198.service.loan.impl;

import java.io.File;
import java.util.Date;
import java.util.List;

import com.zj198.dao.OrdFinanceApplyAttachDAO;
import com.zj198.dao.PrdAttachTemplateDAO;
import com.zj198.dao.PrdFinanceDAO;
import com.zj198.dao.PrdFinanceDatafileDAO;
import com.zj198.model.OrdFinanceApplyAttach;
import com.zj198.model.PrdAttachTemplate;
import com.zj198.model.PrdFinance;
import com.zj198.model.PrdFinanceDatafile;
import com.zj198.model.vo.FinanceApplyAttachModel;
import com.zj198.service.loan.FinanceAttachService;
import com.zj198.util.Constants;
import com.zj198.util.UploadUtil;

public class FinanceAttachServiceImpl implements FinanceAttachService{
	private PrdFinanceDAO prdFinanceDAO;
	private PrdFinanceDatafileDAO prdFinanceDatafileDAO;
	private PrdAttachTemplateDAO prdAttachTemplateDAO;
	private OrdFinanceApplyAttachDAO ordFinanceApplyAttachDAO;
	
	public void updatePrdAttach(File upload, String uploadFileName, String uploadContentType, Integer prdId) {
		String newFileName = UploadUtil.upload(upload, uploadFileName, "template", Constants.UPLOAD_PRIVACY_PRIVATE);
		PrdFinance prd = prdFinanceDAO.get(prdId);
		prd.setAttach(newFileName);
		prdFinanceDAO.update(prd);
	}
	
	public List<PrdFinanceDatafile> findPrdFinanceDatafile(Integer prdId){
		List<PrdFinanceDatafile> list = prdFinanceDatafileDAO.findDataFileByPrdId(prdId);
		for(PrdFinanceDatafile f : list){
			if(f.getHaveMemo() != null && f.getHaveMemo() == 1){
				f.setOtherMemo(f.getOtherMemo().replaceAll("\r\n", "<br/>"));
			}
//			f.getAttachTemplateList().size();
		}
		return list;
	}
	
	public List<PrdAttachTemplate> findPrdAttachTemplate(Integer prdId){
		return prdAttachTemplateDAO.findPrdTemplate(prdId);
	}
	
	public List<PrdAttachTemplate> findOrdSupplyTemplate(Integer supplyDataId){
		return prdAttachTemplateDAO.findOrdSupplyTemplate(supplyDataId);
	}
	
	public List<FinanceApplyAttachModel> findApplyAttachSupply(Integer applyId){
		return ordFinanceApplyAttachDAO.findApplyAttachSupply(applyId);
	}

	public void savePrdTemplate(File upload, String uploadFileName, String uploadContentType, Integer dataId){
		String newFileName = UploadUtil.upload(upload, uploadFileName, "template", Constants.UPLOAD_PRIVACY_PRIVATE);
		PrdAttachTemplate template = new PrdAttachTemplate();
		template.setCreateDt(new Date());
		template.setDataId(dataId);
		template.setFilePath(newFileName);
		template.setIsDeleted(0);
		template.setOldName(uploadFileName);
		template.setTemplateType(Constants.TEMPLATE_TYPE_PRD);//产品资料模版
		prdAttachTemplateDAO.save(template);
		
		PrdFinanceDatafile p = prdFinanceDatafileDAO.get(dataId);
		p.setHaveTemplate(1);//包含模版
		prdFinanceDatafileDAO.update(p);
	}
	
	public void deletePrdTemplate(Integer dataId){
		PrdAttachTemplate t =prdAttachTemplateDAO.get(dataId);
		t.setIsDeleted(1);
		prdAttachTemplateDAO.update(t);
		
		List<PrdAttachTemplate> list = prdAttachTemplateDAO.findPrdTemplate(t.getDataId());
		if(list == null || list.size() == 0){
			PrdFinanceDatafile p = prdFinanceDatafileDAO.get(t.getDataId());
			p.setHaveTemplate(0);//不包含模版
			prdFinanceDatafileDAO.update(p);
		}
	}
	public void saveOrdTemplate(File upload, String uploadFileName, String uploadContentType, Integer attachId){
		String newFileName = UploadUtil.upload(upload, uploadFileName, "template", Constants.UPLOAD_PRIVACY_PRIVATE);
		PrdAttachTemplate template = new PrdAttachTemplate();
		template.setCreateDt(new Date());
		template.setDataId(attachId);
		template.setFilePath(newFileName);
		template.setIsDeleted(0);
		template.setOldName(uploadFileName);
		template.setTemplateType(Constants.TEMPLATE_TYPE_ORD);//产品资料模版
		prdAttachTemplateDAO.save(template);
		
		OrdFinanceApplyAttach attach = ordFinanceApplyAttachDAO.get(attachId);
		attach.setHaveTemplate(1);//包含模版
		ordFinanceApplyAttachDAO.update(attach);
	}
	public void deleteOrdTemplate(Integer tempId){
		PrdAttachTemplate t =prdAttachTemplateDAO.get(tempId);
		t.setIsDeleted(1);
		prdAttachTemplateDAO.update(t);
		
		List<PrdAttachTemplate> list = prdAttachTemplateDAO.findOrdSupplyTemplate(t.getDataId());
		if(list == null || list.size() == 0){
			OrdFinanceApplyAttach attach = ordFinanceApplyAttachDAO.get(t.getDataId());
			attach.setHaveTemplate(0);//不包含模版
			ordFinanceApplyAttachDAO.update(attach);
		}
	}
	public PrdAttachTemplate getPrdAttachTemplate(Integer tempId){
		return prdAttachTemplateDAO.get(tempId);
	}
	//setter and getter
	public void setPrdFinanceDAO(PrdFinanceDAO prdFinanceDAO) {
		this.prdFinanceDAO = prdFinanceDAO;
	}

	public void setPrdFinanceDatafileDAO(PrdFinanceDatafileDAO prdFinanceDatafileDAO) {
		this.prdFinanceDatafileDAO = prdFinanceDatafileDAO;
	}

	public void setPrdAttachTemplateDAO(PrdAttachTemplateDAO prdAttachTemplateDAO) {
		this.prdAttachTemplateDAO = prdAttachTemplateDAO;
	}

	public void setOrdFinanceApplyAttachDAO(
			OrdFinanceApplyAttachDAO ordFinanceApplyAttachDAO) {
		this.ordFinanceApplyAttachDAO = ordFinanceApplyAttachDAO;
	}
}
