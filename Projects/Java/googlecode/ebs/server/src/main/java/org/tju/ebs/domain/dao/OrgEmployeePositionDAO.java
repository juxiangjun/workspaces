package org.tju.ebs.domain.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.tju.ebs.bean.OrgEmployeePosition;

/**
 * A data access object (DAO) providing persistence and search support for
 * OrgEmployeePosition entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see org.tju.ebs.bean.OrgEmployeePosition
 * @author MyEclipse Persistence Tools
 */

public class OrgEmployeePositionDAO extends BaseDAO<OrgEmployeePosition> {
	private static final Logger log = LoggerFactory
			.getLogger(OrgEmployeePositionDAO.class);

	// property constants

	public void save(OrgEmployeePosition instance) throws Exception {
		log.debug("saving OrgEmployeePosition:" + instance.getId());
		super.save(instance);
	}

	public static OrgEmployeePositionDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (OrgEmployeePositionDAO) ctx.getBean("OrgEmployeePositionDAO");
	}
}