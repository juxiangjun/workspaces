package org.tju.ebs.domain.manager;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.ProdProperty;
import org.tju.ebs.bean.ProdPropertyValue;
import org.tju.ebs.domain.dao.ProdPropertyDAO;
import org.tju.ebs.domain.dao.ProdPropertyValueDAO;

/**
 * 
 * @创建人: tju
 * @创建日期:Jan 27, 2012 8:45:53 AM
 * @最近修改人:tju
 * @最近修改日期:Jan 27, 2012 8:45:53 AM
 * @功能描述:
 * @参数:
 * @约束:
 * @改动历史：
 * 
 */

public class ProdPropertyManager extends BaseManager {

	/** Logger */
	private static final Logger log = LoggerFactory
			.getLogger(ProdPropertyDAO.class);

	/** 依赖注入　ProdProperty */
	private ProdPropertyDAO prodPropertyDAO;
	private ProdPropertyValueDAO prodPropertyValueDAO;

	/**
	 * 
	 * @创建人: tju
	 * @创建日期:Jan 27, 2012 8:45:53 AM
	 * @最近修改人:tju
	 * @最近修改日期:Jan 27, 2012 8:45:53 AM
	 * @功能名称:
	 * @功能描述:删除ProdProperty
	 * @参数:ProdProperty
	 * @约束:
	 * @改动历史：
	 * 
	 */
	public ProdProperty getProdPropertyById(String id) {
		return this.prodPropertyDAO.getProdPropertyById(id);
	}

	/**
	 * 
	 * @创建人: tju
	 * @创建日期:Jan 27, 2012 8:45:53 AM
	 * @最近修改人:tju
	 * @最近修改日期:Jan 27, 2012 8:45:53 AM
	 * @功能名称:
	 * @功能描述:删除ProdProperty
	 * @参数:ProdProperty
	 * @约束:
	 * @改动历史：
	 * 
	 */
	public void delete(ProdProperty instance) throws Exception {
		log.debug("Deleting ProdProperty: ID=" + instance.getId());
		this.prodPropertyDAO.delete(instance);
	}

	/**
	 * 
	 * @创建人: tju
	 * @创建日期:Jan 27, 2012 8:45:53 AM
	 * @最近修改人:tju
	 * @最近修改日期:Jan 27, 2012 8:45:53 AM
	 * @功能名称:
	 * @功能描述:保存ProdProperty
	 * @参数:ProdProperty
	 * @约束:
	 * @改动历史：
	 * 
	 */

	public void save(ProdProperty instance) throws Exception {
		log.debug("Saving ProdProperty: ID=" + instance.getId());
		this.prodPropertyDAO.save(instance);
	}

	/**
	 * 
	 * @创建人: tju
	 * @创建日期:Jan 27, 2012 8:45:53 AM
	 * @最近修改人:tju
	 * @最近修改日期:Jan 27, 2012 8:45:53 AM
	 * @功能名称:
	 * @功能描述:根据全部结果集，无分页。
	 * @参数:
	 * @约束:
	 * @改动历史：
	 * 
	 */
	public List<ProdProperty> getProdPropertyList() {
		return this.prodPropertyDAO.getAll();
	}

	/**
	 * 
	 * @创建人: tju
	 * @创建日期:Jan 27, 2012 8:45:53 AM
	 * @最近修改人:tju
	 * @最近修改日期:Jan 27, 2012 8:45:53 AM
	 * @功能名称:根据propPropertyId,取得ProdPropertyValue的值集合.
	 * @功能描述:不分页.
	 * @参数:
	 * @约束:
	 * @改动历史：
	 * 
	 */
	public List<ProdPropertyValue> getProdPropertyValueList(
			String prodPropertyId) {
		return this.prodPropertyValueDAO.getAll(prodPropertyId);
	}

	public ProdPropertyDAO getProdPropertyDAO() {
		return prodPropertyDAO;
	}

	public void setProdPropertyDAO(ProdPropertyDAO prodPropertyDAO) {
		this.prodPropertyDAO = prodPropertyDAO;
	}

	public ProdPropertyValueDAO getProdPropertyValueDAO() {
		return prodPropertyValueDAO;
	}

	public void setProdPropertyValueDAO(
			ProdPropertyValueDAO prodPropertyValueDAO) {
		this.prodPropertyValueDAO = prodPropertyValueDAO;
	}
}