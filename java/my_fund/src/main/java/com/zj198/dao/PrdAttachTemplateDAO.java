package com.zj198.dao;

import java.util.List;

import com.zj198.model.PrdAttachTemplate;

public interface PrdAttachTemplateDAO extends BaseDAO<PrdAttachTemplate, Integer> {
	/**
	 * 融资产品资料模版
	 * @return
	 */
	public List<PrdAttachTemplate> findPrdTemplate(Integer dataId);
	/**
	 * 补充资料模版
	 * @return
	 */
	public List<PrdAttachTemplate> findOrdSupplyTemplate(Integer supplyDataId);
}
