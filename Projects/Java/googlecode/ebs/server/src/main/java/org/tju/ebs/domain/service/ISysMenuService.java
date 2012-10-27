package org.tju.ebs.domain.service;

import java.util.List;

import org.tju.ebs.bean.SysMenu;

public interface ISysMenuService extends IBaseService {

	public static final String SERVICE_NAME = "ISysMenuService";

	public List<SysMenu> getSysMemuList(String userId);

}
