package org.tju.ebs.domain.manager;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.SysGroupUser;
import org.tju.ebs.domain.dao.SysGroupUserDAO;

public class SysGroupUserManager extends BaseManager {

	private SysGroupUserDAO sysGroupUserDAO;
	private static final Logger log = LoggerFactory
			.getLogger(SysGroupUserManager.class);

	public void save(SysGroupUser instance) throws Exception {
		log.debug("SysGroupUserManager: saving->" + instance.getId());
		this.sysGroupUserDAO.save(instance);
	}

	public void setSysGroupUserDAO(SysGroupUserDAO sysGroupUserDAO) {
		this.sysGroupUserDAO = sysGroupUserDAO;
	}

	public SysGroupUserDAO getSysGroupUserDAO() {
		return sysGroupUserDAO;
	}
}
