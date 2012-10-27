package org.tju.ebs.domain.manager;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.OrgEmployee;
import org.tju.ebs.domain.dao.OrgEmployeeDAO;
import org.tju.ebs.resources.Constants;

public class OrgEmployeeManager extends BaseManager {

	private OrgEmployeeDAO orgEmployeeDAO;

	private static final Logger log = LoggerFactory
			.getLogger(OrgEmployeeManager.class);

	public void save(OrgEmployee instance) throws Exception {

		try {
			this.getMc().setObject(instance.getId(), instance);
			this.orgEmployeeDAO.save(instance);
			log.debug("OrgEmployeeManager: saving->" + instance.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}

		this.orgEmployeeDAO.save(instance);
	}

	public Map<String, Object> getAllByCompanyId(String companyId, int pageNo,
			int pageSize) {
		return this.orgEmployeeDAO.getOrgEmployeeListByCompany(companyId,
				pageNo, pageSize);
	}

	@SuppressWarnings("unchecked")
	public List<OrgEmployee> getOrgEmployeeListByDepartment(String departmentId) {
		List<OrgEmployee> result = null;
		Object obj = this.getMc().getObject(
				departmentId + Constants.MEMCACHED.ORG_EMPLOYEE_LIST_DEPT);
		if (null == obj) {
			result = this.orgEmployeeDAO
					.getOrgEmployeeListByDepartment(departmentId);
			@SuppressWarnings("rawtypes")
			Collection<String> c = new ArrayList();
			for (int i = 0; i < result.size(); i++) {
				OrgEmployee employee = result.get(i);
				c.add(employee.getId());
				this.getMc().setObject(employee.getId(), employee);
			}
			this.getMc().setObject(
					departmentId + Constants.MEMCACHED.ORG_EMPLOYEE_LIST_DEPT,
					c);
		} else {
			Collection<String> keys = (Collection<String>) obj;
			result = this.getMc().getObjects(keys);
		}
		return result;
	}

	public Map<String, Object> getOrgEmployeeListByDepartment(
			String departmentId, int pageNo, int pageSize) {
		return this.orgEmployeeDAO.getOrgEmplyeeListByDepartment(departmentId,
				pageNo, pageSize);
	}

	public List<OrgEmployee> getOrgEmployeeListByCompany(String companyId) {
		return this.orgEmployeeDAO.getOrgEmployeeListByCompany(companyId);
	}

	public Map<String, Object> getOrgEmployeeListByCompany(String companyId,
			int pageNo, int pageSize) {
		return this.orgEmployeeDAO.getOrgEmployeeListByCompany(companyId,
				pageNo, pageSize);
	}

	public OrgEmployee getOrgEmployeeById(String id) {
		return this.orgEmployeeDAO.getOrgEmployeeById(id);
	}

	public void setOrgEmployeeDAO(OrgEmployeeDAO orgEmployeeDAO) {
		this.orgEmployeeDAO = orgEmployeeDAO;
	}

	public OrgEmployeeDAO getOrgEmployeeDAO() {
		return orgEmployeeDAO;
	}
}
