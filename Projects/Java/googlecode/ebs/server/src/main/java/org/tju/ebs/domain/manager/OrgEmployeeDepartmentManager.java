package org.tju.ebs.domain.manager;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.OrgDepartment;
import org.tju.ebs.bean.OrgEmployee;
import org.tju.ebs.bean.OrgEmployeeDepartment;
import org.tju.ebs.domain.dao.OrgEmployeeDepartmentDAO;
import org.tju.ebs.utils.DateUtil;

public class OrgEmployeeDepartmentManager extends BaseManager {
	private static final Logger log = LoggerFactory
			.getLogger(OrgEmployeeDepartmentManager.class);

	private OrgEmployeeDepartmentDAO orgEmployeeDepartmentDAO;
	private OrgDepartmentManager orgDepartmentMgr;
	private OrgEmployeeManager orgEmployeeMgr;

	public OrgEmployeeDepartment save(String orgDepartmentId,
			String orgEmployeeId) throws Exception {

		DateUtil du = new DateUtil();
		OrgEmployeeDepartment result = new OrgEmployeeDepartment();
		OrgEmployee orgEmployee = this.orgEmployeeMgr
				.getOrgEmployeeById(orgEmployeeId);
		OrgDepartment orgDepartment = this.orgDepartmentMgr
				.getOrgDepartmentById(orgDepartmentId);
		result.setOrgDepartmentId(orgDepartmentId);
		result.setOrgDepartmentCode(orgDepartment.getCode());
		result.setOrgDepartmentName(orgDepartment.getName());
		// result.setOrgDepartmentProperty(null);

		result.setOrgEmployeeId(orgEmployeeId);
		result.setOrgEmployeeCode(orgEmployee.getCode());
		result.setOrgEmployeeFullName(orgEmployee.getFullName());
		result.setStartDate(du.getFullString());

		log.debug("OrgEmployeeDepartmentManager: saving->" + result.getId());
		this.orgEmployeeDepartmentDAO.save(result);

		return result;
	}

	public OrgEmployeeDepartmentDAO getOrgEmployeeDepartmentDAO() {
		return orgEmployeeDepartmentDAO;
	}

	public void setOrgEmployeeDepartmentDAO(
			OrgEmployeeDepartmentDAO orgEmployeeDepartmentDAO) {
		this.orgEmployeeDepartmentDAO = orgEmployeeDepartmentDAO;
	}

	public OrgDepartmentManager getOrgDepartmentMgr() {
		return orgDepartmentMgr;
	}

	public void setOrgDepartmentMgr(OrgDepartmentManager orgDepartmentMgr) {
		this.orgDepartmentMgr = orgDepartmentMgr;
	}

	public void setOrgEmployeeMgr(OrgEmployeeManager orgEmployeeMgr) {
		this.orgEmployeeMgr = orgEmployeeMgr;
	}

	public OrgEmployeeManager getOrgEmployeeMgr() {
		return orgEmployeeMgr;
	}

}
