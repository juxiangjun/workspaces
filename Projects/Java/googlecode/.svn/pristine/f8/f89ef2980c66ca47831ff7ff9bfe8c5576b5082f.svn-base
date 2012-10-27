package org.tju.ebs.domain.dao;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.OrgCompany;
import org.tju.ebs.utils.StringUtil;

/**
 * A data access object (DAO) providing persistence and search support for
 * OrgCompany entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see org.tju.ebs.bean.OrgCompany
 * @author MyEclipse Persistence Tools
 */

public class OrgCompanyDAO extends BaseDAO<OrgCompany> {
	private static final Logger log = LoggerFactory
			.getLogger(OrgCompanyDAO.class);

	public void save(OrgCompany instance) throws Exception {
		super.save(instance);
	}

	public OrgCompany getOrgCompanyById(String id) {
		return (OrgCompany) super.getObjectById(id);
	}

	public Map<String, Object> getAll(String parent, int pageNo, int pageSize) {
		String hql = "from OrgCompany";

		if (!StringUtil.isNull(parent)) {
			hql = "from OrgCompany where parentId = '" + parent + "'";
		}
		log.debug(hql);
		return super.getObjectsByHql(hql, pageNo, pageSize);
	}

	public List<OrgCompany> getOrgCompanyByParentId(String parentid) {
		String hql = "from OrgCompany where parentId = '" + parentid + "'";
		return super.getObjectsByHQL(hql);
	}
}