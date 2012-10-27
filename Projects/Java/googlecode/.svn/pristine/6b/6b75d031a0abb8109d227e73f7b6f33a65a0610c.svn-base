package org.tju.ebs.domain.dao;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.SysObjectProperty;

/**
 * A data access object (DAO) providing persistence and search support for
 * SysObjectProperty entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see org.tju.ebs.bean.SysObjectProperty
 * @author MyEclipse Persistence Tools
 */

public class SysObjectPropertyDAO extends BaseDAO<SysObjectProperty> {

	private static final Logger log = LoggerFactory
			.getLogger(SysObjectPropertyDAO.class);

	@Override
	public void save(SysObjectProperty instance) throws Exception {
		log.debug("SysObjectPropertyDAO: saving->" + instance.getId());
		super.save(instance);
	}

	public List<SysObjectProperty> getAll() {
		return super.getAll();
	}

	public Map<String, Object> getAll(String parentId, int pageNo, int pageSize) {
		String hql = "from SysObjectProperty where parentId = '" + parentId
				+ "'";
		return super.getObjectsByHql(hql, pageNo, pageSize);
	}

	public List<SysObjectProperty> getSysObjectProperties(String sysObjectId) {
		String hql = "from SysObjectProperty where sysObjectId = '"
				+ sysObjectId
				+ "' and deletedFlag='0' order by sysObjectId, sequence";
		return super.getObjectsByHQL(hql);
	}

	public List<SysObjectProperty> getSysObjectProperties() {
		String hql = "from SysObjectProperty where deletedFlag='0' order by sysObjectId, sequence";
		return super.getObjectsByHQL(hql);
	}

}