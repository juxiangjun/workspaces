package org.tju.ebs.domain.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.tju.ebs.bean.ProdStdPrice;

/**
 * @see org.tju.ebs.bean.ProdStdPrice
 * @author Tony Ju
 * @created date: Jan 27, 2012 8:40:55 AM
 */

public class ProdStdPriceDAO extends BaseDAO<ProdStdPrice> {

	private static final Logger log = LoggerFactory
			.getLogger(ProdStdPriceDAO.class);

	protected void initDao() {
		// do nothing
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 27, 2012 8:40:55 AM
	 * @功能说明；保存ProdStdPrice
	 * @参数: ProdStdPrice
	 */
	public void save(ProdStdPrice instance) throws Exception {
		log.debug("ProdStdPriceDAO: saving->" + instance.getId());
		super.save(instance);
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 27, 2012 8:40:55 AM
	 * @功能说明: 删除ProdStdPrice
	 * @参数: ProdStdPrice
	 */
	public void delete(ProdStdPrice instance) throws Exception {
		super.delete(instance);
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 27, 2012 8:40:55 AM
	 * @功能说明: 根据ID查找ProdStdPrice
	 * @参数: ID,字符型，ID不能为空或Null,否则则报出异常。
	 */
	public ProdStdPrice getProdStdPriceById(String id) {
		return super.getObjectById(id);
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 27, 2012 8:40:55 AM
	 * @功能说明: 返回全部结果集，不分页.
	 * @参数:
	 */
	public List<ProdStdPrice> getAll() {
		return super.getAll();
	}

	public static ProdStdPriceDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (ProdStdPriceDAO) ctx.getBean("ProdStdPriceDAO");
	}
}