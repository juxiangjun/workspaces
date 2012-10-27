package org.tju.ebs.domain.manager;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.OrgCompany;
import org.tju.ebs.domain.dao.OrgCompanyDAO;

public class OrgCompanyManager extends BaseManager {

	private OrgCompanyDAO orgCompanyDAO;

	private static final Logger log = LoggerFactory
			.getLogger(OrgCompanyManager.class);

	public OrgCompany save(OrgCompany instance) throws Exception {
		log.debug("Save OrgCompany:" + instance.getId());
		return instance;
	}

	public List<OrgCompany> getAll(String parentId) {
		return this.orgCompanyDAO.getOrgCompanyByParentId(parentId);
	}

	public OrgCompany getOrgCompanyById(String id) {

		OrgCompany result = null;

		Object obj = this.getMc().getObject(id);
		if (obj != null) {
			result = (OrgCompany) obj;
		} else {
			result = this.orgCompanyDAO.getOrgCompanyById(id);
			this.getMc().setObject(id, result);
		}
		return result;
	}

	public void setOrgCompanyDAO(OrgCompanyDAO orgCompanyDAO) {
		this.orgCompanyDAO = orgCompanyDAO;
	}

	public OrgCompanyDAO getOrgCompanyDAO() {
		return orgCompanyDAO;
	}

}
