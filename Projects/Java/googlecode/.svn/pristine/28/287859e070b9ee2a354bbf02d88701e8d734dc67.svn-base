package org.tju.ebs.domain.manager;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.SysMenu;
import org.tju.ebs.bean.SysUser;
import org.tju.ebs.domain.dao.SysMenuDAO;

public class SysMenuManager extends BaseManager {

	private SysMenuDAO sysMenuDAO;
	private Memcached mc;
	private static final Logger log = LoggerFactory
			.getLogger(SysMenuManager.class);

	private final String key = "SYS_MENU";

	public SysMenuManager() {

	}

	public List<SysMenu> getSysMenuByModelId(String modelId) {
		return this.sysMenuDAO.getSysMenuListByModelId(modelId);
	}

	public SysMenu getSysMenuById(String id) {
		return (SysMenu) this.sysMenuDAO.getSysMenuById(id);
	}

	public List<SysMenu> getAll(SysUser sysUser) {
		return sysMenuDAO.getAll();
	}

	@SuppressWarnings("unchecked")
	public List<SysMenu> getSysMenuListByParentId(SysUser sysUser,
			String parentId) {

		/** @sysMenuKey is a user's menu list key which stored in memcache */
		String sysMenuKey = key + sysUser.getId();

		/**
		 * get menu list from memcache, if not exist then get them from db, and
		 * save the result to memcache
		 */
		Object obj = mc.getObject(sysMenuKey);
		if (null == obj) {
			obj = this.getAll(sysUser);
			mc.setObject(sysMenuKey, obj);
		}
		return this.filterSysMenuListByParentId((List<SysMenu>) obj, parentId);
	}

	/** get the menus what the client need from menu list stored in memcache. */
	private List<SysMenu> filterSysMenuListByParentId(List<SysMenu> list,
			String parentId) {

		List<SysMenu> result = new ArrayList<SysMenu>();

		if (parentId == null) {
			for (int i = 0; i < list.size(); i++) {
				SysMenu sysMenu = (SysMenu) list.get(i);
				if (sysMenu.getParentId() == null
						|| sysMenu.getParentId().trim() == "") {
					result.add(sysMenu);
				}
			}
		} else {
			for (int i = 0; i < list.size(); i++) {
				SysMenu sysMenu = (SysMenu) list.get(i);
				if (sysMenu.getParentId() != null
						&& sysMenu.getParentId().equals(parentId)) {
					result.add(sysMenu);
				}
			}
		}
		return result;
	}

	public void save(SysMenu entity) throws Exception {
		log.debug("SysMenuManager: saving->" + entity.getId());
		this.sysMenuDAO.save(entity);
	}

	public void delete(SysMenu entity) throws Exception {
		this.sysMenuDAO.delete(entity);
	}

	public SysMenuDAO getSysMenuDAO() {
		return sysMenuDAO;
	}

	public void setSysMenuDAO(SysMenuDAO sysMenuDAO) {
		this.sysMenuDAO = sysMenuDAO;
	}

	public void setMc(Memcached mc) {
		this.mc = mc;
	}

	public Memcached getMc() {
		return mc;
	}

}
