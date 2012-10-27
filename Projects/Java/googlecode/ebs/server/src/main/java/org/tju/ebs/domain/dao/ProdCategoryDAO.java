package org.tju.ebs.domain.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.tju.ebs.bean.ProdCategory;

/**
 * @see org.tju.ebs.bean.ProdCategory
 * @author Tony Ju
 * @created date: Jan 27, 2012 8:35:48 AM
 */

public class ProdCategoryDAO extends BaseDAO<ProdCategory> {

	private static final Logger log = LoggerFactory
			.getLogger(ProdCategoryDAO.class);

	protected void initDao() {
		// do nothing
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 27, 2012 8:35:48 AM
	 * @功能说明；保存ProdCategory
	 * @参数: ProdCategory
	 */
	public void save(ProdCategory instance) throws Exception {
		log.debug("ProdCategoryDAO: saving->" + instance.getId());
		super.save(instance);
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 27, 2012 8:35:48 AM
	 * @功能说明: 删除ProdCategory
	 * @参数: ProdCategory
	 */
	public void delete(ProdCategory instance) throws Exception {
		super.delete(instance);
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 27, 2012 8:35:48 AM
	 * @功能说明: 根据ID查找ProdCategory
	 * @参数: ID,字符型，ID不能为空或Null,否则则报出异常。
	 */
	public ProdCategory getProdCategoryById(String id) {
		return super.getObjectById(id);
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 27, 2012 8:35:48 AM
	 * @功能说明: 返回全部结果集，不分页.
	 * @参数:
	 */
	public List<ProdCategory> getAll() {
		return super.getAll();
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 27, 2012 8:35:48 AM
	 * @功能说明: GetProdCategoryByParentId.
	 * @参数:
	 */
	public List<ProdCategory> getAll(String parentId) {

		String hql = "from ProdCategory where parentId = '" + parentId + "'";
		if (parentId == null) {
			hql = "from ProdCategory where parentId is null";
		}

		return super.getObjectsByHQL(hql);
	}

	public static ProdCategoryDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (ProdCategoryDAO) ctx.getBean("ProdCategoryDAO");
	}
}