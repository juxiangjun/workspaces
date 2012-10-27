package org.tju.ebs.domain.dao;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.OrgEmployee;

/**
 * A data access object (DAO) providing persistence and search support for
 * OrgEmployee entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see org.tju.ebs.bean.OrgEmployee
 * @author MyEclipse Persistence Tools
 */

public class OrgEmployeeDAO extends BaseDAO<OrgEmployee> {
	private static final Logger log = LoggerFactory
			.getLogger(OrgEmployeeDAO.class);

	public void save(OrgEmployee instance) throws Exception {
		try {
			super.save(instance);
		} catch (Exception e) {
			log.debug("failed to save OrgEmployee");
			throw e;
		}

	}

	public OrgEmployee getOrgEmployeeById(String id) {
		return (OrgEmployee) super.getObjectById(id);
	}

	public List<OrgEmployee> getOrgEmployeeListByDepartment(String departmentId) {
		String hql = "from OrgEmployee where id in (select orgEmployeeId from OrgEmployeeDepartment where orgDepartmentId = '"
				+ departmentId + "')";
		return this.getObjectsByHQL(hql);
	}

	public Map<String, Object> getOrgEmplyeeListByDepartment(
			String departmentId, int pageNo, int pageSize) {
		String hql = "from OrgEmployee where id in (select orgEmployeeId from OrgEmployeeDepartment where orgDepartmentId = '"
				+ departmentId + "')";
		return this.getObjectsByHql(hql, pageNo, pageSize);
	}

	public List<OrgEmployee> getOrgEmployeeListByCompany(String companyId) {
		String hql = "from OrgEmployee where id in (select orgEmployeeId from OrgEmployeeDepartment where orgDepartmentId in (select id from OrgDepartment where orgCompanyId = '"
				+ companyId + "'))";
		return this.getObjectsByHQL(hql);
	}

	public Map<String, Object> getOrgEmployeeListByCompany(String companyId,
			int pageNo, int pageSize) {
		String hql = "from OrgEmployee where orgCompanyId ='" + companyId + "'";
		return this.getObjectsByHql(hql, pageNo, pageSize);
	}
}