package org.tju.ebs.domain.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.tju.ebs.bean.OrgOccupation;

/**
 * A data access object (DAO) providing persistence and search support for
 * OrgOccupation entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see org.tju.ebs.bean.OrgOccupation
 * @author MyEclipse Persistence Tools
 */

public class OrgOccupationDAO extends BaseDAO<OrgOccupation> {
	private static final Logger log = LoggerFactory
			.getLogger(OrgOccupationDAO.class);

	public void save(OrgOccupation instance) throws Exception {
		log.debug("saving OrgOccupationDAO:" + instance.getId());
		super.save(instance);
	}

	public static OrgOccupationDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (OrgOccupationDAO) ctx.getBean("OrgOccupationDAO");
	}
}