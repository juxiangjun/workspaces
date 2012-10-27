package org.tju.ebs.domain.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.tju.ebs.bean.OrgPosition;

/**
 * A data access object (DAO) providing persistence and search support for
 * OrgPosition entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see org.tju.ebs.bean.OrgPosition
 * @author MyEclipse Persistence Tools
 */

public class OrgPositionDAO extends BaseDAO<OrgPosition> {
	private static final Logger log = LoggerFactory
			.getLogger(OrgPositionDAO.class);

	public void save(OrgPosition instance) throws Exception {
		log.debug("OrgPositionDAO: saving->" + instance.getId());
		super.save(instance);
	}

	public static OrgPositionDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (OrgPositionDAO) ctx.getBean("OrgPositionDAO");
	}
}