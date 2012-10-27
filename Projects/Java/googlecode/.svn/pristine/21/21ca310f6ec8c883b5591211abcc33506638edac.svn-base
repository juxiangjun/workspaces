package org.tju.ebs.domain.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.tju.ebs.bean.ProdItem;

/**
 * @see org.tju.ebs.bean.ProdItem
 * @author Tony Ju
 * @created date: Jan 27, 2012 8:39:42 AM
 */

public class ProdItemDAO extends BaseDAO<ProdItem> {

	private static final Logger log = LoggerFactory
			.getLogger(ProdItemDAO.class);

	protected void initDao() {
		// do nothing
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 27, 2012 8:39:42 AM
	 * @功能说明；保存ProdItem
	 * @参数: ProdItem
	 */
	public void save(ProdItem instance) throws Exception {
		log.debug("ProdItemDAO: saving->" + instance.getId());
		super.save(instance);
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 27, 2012 8:39:42 AM
	 * @功能说明: 删除ProdItem
	 * @参数: ProdItem
	 */
	public void delete(ProdItem instance) throws Exception {
		super.delete(instance);
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 27, 2012 8:39:42 AM
	 * @功能说明: 根据ID查找ProdItem
	 * @参数: ID,字符型，ID不能为空或Null,否则则报出异常。
	 */
	public ProdItem getProdItemById(String id) {
		return super.getObjectById(id);
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 27, 2012 8:39:42 AM
	 * @功能说明: 返回全部结果集，不分页.
	 * @参数:
	 */
	public List<ProdItem> getAll() {
		return super.getAll();
	}

	public static ProdItemDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ProdItemDAO) ctx.getBean("ProdItemDAO");
	}
}