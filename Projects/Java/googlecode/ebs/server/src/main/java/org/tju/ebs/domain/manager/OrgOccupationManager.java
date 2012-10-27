package org.tju.ebs.domain.manager;

import org.tju.ebs.domain.dao.OrgOccupationDAO;

public class OrgOccupationManager extends BaseManager {
	private OrgOccupationDAO orgOccupationDAO;

	public void setOrgOccupationDAO(OrgOccupationDAO orgOccupationDAO) {
		this.orgOccupationDAO = orgOccupationDAO;
	}

	public OrgOccupationDAO getOrgOccupationDAO() {
		return orgOccupationDAO;
	}
}
