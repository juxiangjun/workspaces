package org.tju.ebs.domain.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.SysGroupUser;

public class SysGroupUserDAO extends BaseDAO<SysGroupUser> {

	private static final Logger log = LoggerFactory
			.getLogger(SysGroupDAO.class);

	@Override
	public void save(SysGroupUser instance) throws Exception {
		log.debug("SysGroupUserDAO: saving->" + instance.getId());
		super.save(instance);
	}

	public List<SysGroupUser> getSysGroupUserListBySysUser(String sysUserId) {
		String hql = "from SysGroupUser where sysUserId = '" + sysUserId + "'";
		return super.getObjectsByHQL(hql);
	}

}
