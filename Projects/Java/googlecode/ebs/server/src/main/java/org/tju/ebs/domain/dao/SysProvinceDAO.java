package org.tju.ebs.domain.dao;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.SysProvince;

/**
 * A data access object (DAO) providing persistence and search support for
 * SysProvince entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see org.tju.ebs.bean.SysProvince
 * @author MyEclipse Persistence Tools
 */

public class SysProvinceDAO extends BaseDAO<SysProvince> {
	private static final Logger log = LoggerFactory
			.getLogger(SysProvinceDAO.class);

	@Override
	public void save(SysProvince instance) throws Exception {
		log.debug("SysProvinceDAO: saving->" + instance.getId());
		super.save(instance);
	}

	public Map<String, Object> getAll(String countryId, int pageNo, int pageSize) {
		String hql = "from SysProvince where countryId = '" + countryId + "'";
		return super.getObjectsByHql(hql, pageNo, pageSize);
	}
}