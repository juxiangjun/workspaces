package org.tju.ebs.domain.dao;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.OrgDepartment;

/**
 * A data access object (DAO) providing persistence and search support for
 * OrgDepartment entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see org.tju.ebs.bean.OrgDepartment
 * @author MyEclipse Persistence Tools
 */

public class OrgDepartmentDAO extends BaseDAO<OrgDepartment> {
	private static final Logger log = LoggerFactory
			.getLogger(OrgDepartmentDAO.class);

	public List<OrgDepartment> getOrgDepartmentListByCompany(String companyId) {
		String hql = "from OrgDepartment where orgCompanyId = '" + companyId
				+ "'";
		return super.getObjectsByHQL(hql);
	}

	public Map<String, Object> getOrgDepartmentList(String companyId,
			int pageNo, int pageSize) {
		String hql = "from OrgDepartment where orgCompanyId = '" + companyId
				+ "'";
		return super.getObjectsByHql(hql, pageNo, pageSize);
	}

	public void save(OrgDepartment instance) {
		try {
			super.save(instance);
		} catch (Exception e) {
			log.error("Failed to save OrgDepartment!");
		}
	}

	public OrgDepartment getOrgDepartmentById(String id) {
		return (OrgDepartment) super.getObjectById(id);
	}

	public void delete(OrgDepartment instance) {
		try {
			super.delete(instance);
		} catch (Exception e) {
			log.error("Failed to delete OrgDepartment!");
		}
	}
}