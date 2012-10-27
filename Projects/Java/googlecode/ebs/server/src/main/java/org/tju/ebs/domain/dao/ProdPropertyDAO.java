package org.tju.ebs.domain.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.tju.ebs.bean.ProdProperty;

/**
 * @see org.tju.ebs.bean.ProdProperty
 * @author Tony Ju
 * @created date: Jan 27, 2012 8:40:23 AM
 */

public class ProdPropertyDAO extends BaseDAO<ProdProperty> {

	private static final Logger log = LoggerFactory
			.getLogger(ProdPropertyDAO.class);

	protected void initDao() {
		// do nothing
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 27, 2012 8:40:23 AM
	 * @功能说明；保存ProdProperty
	 * @参数: ProdProperty
	 */
	public void save(ProdProperty instance) throws Exception {
		log.debug("ProdPropertyDAO: saving->" + instance.getId());
		super.save(instance);
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 27, 2012 8:40:23 AM
	 * @功能说明: 删除ProdProperty
	 * @参数: ProdProperty
	 */
	public void delete(ProdProperty instance) throws Exception {
		super.delete(instance);
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 27, 2012 8:40:23 AM
	 * @功能说明: 根据ID查找ProdProperty
	 * @参数: ID,字符型，ID不能为空或Null,否则则报出异常。
	 */
	public ProdProperty getProdPropertyById(String id) {
		return super.getObjectById(id);
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 27, 2012 8:40:23 AM
	 * @功能说明: 返回全部结果集，不分页.
	 * @参数:
	 */
	public List<ProdProperty> getAll() {
		return super.getAll();
	}

	public static ProdPropertyDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (ProdPropertyDAO) ctx.getBean("ProdPropertyDAO");
	}
}