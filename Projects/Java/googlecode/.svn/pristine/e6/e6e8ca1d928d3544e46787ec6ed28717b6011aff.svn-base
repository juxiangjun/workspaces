package org.tju.ebs.domain.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.tju.ebs.bean.OrgEmployeeOccupation;

/**
 * A data access object (DAO) providing persistence and search support for
 * OrgEmployeeOccupation entities. Transaction control of the save(), update()
 * and delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see org.tju.ebs.bean.OrgEmployeeOccupation
 * @author MyEclipse Persistence Tools
 */

public class OrgEmployeeOccupationDAO extends BaseDAO<OrgEmployeeOccupation> {
	private static final Logger log = LoggerFactory
			.getLogger(OrgEmployeeOccupationDAO.class);

	protected void initDao() {
		// do nothing
	}

	public void save(OrgEmployeeOccupation instance) throws Exception {
		log.debug("saving OrgEmployeeOccupation instance");
		try {
			super.save(instance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public static OrgEmployeeOccupationDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (OrgEmployeeOccupationDAO) ctx
				.getBean("OrgEmployeeOccupationDAO");
	}
}