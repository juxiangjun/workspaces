package org.tju.ebs.domain.manager;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.ProdStdPrice;
import org.tju.ebs.domain.dao.ProdStdPriceDAO;

/**
 * 
 * @创建人: tju
 * @创建日期:Jan 27, 2012 8:46:11 AM
 * @最近修改人:tju
 * @最近修改日期:Jan 27, 2012 8:46:11 AM
 * @功能描述:
 * @参数:
 * @约束:
 * @改动历史：
 * 
 */

public class ProdStdPriceManager extends BaseManager {

	/** Logger */
	private static final Logger log = LoggerFactory
			.getLogger(ProdStdPriceDAO.class);

	/** 依赖注入　ProdStdPrice */
	private ProdStdPriceDAO prodStdPriceDAO;

	/**
	 * 
	 * @创建人: tju
	 * @创建日期:Jan 27, 2012 8:46:11 AM
	 * @最近修改人:tju
	 * @最近修改日期:Jan 27, 2012 8:46:11 AM
	 * @功能名称:
	 * @功能描述:删除ProdStdPrice
	 * @参数:ProdStdPrice
	 * @约束:
	 * @改动历史：
	 * 
	 */
	public ProdStdPrice getProdStdPriceById(String id) {
		return this.prodStdPriceDAO.getProdStdPriceById(id);
	}

	/**
	 * 
	 * @创建人: tju
	 * @创建日期:Jan 27, 2012 8:46:11 AM
	 * @最近修改人:tju
	 * @最近修改日期:Jan 27, 2012 8:46:11 AM
	 * @功能名称:
	 * @功能描述:删除ProdStdPrice
	 * @参数:ProdStdPrice
	 * @约束:
	 * @改动历史：
	 * 
	 */
	public void delete(ProdStdPrice instance) throws Exception {
		log.debug("Deleting ProdStdPrice: ID=" + instance.getId());
		this.prodStdPriceDAO.delete(instance);
	}

	/**
	 * 
	 * @创建人: tju
	 * @创建日期:Jan 27, 2012 8:46:11 AM
	 * @最近修改人:tju
	 * @最近修改日期:Jan 27, 2012 8:46:11 AM
	 * @功能名称:
	 * @功能描述:保存ProdStdPrice
	 * @参数:ProdStdPrice
	 * @约束:
	 * @改动历史：
	 * 
	 */

	public void save(ProdStdPrice instance) throws Exception {
		log.debug("Saving ProdStdPrice: ID=" + instance.getId());
		this.prodStdPriceDAO.save(instance);
	}

	/**
	 * 
	 * @创建人: tju
	 * @创建日期:Jan 27, 2012 8:46:11 AM
	 * @最近修改人:tju
	 * @最近修改日期:Jan 27, 2012 8:46:11 AM
	 * @功能名称:
	 * @功能描述:根据全部结果集，无分页。
	 * @参数:
	 * @约束:
	 * @改动历史：
	 * 
	 */
	public List<ProdStdPrice> getAll() {
		return this.prodStdPriceDAO.getAll();
	}

	public ProdStdPriceDAO getProdStdPriceDAO() {
		return prodStdPriceDAO;
	}

	public void setProdStdPriceDAO(ProdStdPriceDAO prodStdPriceDAO) {
		this.prodStdPriceDAO = prodStdPriceDAO;
	}
}