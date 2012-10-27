package org.tju.ebs.domain.manager;

import java.util.List;

import org.tju.ebs.bean.SysModel;
import org.tju.ebs.domain.dao.SysModelDAO;

public class SysModelManager extends BaseManager {

	private SysModelDAO sysModelDAO;

	public List<SysModel> getAll() {
		return this.sysModelDAO.getAll();
	}

	public void setSysModelDAO(SysModelDAO sysModelDAO) {
		this.sysModelDAO = sysModelDAO;
	}

	public SysModelDAO getSysModelDAO() {
		return sysModelDAO;
	}
}
