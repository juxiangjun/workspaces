package org.tju.ebs.domain.manager;

import org.tju.ebs.bean.OrgCompanyModel;
import org.tju.ebs.domain.dao.OrgCompanyModelDAO;

public class OrgCompanyModelManager extends BaseManager {

	private OrgCompanyModelDAO orgCompanyModelDAO;

	public void save(OrgCompanyModel instance) throws Exception {
		this.orgCompanyModelDAO.save(instance);
	}

	public void setOrgCompanyModelDAO(OrgCompanyModelDAO orgCompanyModelDAO) {
		this.orgCompanyModelDAO = orgCompanyModelDAO;
	}

	public OrgCompanyModelDAO getOrgCompanyModelDAO() {
		return orgCompanyModelDAO;
	}
}
