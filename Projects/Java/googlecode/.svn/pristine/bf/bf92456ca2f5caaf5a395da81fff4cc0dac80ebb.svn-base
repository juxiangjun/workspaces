package org.tju.ebs.domain.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.tju.ebs.bean.Contact;

/**
 * A data access object (DAO) providing persistence and search support for
 * Contact entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see org.tju.ebs.bean.Contact
 * @author MyEclipse Persistence Tools
 */

public class ContactDAO extends BaseDAO<Contact> {
	private static final Logger log = LoggerFactory.getLogger(ContactDAO.class);

	protected void initDao() {
		// do nothing
	}

	public static ContactDAO getFromApplicationContext(ApplicationContext ctx) {
		log.debug("getFromApplicationContext");
		return (ContactDAO) ctx.getBean("ContactDAO");
	}
}