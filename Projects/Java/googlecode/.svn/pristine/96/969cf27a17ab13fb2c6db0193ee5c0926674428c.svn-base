package org.tju.ebs.domain.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.SysModel;

/**
 * A data access object (DAO) providing persistence and search support for
 * SysModel entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see org.tju.ebs.bean.SysModel
 * @author MyEclipse Persistence Tools
 */

public class SysModelDAO extends BaseDAO<SysModel> {

	private static final Logger log = LoggerFactory
			.getLogger(SysModelDAO.class);

	@Override
	public void save(SysModel instance) throws Exception {
		log.debug("SysModelDAO: saving->" + instance.getId());
		super.save(instance);
	}

	public List<SysModel> getAll() {
		String hql = "from SysModel";
		return super.getObjectsByHQL(hql);
	}
}