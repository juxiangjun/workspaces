package org.tju.ebs.domain.manager;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.SysObject;
import org.tju.ebs.bean.SysObjectProperty;
import org.tju.ebs.domain.dao.SysObjectDAO;
import org.tju.ebs.domain.dao.SysObjectPropertyDAO;
import org.tju.ebs.resources.Constants;

public class SysObjectManager extends BaseManager {

	private SysObjectDAO sysObjectDAO;
	private SysObjectPropertyDAO sysObjectPropertyDAO;
	private static final Logger log = LoggerFactory
			.getLogger(SysObjectManager.class);

	public List<SysObject> getSysObjectList() {
		return this.sysObjectDAO.getAll();
	}

	public List<SysObjectProperty> getSysObjectPropertyList() {
		return this.sysObjectPropertyDAO.getAll();
	}

	@SuppressWarnings("unchecked")
	public List<SysObjectProperty> getSysObjectProperties() {
		List<SysObjectProperty> result = null;
		Object obj = this.getMc().getObject(
				Constants.MEMCACHED.SYS_OBJECT_PROPERTY_LIST);
		if (null == obj) {
			result = this.sysObjectPropertyDAO.getSysObjectProperties();
			this.getMc().setObject(
					Constants.MEMCACHED.SYS_OBJECT_PROPERTY_LIST, result);
		} else {
			result = (List<SysObjectProperty>) obj;
		}
		return result;
	}

	public List<SysObjectProperty> getSysObjectProperties(String sysObjectId) {
		return this.sysObjectPropertyDAO.getSysObjectProperties(sysObjectId);
	}

	public void setSysObjectDAO(SysObjectDAO sysObjectDAO) {
		this.sysObjectDAO = sysObjectDAO;
	}

	public SysObjectDAO getSysObjectDAO() {
		return sysObjectDAO;
	}

	public SysObjectPropertyDAO getSysObjectPropertyDAO() {
		return sysObjectPropertyDAO;
	}

	public void setSysObjectPropertyDAO(
			SysObjectPropertyDAO sysObjectPropertyDAO) {
		this.sysObjectPropertyDAO = sysObjectPropertyDAO;
	}

}
