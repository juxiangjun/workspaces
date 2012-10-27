package org.tju.ebs.domain.manager;

import java.util.List;

import org.tju.ebs.bean.SysParam;
import org.tju.ebs.domain.dao.SysParamDAO;

public class SysParamManager extends BaseManager {

	private SysParamDAO sysParamDAO;

	public List<SysParam> getAll() {
		return this.sysParamDAO.getAll();
	}

	public void setSysParamDAO(SysParamDAO sysParamDAO) {
		this.sysParamDAO = sysParamDAO;
	}

	public SysParamDAO getSysParamDAO() {
		return sysParamDAO;
	}
}
