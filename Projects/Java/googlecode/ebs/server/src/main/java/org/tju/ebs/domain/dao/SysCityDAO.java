package org.tju.ebs.domain.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.SysCity;

/* A data access object (DAO) providing persistence and search support for SysCity entities.
 * Transaction control of the save(), update() and delete() operations 
 can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
 Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
 * @see com.bz.ebs.client.bean.entity.SysCity
 * @author MyEclipse Persistence Tools 
 */

public class SysCityDAO extends BaseDAO<SysCity> {

	private static final Logger log = LoggerFactory.getLogger(SysCityDAO.class);

	@Override
	public void save(SysCity instance) throws Exception {
		log.debug("SysCityDAO: saving->" + instance.getId());
		super.save(instance);
	}

}