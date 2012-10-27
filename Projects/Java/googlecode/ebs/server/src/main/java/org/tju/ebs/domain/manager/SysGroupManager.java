package org.tju.ebs.domain.manager;

import java.util.List;

import org.tju.ebs.bean.SysGroup;
import org.tju.ebs.domain.dao.SysGroupDAO;

public class SysGroupManager extends BaseManager {

	private SysGroupDAO sysGroupDAO;

	public SysGroup getSysGroupById(String id) {
		return this.sysGroupDAO.getSysGroupById(id);
	}

	public List<SysGroup> getSysGroupListBySysUserId(String sysUserId) {
		return this.sysGroupDAO.getSysGroupListBySysUserId(sysUserId);
	}

	public void save(SysGroup instance) throws Exception {
		this.sysGroupDAO.save(instance);
	}

	public void setSysGroupDAO(SysGroupDAO sysGroupDAO) {
		this.sysGroupDAO = sysGroupDAO;
	}

	public SysGroupDAO getSysGroupDAO() {
		return sysGroupDAO;
	}
}
