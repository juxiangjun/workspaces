package org.tju.ebs.domain.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.tju.ebs.bean.SysRegistration;

/**
 * @see org.tju.ebs.bean.SysRegistration
 * @author Tony Ju
 * @created date: Jan 13, 2012 3:19:12 PM
 */

public class SysRegistrationDAO extends BaseDAO<SysRegistration> {

	private static final Logger log = LoggerFactory
			.getLogger(SysRegistrationDAO.class);

	protected void initDao() {
		// do nothing
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 13, 2012 3:19:12 PM
	 * @功能说明；保存SysRegistration
	 * @参数: SysRegistration
	 */
	public void save(SysRegistration instance) throws Exception {
		log.debug("SysRegistrationDAO: saving->" + instance.getId());
		super.save(instance);
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 13, 2012 3:19:12 PM
	 * @功能说明: 删除SysRegistration
	 * @参数: SysRegistration
	 */
	public void delete(SysRegistration instance) throws Exception {
		super.delete(instance);
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 13, 2012 3:19:12 PM
	 * @功能说明: 根据ID查找SysRegistration
	 * @参数: ID,字符型，ID不能为空或Null,否则则报出异常。
	 */
	public SysRegistration getSysRegistrationById(String id) {
		return super.getObjectById(id);
	}

	/**
	 * @作者: tju
	 * @创建日期: Jan 13, 2012 3:19:12 PM
	 * @功能说明: 返回全部结果集，不分页.
	 * @参数:
	 */
	public List<SysRegistration> getAll() {
		return super.getAll();
	}

	public static SysRegistrationDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (SysRegistrationDAO) ctx.getBean("SysRegistrationDAO");
	}
}