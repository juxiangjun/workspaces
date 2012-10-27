package org.tju.ebs.domain.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.SysObject;

/**
 * A data access object (DAO) providing persistence and search support for
 * SysObject entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see org.tju.ebs.bean.SysObject
 * @author MyEclipse Persistence Tools
 */

public class SysObjectDAO extends BaseDAO<SysObject> {

	private static final Logger log = LoggerFactory
			.getLogger(SysObjectDAO.class);

	@Override
	public void save(SysObject instance) throws Exception {
		log.debug("SysObjectDAO: saving->" + instance.getId());
		super.save(instance);
	}

	public List<SysObject> getAll() {
		return super.getAll();
	}

}