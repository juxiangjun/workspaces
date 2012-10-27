package org.tju.ebs.domain.manager;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.ProdCategory;
import org.tju.ebs.domain.dao.ProdCategoryDAO;

/**
 * 
 * @创建人: tju
 * @创建日期:Jan 27, 2012 8:44:13 AM
 * @最近修改人:tju
 * @最近修改日期:Jan 27, 2012 8:44:13 AM
 * @功能描述:
 * @参数:
 * @约束:
 * @改动历史：
 * 
 */

public class ProdCategoryManager extends BaseManager {

	/** Logger */
	private static final Logger log = LoggerFactory
			.getLogger(ProdCategoryDAO.class);

	/** 依赖注入　ProdCategory */
	private ProdCategoryDAO prodCategroyDAO;

	/**
	 * 
	 * @创建人: tju
	 * @创建日期:Jan 27, 2012 8:44:13 AM
	 * @最近修改人:tju
	 * @最近修改日期:Jan 27, 2012 8:44:13 AM
	 * @功能名称:
	 * @功能描述:删除ProdCategory
	 * @参数:ProdCategory
	 * @约束:
	 * @改动历史：
	 * 
	 */
	public ProdCategory getProdCategoryById(String id) {
		return this.prodCategroyDAO.getProdCategoryById(id);
	}

	/**
	 * 
	 * @创建人: tju
	 * @创建日期:Jan 27, 2012 8:44:13 AM
	 * @最近修改人:tju
	 * @最近修改日期:Jan 27, 2012 8:44:13 AM
	 * @功能名称:
	 * @功能描述:删除ProdCategory
	 * @参数:ProdCategory
	 * @约束:
	 * @改动历史：
	 * 
	 */
	public void delete(ProdCategory instance) throws Exception {
		log.debug("Deleting ProdCategory: ID=" + instance.getId());
		this.prodCategroyDAO.delete(instance);
	}

	/**
	 * 
	 * @创建人: tju
	 * @创建日期:Jan 27, 2012 8:44:13 AM
	 * @最近修改人:tju
	 * @最近修改日期:Jan 27, 2012 8:44:13 AM
	 * @功能名称:
	 * @功能描述:保存ProdCategory
	 * @参数:ProdCategory
	 * @约束:
	 * @改动历史：
	 * 
	 */

	public void save(ProdCategory instance) throws Exception {
		log.debug("Saving ProdCategory: ID=" + instance.getId());
		this.prodCategroyDAO.save(instance);
	}

	/**
	 * 
	 * @创建人: tju
	 * @创建日期:Jan 27, 2012 8:44:13 AM
	 * @最近修改人:tju
	 * @最近修改日期:Jan 27, 2012 8:44:13 AM
	 * @功能名称:
	 * @功能描述:根据全部结果集，无分页。
	 * @参数:
	 * @约束:
	 * @改动历史：
	 * 
	 */
	public List<ProdCategory> getAll() {
		return this.prodCategroyDAO.getAll();
	}

	/**
	 * 
	 * @创建人: tju
	 * @创建日期:Jan 27, 2012 8:44:13 AM
	 * @最近修改人:tju
	 * @最近修改日期:Jan 27, 2012 8:44:13 AM
	 * @功能名称: GetCategoryByParentId
	 * @功能描述:根据全部结果集，无分页。
	 * @参数: String:ParentId
	 * @约束:
	 * @改动历史：
	 * 
	 */
	public List<ProdCategory> getAll(String parentId) {
		return this.prodCategroyDAO.getAll(parentId);
	}

	public ProdCategoryDAO getProdCategoryDAO() {
		return prodCategroyDAO;
	}

	public void setProdCategoryDAO(ProdCategoryDAO prodCategroyDAO) {
		this.prodCategroyDAO = prodCategroyDAO;
	}
}