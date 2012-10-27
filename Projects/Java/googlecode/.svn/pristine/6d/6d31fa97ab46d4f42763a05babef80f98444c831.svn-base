package org.tju.ebs.domain.manager;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.SysCountry;
import org.tju.ebs.domain.dao.SysCountryDAO;

/**
 * 
 * @创建人: tju
 * @创建日期:Jan 12, 2012 11:24:08 PM
 * @最近修改人:tju
 * @最近修改日期:Jan 12, 2012 11:24:08 PM
 * @功能描述:
 * @参数:
 * @约束:
 * @改动历史：
 * 
 */

public class SysCountryManager extends BaseManager {

	/** Logger */
	private static final Logger log = LoggerFactory
			.getLogger(SysCountryDAO.class);

	/** 依赖注入　SysCountry */
	private SysCountryDAO sysCountryDAO;

	/**
	 * 
	 * @创建人: tju
	 * @创建日期:Jan 12, 2012 11:24:08 PM
	 * @最近修改人:tju
	 * @最近修改日期:Jan 12, 2012 11:24:08 PM
	 * @功能名称:
	 * @功能描述:删除SysCountry
	 * @参数:SysCountry
	 * @约束:
	 * @改动历史：
	 * 
	 */
	public SysCountry getSysCountryById(String id) {
		return this.sysCountryDAO.getSysCountryById(id);
	}

	/**
	 * 
	 * @创建人: tju
	 * @创建日期:Jan 12, 2012 11:24:08 PM
	 * @最近修改人:tju
	 * @最近修改日期:Jan 12, 2012 11:24:08 PM
	 * @功能名称:
	 * @功能描述:删除SysCountry
	 * @参数:SysCountry
	 * @约束:
	 * @改动历史：
	 * 
	 */
	public void delete(SysCountry instance) throws Exception {
		log.debug("Deleting SysCountry: ID=" + instance.getId());
		this.sysCountryDAO.delete(instance);
	}

	/**
	 * 
	 * @创建人: tju
	 * @创建日期:Jan 12, 2012 11:24:08 PM
	 * @最近修改人:tju
	 * @最近修改日期:Jan 12, 2012 11:24:08 PM
	 * @功能名称:
	 * @功能描述:保存SysCountry
	 * @参数:SysCountry
	 * @约束:
	 * @改动历史：
	 * 
	 */

	public void save(SysCountry instance) throws Exception {
		log.debug("Saving SysCountry: ID=" + instance.getId());
		this.sysCountryDAO.save(instance);
	}

	/**
	 * 
	 * @创建人: tju
	 * @创建日期:Jan 12, 2012 11:24:08 PM
	 * @最近修改人:tju
	 * @最近修改日期:Jan 12, 2012 11:24:08 PM
	 * @功能名称:
	 * @功能描述:根据全部结果集，无分页。
	 * @参数:
	 * @约束:
	 * @改动历史：
	 * 
	 */
	public List<SysCountry> getAll() {
		return this.sysCountryDAO.getAllOfSysCountryList();
	}
	
	public Map<String, Object> getAll(int pageNo, int pageSize, String filter) {
		return this.sysCountryDAO.getAll(pageNo, pageSize, filter);
	}

	public Map<String, Object> getAll(int pageNo, int pageSize) {
		return this.sysCountryDAO.getAll(pageNo, pageSize);
	}

	public SysCountryDAO getSysCountryDAO() {
		return sysCountryDAO;
	}

	public void setSysCountryDAO(SysCountryDAO sysCountryDAO) {
		this.sysCountryDAO = sysCountryDAO;
	}
}