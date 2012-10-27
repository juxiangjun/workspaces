package org.tju.ebs.domain.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.OrgCompanyAddress;

/**
 * A data access object (DAO) providing persistence and search support for
 * OrgCompanyAddress entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see org.tju.ebs.bean.OrgCompanyAddress
 * @author MyEclipse Persistence Tools
 */

public class OrgCompanyAddressDAO extends BaseDAO<OrgCompanyAddress> {
	private static final Logger log = LoggerFactory
			.getLogger(OrgCompanyAddressDAO.class);

	public void save(OrgCompanyAddress instance) throws Exception {
		log.debug("saving OrgCompany" + instance.getId());
		super.save(instance);
	}

}