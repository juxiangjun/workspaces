package org.tju.ebs.domain.dao;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.SysObjectRelated;

/**
 * A data access object (DAO) providing persistence and search support for
 * SysObjectRelated entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see org.tju.ebs.bean.SysObjectRelated
 * @author MyEclipse Persistence Tools
 */

public class SysObjectRelatedDAO extends BaseDAO<SysObjectRelated> {
	private static final Logger log = LoggerFactory
			.getLogger(SysObjectRelatedDAO.class);

	@Override
	public void save(SysObjectRelated instance) throws Exception {
		log.debug("SysObjectRelatedDAO: saving->" + instance.getId());
		super.save(instance);
	}

	public Map<String, Object> getAll(String parentId, int pageNo, int pageSize) {
		String hql = "from SysObjectRelated where parentId = '" + parentId
				+ "'";
		return super.getObjectsByHql(hql, pageNo, pageSize);
	}
}