package org.tju.ebs.domain.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.OrgPerson;

/**
 * A data access object (DAO) providing persistence and search support for
 * OrgPerson entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see org.tju.ebs.bean.OrgPerson
 * @author MyEclipse Persistence Tools
 */

public class OrgPersonDAO extends BaseDAO<OrgPerson> {
	private static final Logger log = LoggerFactory
			.getLogger(OrgPersonDAO.class);

	public OrgPerson getOrgPersonById(String id) {
		return (OrgPerson) super.getObjectById(id);
	}

	public void save(OrgPerson instance) throws Exception {
		log.debug("OrgPersonDAO: saving->" + instance.getId());
		super.save(instance);
	}
}