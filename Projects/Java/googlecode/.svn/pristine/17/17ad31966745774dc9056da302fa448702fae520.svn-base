package org.tju.ebs.domain.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.SysGroup;

public class SysGroupDAO extends BaseDAO<SysGroup> {

	private static final Logger log = LoggerFactory.getLogger(SysCityDAO.class);

	@Override
	public void save(SysGroup instance) throws Exception {
		log.debug("SysGroupDAO: saving->" + instance.getId());
		super.save(instance);
	}

	public SysGroup getSysGroupById(String id) {
		return (SysGroup) super.getObjectById(id);
	}

	public List<SysGroup> getSysGroupListBySysUserId(String sysUserId) {
		String hql = "from SysGroup where id in (select sysGroupId from SysGroupUser where sysUserId = '"
				+ sysUserId + "')";
		return super.getObjectsByHQL(hql);
	}

}
