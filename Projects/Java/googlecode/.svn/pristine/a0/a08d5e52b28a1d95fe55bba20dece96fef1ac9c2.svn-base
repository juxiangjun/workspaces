package org.tju.ebs.domain.manager;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.OrgDepartment;
import org.tju.ebs.domain.dao.OrgDepartmentDAO;
import org.tju.ebs.resources.Constants;

public class OrgDepartmentManager extends BaseManager {

	private OrgDepartmentDAO orgDepartmentDAO;
	private static final Logger log = LoggerFactory
			.getLogger(OrgDepartmentManager.class);

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<OrgDepartment> getOrgDepartmentList(String companyId) {

		List<OrgDepartment> result = null;
		Object obj = this.getMc().getObject(
				Constants.MEMCACHED.ORG_DEPARTMENT_LIST_KEY + "_" + companyId);

		if (null == obj || ((Collection) obj).size() <= 0) {
			result = this.orgDepartmentDAO
					.getOrgDepartmentListByCompany(companyId);
			Collection<String> c = new ArrayList<String>();
			for (int i = 0; i < result.size(); i++) {
				OrgDepartment department = (OrgDepartment) result.get(i);
				c.add(department.getId());
				this.getMc().setObject(department.getId(), department);
			}
			this.getMc().setObject(
					Constants.MEMCACHED.ORG_DEPARTMENT_LIST_KEY + "_"
							+ companyId, c);
		} else {
			Collection<String> keys = (Collection<String>) obj;
			if (keys.size() > 0) {
				result = this.getMc().getObjects(keys);
			} else {
				log.debug("Key set is empty!");
			}
		}
		return result;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<OrgDepartment> getOrgDepartmentList(String companyId,
			String parentId) {
		List<OrgDepartment> result = null;
		Object obj = this.getMc().getObject(
				Constants.MEMCACHED.ORG_DEPARTMENT_LIST_KEY + "_" + companyId);

		if (null == obj || ((List) obj).size() <= 0) {
			result = this.orgDepartmentDAO
					.getOrgDepartmentListByCompany(companyId);
			Collection<String> c = new ArrayList<String>();
			for (int i = 0; i < result.size(); i++) {
				OrgDepartment department = (OrgDepartment) result.get(i);
				c.add(department.getId());
				this.getMc().setObject(department.getId(), department);
			}
			this.getMc().setObject(
					Constants.MEMCACHED.ORG_DEPARTMENT_LIST_KEY + "_"
							+ companyId, c);
			result = this.getOrgDepartmentListByParentId(parentId, result);
		} else {
			Collection<String> keys = (Collection<String>) obj;
			if (keys.size() > 0) {
				result = this.getMc().getObjects(keys);
				result = this.getOrgDepartmentListByParentId(parentId, result);
			} else {
				log.debug("Key set is empty!");
			}
		}

		return result;
	}

	private List<OrgDepartment> getOrgDepartmentListByParentId(String parentId,
			List<OrgDepartment> list) {
		List<OrgDepartment> result = new ArrayList<OrgDepartment>();

		if (null == parentId) {
			for (int i = 0; i < list.size(); i++) {
				OrgDepartment child = (OrgDepartment) list.get(i);
				if (child != null && child.getParentId() == null) {
					result.add(child);
				}
			}
		} else {
			for (int i = 0; i < list.size(); i++) {
				OrgDepartment child = (OrgDepartment) list.get(i);
				if (child != null && child.getParentId() != null
						&& child.getParentId().equalsIgnoreCase(parentId)) {
					result.add(child);
				}
			}
		}

		return result;
	}

	public Map<String, Object> getOrgDepartmentList(String companyId,
			String parentId, int pageNo, int pageSize) {
		return this.orgDepartmentDAO.getOrgDepartmentList(companyId, pageNo,
				pageSize);
	}

	@SuppressWarnings("unchecked")
	public void save(OrgDepartment instance) {
		Object obj = this.getMc().getObject(
				Constants.MEMCACHED.ORG_DEPARTMENT_LIST_KEY + "_"
						+ instance.getOrgCompanyId());
		boolean hasKey = false;

		Collection<String> keys = null;

		if (null != obj) {
			keys = (Collection<String>) obj;
			Iterator<?> it = keys.iterator();
			while (it.hasNext()) {
				String key = it.next().toString();
				if (key.equals(instance.getId())) {
					hasKey = true;
				}
			}
			if (!hasKey) {
				keys.add(instance.getId());
				this.getMc().setObject(
						Constants.MEMCACHED.ORG_DEPARTMENT_LIST_KEY + "_"
								+ instance.getOrgCompanyId(), keys);
			}
		} else {
			keys = new ArrayList<String>();
			keys.add(instance.getId());
			this.getMc().setObject(
					Constants.MEMCACHED.ORG_DEPARTMENT_LIST_KEY + "_"
							+ instance.getOrgCompanyId(), keys);
		}

		this.getMc().setObject(instance.getId(), instance);
		this.getMc().getObject(instance.getId());
		this.getMc().getObject(
				Constants.MEMCACHED.ORG_DEPARTMENT_LIST_KEY + "_"
						+ instance.getOrgCompanyId());
	}

	@SuppressWarnings("unchecked")
	public void delete(OrgDepartment instance) {
		Object obj = this.getMc().getObject(
				Constants.MEMCACHED.ORG_DEPARTMENT_LIST_KEY + "_"
						+ instance.getOrgCompanyId());

		Collection<String> keys = null;
		if (null != obj) {
			keys = (Collection<String>) obj;
			keys.remove(instance.getId());
		}
		this.getMc().remove(instance.getId());
		this.orgDepartmentDAO.delete(instance);
	}

	public OrgDepartment getOrgDepartmentById(String id) {
		return this.orgDepartmentDAO.getOrgDepartmentById(id);
	}

	public void setOrgDepartmentDAO(OrgDepartmentDAO orgDepartmentDAO) {
		this.orgDepartmentDAO = orgDepartmentDAO;
	}

	public OrgDepartmentDAO getOrgDepartmentDAO() {
		return orgDepartmentDAO;
	}
}
