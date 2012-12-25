package com.zj198.service.loan;

import java.io.File;
import java.util.Date;
import java.util.List;

import com.zj198.model.OrdFinanceApplyAttach;
import com.zj198.model.PrdAttachTemplate;
import com.zj198.model.PrdFinanceDatafile;
import com.zj198.model.vo.FinanceApplyAttachModel;
import com.zj198.util.Constants;
import com.zj198.util.UploadUtil;

public interface FinanceAttachService {
	public void updatePrdAttach(File upload, String uploadFileName, String uploadContentType, Integer prdId);
	public List<PrdFinanceDatafile> findPrdFinanceDatafile(Integer prdId);
	public List<PrdAttachTemplate> findPrdAttachTemplate(Integer prdId);
	public void savePrdTemplate(File upload, String uploadFileName, String uploadContentType, Integer dataId);
	public void deletePrdTemplate(Integer dataId);
	public PrdAttachTemplate getPrdAttachTemplate(Integer tempId);
	public List<PrdAttachTemplate> findOrdSupplyTemplate(Integer supplyDataId);
	public List<FinanceApplyAttachModel> findApplyAttachSupply(Integer applyId);
	
	public void saveOrdTemplate(File upload, String uploadFileName, String uploadContentType, Integer attachId);
	public void deleteOrdTemplate(Integer attachId);
}
