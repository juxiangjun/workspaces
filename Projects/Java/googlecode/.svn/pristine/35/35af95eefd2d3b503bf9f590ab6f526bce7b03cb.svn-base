package org.tju.ebs.domain.manager;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.ProdItem;
import org.tju.ebs.domain.dao.ProdItemDAO;

/**
 * 
 * @创建人: tju
 * @创建日期:Jan 27, 2012 8:44:38 AM
 * @最近修改人:tju
 * @最近修改日期:Jan 27, 2012 8:44:38 AM
 * @功能描述:
 * @参数:
 * @约束:
 * @改动历史：
 * 
 */

public class ProdItemManager extends BaseManager {

	/** Logger */
	private static final Logger log = LoggerFactory
			.getLogger(ProdItemDAO.class);

	/** 依赖注入　ProdItem */
	private ProdItemDAO prodItemDAO;

	/**
	 * 
	 * @创建人: tju
	 * @创建日期:Jan 27, 2012 8:44:38 AM
	 * @最近修改人:tju
	 * @最近修改日期:Jan 27, 2012 8:44:38 AM
	 * @功能名称:
	 * @功能描述:删除ProdItem
	 * @参数:ProdItem
	 * @约束:
	 * @改动历史：
	 * 
	 */
	public ProdItem getProdItemById(String id) {
		return this.prodItemDAO.getProdItemById(id);
	}

	/**
	 * 
	 * @创建人: tju
	 * @创建日期:Jan 27, 2012 8:44:38 AM
	 * @最近修改人:tju
	 * @最近修改日期:Jan 27, 2012 8:44:38 AM
	 * @功能名称:
	 * @功能描述:删除ProdItem
	 * @参数:ProdItem
	 * @约束:
	 * @改动历史：
	 * 
	 */
	public void delete(ProdItem instance) throws Exception {
		log.debug("Deleting ProdItem: ID=" + instance.getId());
		this.prodItemDAO.delete(instance);
	}

	/**
	 * 
	 * @创建人: tju
	 * @创建日期:Jan 27, 2012 8:44:38 AM
	 * @最近修改人:tju
	 * @最近修改日期:Jan 27, 2012 8:44:38 AM
	 * @功能名称:
	 * @功能描述:保存ProdItem
	 * @参数:ProdItem
	 * @约束:
	 * @改动历史：
	 * 
	 */

	public void save(ProdItem instance) throws Exception {
		log.debug("Saving ProdItem: ID=" + instance.getId());
		this.prodItemDAO.save(instance);
	}

	/**
	 * 
	 * @创建人: tju
	 * @创建日期:Jan 27, 2012 8:44:38 AM
	 * @最近修改人:tju
	 * @最近修改日期:Jan 27, 2012 8:44:38 AM
	 * @功能名称:
	 * @功能描述:根据全部结果集，无分页。
	 * @参数:
	 * @约束:
	 * @改动历史：
	 * 
	 */
	public List<ProdItem> getAll() {
		return this.prodItemDAO.getAll();
	}

	public ProdItemDAO getProdItemDAO() {
		return prodItemDAO;
	}

	public void setProdItemDAO(ProdItemDAO prodItemDAO) {
		this.prodItemDAO = prodItemDAO;
	}
}