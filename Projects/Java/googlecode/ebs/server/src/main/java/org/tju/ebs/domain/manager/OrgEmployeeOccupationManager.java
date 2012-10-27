package org.tju.ebs.domain.manager;

import org.tju.ebs.domain.dao.OrgEmployeeOccupationDAO;

public class OrgEmployeeOccupationManager extends BaseManager {
	private OrgEmployeeOccupationDAO orgEmployeeOccupationDAO;

	public void setOrgEmployeeOccupationDAO(
			OrgEmployeeOccupationDAO orgEmployeeOccupationDAO) {
		this.orgEmployeeOccupationDAO = orgEmployeeOccupationDAO;
	}

	public OrgEmployeeOccupationDAO getOrgEmployeeOccupationDAO() {
		return orgEmployeeOccupationDAO;
	}
}
