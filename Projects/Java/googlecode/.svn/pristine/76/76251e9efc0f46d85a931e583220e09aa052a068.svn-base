package org.tju.ebs.domain.service;

import java.util.List;

import org.tju.ebs.bean.SysMenu;
import org.tju.ebs.bean.SysObject;
import org.tju.ebs.bean.SysObjectProperty;
import org.tju.ebs.bean.SysParam;

public interface IAppInitialService extends IBaseService {

	public final static String SERVICE_NAME="IAppInitialService";
	
	/*
	 * SysObject
	 */
	public List<SysObject> getSysObjectList();
	public List<SysObjectProperty> getSysObjectPropertyList();
	
	/*
	 * SysMenu.
	 * 
	 */
	public List<SysMenu> getSysMemuList(String userId);
	
	/*
	 * SysParams.
	 * 
	 */
	public List<SysParam> getSysParams(String userId);
}
