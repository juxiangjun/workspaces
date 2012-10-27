package org.tju.ebs.domain.service.impl;

import java.util.Map;

import org.tju.ebs.domain.manager.SysCountryManager;
import org.tju.ebs.domain.service.ISysCountryService;

public class SysCountryServiceImpl implements ISysCountryService {

	private SysCountryManager sysCountryMgr;

	public Map<String, Object> getSysCountryList(int pageNo, int pageSize) {
		return this.sysCountryMgr.getAll(pageNo, pageSize);
	}

	public SysCountryManager getSysCountryMgr() {
		return sysCountryMgr;
	}

	public void setSysCountryMgr(SysCountryManager sysCountryMgr) {
		this.sysCountryMgr = sysCountryMgr;
	}

	public Map<String, Object> getSysCountryListByFilter(int pageNo, int pageSize, String filter) {
		return this.sysCountryMgr.getAll(pageNo, pageSize, filter);
	}

}
