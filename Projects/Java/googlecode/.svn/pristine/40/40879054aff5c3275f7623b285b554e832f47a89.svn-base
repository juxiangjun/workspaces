package org.tju.ebs.domain.service.impl;

import java.util.List;

import org.tju.ebs.bean.SysMenu;
import org.tju.ebs.bean.SysObject;
import org.tju.ebs.bean.SysObjectProperty;
import org.tju.ebs.bean.SysParam;
import org.tju.ebs.domain.manager.SysMenuManager;
import org.tju.ebs.domain.manager.SysObjectManager;
import org.tju.ebs.domain.manager.SysParamManager;
import org.tju.ebs.domain.service.IAppInitialService;

public class AppInitialServiceImpl implements IAppInitialService{

	private SysMenuManager sysMenuMgr;
	private SysObjectManager sysObjectMgr;
	private SysParamManager sysParamMgr;

	public List<SysObject> getSysObjectList() {
		return this.sysObjectMgr.getSysObjectList();
	}

	public List<SysObjectProperty> getSysObjectPropertyList() {
		return this.sysObjectMgr.getSysObjectPropertyList();
	}
	

	public List<SysMenu> getSysMemuList(String userId) {
		return this.sysMenuMgr.getAll(null);
	}

	public List<SysParam> getSysParams(String userId) {
		// TODO Auto-generated method stub
		return this.sysParamMgr.getAll();
	}

	public SysParamManager getSysParamMgr() {
		return sysParamMgr;
	}

	public void setSysParamMgr(SysParamManager sysParamMgr) {
		this.sysParamMgr = sysParamMgr;
	}
	
	

	public SysObjectManager getSysObjectMgr() {
		return sysObjectMgr;
	}

	public void setSysObjectMgr(SysObjectManager sysObjectMgr) {
		this.sysObjectMgr = sysObjectMgr;
	}


	public SysMenuManager getSysMenuMgr() {
		return sysMenuMgr;
	}

	public void setSysMenuMgr(SysMenuManager sysMenuMgr) {
		this.sysMenuMgr = sysMenuMgr;
	}

}
