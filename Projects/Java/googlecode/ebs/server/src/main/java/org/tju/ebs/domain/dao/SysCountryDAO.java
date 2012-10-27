package org.tju.ebs.domain.dao;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.tju.ebs.bean.SysCountry;

/**
 * @see org.tju.ebs.bean.SysCountry
 * @author Tony Ju
 * @created date: Jan 12, 2012 11:20:31 PM
 */

public class SysCountryDAO extends BaseDAO<SysCountry> {

	private static final Logger log = LoggerFactory
			.getLogger(SysCountryDAO.class);

	protected void initDao() {
		// do nothing
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 12, 2012 11:20:31 PM
	 * @功能说明；保存SysCountry
	 * @参数: SysCountry
	 */
	public void save(SysCountry instance) throws Exception {
		log.debug("SysCountryDAO: saving->" + instance.getId());
		super.save(instance);
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 12, 2012 11:20:31 PM
	 * @功能说明: 删除SysCountry
	 * @参数: SysCountry
	 */
	public void delete(SysCountry instance) throws Exception {
		super.delete(instance);
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 12, 2012 11:20:31 PM
	 * @功能说明: 根据ID查找SysCountry
	 * @参数: ID,字符型，ID不能为空或Null,否则则报出异常。
	 */
	public SysCountry getSysCountryById(String id) {
		return super.getObjectById(id);
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 12, 2012 11:20:31 PM
	 * @功能说明: 返回全部结果集，不分页.
	 * @参数:
	 */
	public List<SysCountry> getAllOfSysCountryList() {
		return super.getAll();
	}

	public Map<String, Object> getAll(int pageNo, int pageSize) {
		return super.getAll(pageNo, pageSize);
	}
	
	public Map<String, Object> getAll(int pageNo, int pageSize, String filter) {
		return super.getAll(pageNo, pageSize, filter);
	}

	public static SysCountryDAO getFromApplicationContext(ApplicationContext ctx) {
		return (SysCountryDAO) ctx.getBean("SysCountryDAO");
	}
}