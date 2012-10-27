package org.tju.ebs.domain.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.tju.ebs.bean.OrgBank;

/**
 * A data access object (DAO) providing persistence and search support for
 * OrgBank entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see org.tju.ebs.bean.OrgBank
 * @author MyEclipse Persistence Tools
 */

public class OrgBankDAO extends BaseDAO<OrgBank> {
	private static final Logger log = LoggerFactory.getLogger(OrgBankDAO.class);

	public void save(OrgBank transientInstance) {
		log.debug("saving OrgBank instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public static OrgBankDAO getFromApplicationContext(ApplicationContext ctx) {
		return (OrgBankDAO) ctx.getBean("OrgBankDAO");
	}
}