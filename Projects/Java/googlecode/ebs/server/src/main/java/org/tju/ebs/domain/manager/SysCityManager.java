package org.tju.ebs.domain.manager;

import org.tju.ebs.domain.dao.SysCityDAO;

public class SysCityManager extends BaseManager {
	private SysCityDAO sysCityDAO;

	public void setSysCityDAO(SysCityDAO sysCityDAO) {
		this.sysCityDAO = sysCityDAO;
	}

	public SysCityDAO getSysCityDAO() {
		return sysCityDAO;
	}
}
