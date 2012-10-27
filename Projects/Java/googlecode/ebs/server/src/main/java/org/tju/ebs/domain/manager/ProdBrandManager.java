package org.tju.ebs.domain.manager;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.ProdBrand;
import org.tju.ebs.domain.dao.ProdBrandDAO;

/**
 * 
 * @创建人: tju
 * @创建日期:Jan 12, 2012 11:29:07 PM
 * @最近修改人:tju
 * @最近修改日期:Jan 12, 2012 11:29:07 PM
 * @功能描述:
 * @参数:
 * @约束:
 * @改动历史：
 * 
 */

public class ProdBrandManager extends BaseManager {

	/** Logger */
	private static final Logger log = LoggerFactory
			.getLogger(ProdBrandDAO.class);

	/** 依赖注入　ProdBrand */
	private ProdBrandDAO prodBrandDAO;

	/**
	 * 
	 * @创建人: tju
	 * @创建日期:Jan 12, 2012 11:29:07 PM
	 * @最近修改人:tju
	 * @最近修改日期:Jan 12, 2012 11:29:07 PM
	 * @功能名称:
	 * @功能描述:删除ProdBrand
	 * @参数:ProdBrand
	 * @约束:
	 * @改动历史：
	 * 
	 */
	public ProdBrand getProdBrandById(String id) {
		return this.prodBrandDAO.getProdBrandById(id);
	}

	/**
	 * 
	 * @创建人: tju
	 * @创建日期:Jan 12, 2012 11:29:07 PM
	 * @最近修改人:tju
	 * @最近修改日期:Jan 12, 2012 11:29:07 PM
	 * @功能名称:
	 * @功能描述:删除ProdBrand
	 * @参数:ProdBrand
	 * @约束:
	 * @改动历史：
	 * 
	 */
	public void delete(ProdBrand instance) throws Exception {
		log.debug("Deleting ProdBrand: ID=" + instance.getId());
		this.prodBrandDAO.delete(instance);
	}

	/**
	 * 
	 * @创建人: tju
	 * @创建日期:Jan 12, 2012 11:29:07 PM
	 * @最近修改人:tju
	 * @最近修改日期:Jan 12, 2012 11:29:07 PM
	 * @功能名称:
	 * @功能描述:保存ProdBrand
	 * @参数:ProdBrand
	 * @约束:
	 * @改动历史：
	 * 
	 */

	public void save(ProdBrand instance) throws Exception {
		log.debug("Saving ProdBrand: ID=" + instance.getId());
		this.prodBrandDAO.save(instance);
	}

	/**
	 * 
	 * @创建人: tju
	 * @创建日期:Jan 12, 2012 11:29:07 PM
	 * @最近修改人:tju
	 * @最近修改日期:Jan 12, 2012 11:29:07 PM
	 * @功能名称:
	 * @功能描述:根据全部结果集，无分页。
	 * @参数:
	 * @约束:
	 * @改动历史：
	 * 
	 */
	public List<ProdBrand> getAll() {
		return this.prodBrandDAO.getAll();
	}

	public ProdBrandDAO getProdBrandDAO() {
		return prodBrandDAO;
	}

	public void setProdBrandDAO(ProdBrandDAO prodBrandDAO) {
		this.prodBrandDAO = prodBrandDAO;
	}
}