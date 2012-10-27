package org.tju.ebs.domain.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.tju.ebs.bean.ProdPropertyValue;

/**
 * @see org.tju.ebs.bean.ProdPropertyValue
 * @author Tony Ju
 * @created date: Jan 27, 2012 8:40:37 AM
 */

public class ProdPropertyValueDAO extends BaseDAO<ProdPropertyValue> {

	private static final Logger log = LoggerFactory
			.getLogger(ProdPropertyValueDAO.class);

	protected void initDao() {
		// do nothing
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 27, 2012 8:40:37 AM
	 * @功能说明；保存ProdPropertyValue
	 * @参数: ProdPropertyValue
	 */
	public void save(ProdPropertyValue instance) throws Exception {
		log.debug("ProdPropertyValueDAO: saving->" + instance.getId());
		super.save(instance);
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 27, 2012 8:40:37 AM
	 * @功能说明: 删除ProdPropertyValue
	 * @参数: ProdPropertyValue
	 */
	public void delete(ProdPropertyValue instance) throws Exception {
		super.delete(instance);
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 27, 2012 8:40:37 AM
	 * @功能说明: 根据ID查找ProdPropertyValue
	 * @参数: ID,字符型，ID不能为空或Null,否则则报出异常。
	 */
	public ProdPropertyValue getProdPropertyValueById(String id) {
		return super.getObjectById(id);
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 27, 2012 8:40:37 AM
	 * @功能说明: 返回全部结果集，不分页.
	 * @参数:
	 */
	public List<ProdPropertyValue> getAll(String prodPropertyId) {
		String hql = "from ProdPropertyValue where prodPropertyId = '"
				+ prodPropertyId + "'";
		if (prodPropertyId == null) {
			hql = "from ProdPropertyValue where prodPropertyId is null";
		}
		return super.getObjectsByHQL(hql);
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 27, 2012 8:40:37 AM
	 * @功能说明: 返回全部结果集，不分页.
	 * @参数:
	 */
	public List<ProdPropertyValue> getAll() {
		return super.getAll();
	}

	public static ProdPropertyValueDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (ProdPropertyValueDAO) ctx.getBean("ProdPropertyValueDAO");
	}
}