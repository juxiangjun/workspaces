package org.tju.ebs.domain.manager;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.OrgPerson;
import org.tju.ebs.domain.dao.OrgPersonDAO;

public class OrgPersonManager extends BaseManager {

	private OrgPersonDAO orgPersonDAO;
	private static final Logger log = LoggerFactory
			.getLogger(OrgPersonManager.class);

	public void save(OrgPerson instance) throws Exception {
		this.getMc().setObject(instance.getId(), instance);
		log.debug("OrgPersonManager: saving->" + instance.getId());
		this.orgPersonDAO.save(instance);
	}

	public OrgPerson getOrgPersonById(String id) {
		return this.orgPersonDAO.getOrgPersonById(id);
	}

	public void setOrgPersonDAO(OrgPersonDAO orgPersonDAO) {
		this.orgPersonDAO = orgPersonDAO;
	}

	public OrgPersonDAO getOrgPersonDAO() {
		return orgPersonDAO;
	}
}
