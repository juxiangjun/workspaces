package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.PrdAttachTemplateDAO;
import com.zj198.model.PrdAttachTemplate;

public class PrdAttachTemplateDAOImpl extends HibernateDAO<PrdAttachTemplate, Integer> implements PrdAttachTemplateDAO {
	/**
	 * 融资产品资料模版
	 * @return
	 */
	public List<PrdAttachTemplate> findPrdTemplate(Integer dataId){
		String hql = "from PrdAttachTemplate t where t.templateType=0 and t.isDeleted=0 and t.dataId=:dataId";
		return this.list(hql, "dataId",dataId);
	}
	/**
	 * 补充资料模版
	 * @return
	 */
	public List<PrdAttachTemplate> findOrdSupplyTemplate(Integer supplyDataId){
		String hql = "from PrdAttachTemplate t where t.templateType=1 and t.isDeleted=0 and t.dataId=:supplyDataId";
		return this.list(hql, "supplyDataId",supplyDataId);
	}
}
