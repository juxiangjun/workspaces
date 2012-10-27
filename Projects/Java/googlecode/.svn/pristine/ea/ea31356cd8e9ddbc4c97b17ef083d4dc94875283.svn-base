package org.tju.ebs.domain.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.tju.ebs.bean.ProdPackage;

/**
 * @see org.tju.ebs.bean.ProdPackage
 * @author Tony Ju
 * @created date: Jan 27, 2012 8:40:11 AM
 */

public class ProdPackageDAO extends BaseDAO<ProdPackage> {

	private static final Logger log = LoggerFactory
			.getLogger(ProdPackageDAO.class);

	protected void initDao() {
		// do nothing
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 27, 2012 8:40:11 AM
	 * @功能说明；保存ProdPackage
	 * @参数: ProdPackage
	 */
	public void save(ProdPackage instance) throws Exception {
		log.debug("ProdPackageDAO: saving->" + instance.getId());
		super.save(instance);
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 27, 2012 8:40:11 AM
	 * @功能说明: 删除ProdPackage
	 * @参数: ProdPackage
	 */
	public void delete(ProdPackage instance) throws Exception {
		super.delete(instance);
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 27, 2012 8:40:11 AM
	 * @功能说明: 根据ID查找ProdPackage
	 * @参数: ID,字符型，ID不能为空或Null,否则则报出异常。
	 */
	public ProdPackage getProdPackageById(String id) {
		return super.getObjectById(id);
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 27, 2012 8:40:11 AM
	 * @功能说明: 返回全部结果集，不分页.
	 * @参数:
	 */
	public List<ProdPackage> getAll() {
		return super.getAll();
	}

	public static ProdPackageDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (ProdPackageDAO) ctx.getBean("ProdPackageDAO");
	}
}