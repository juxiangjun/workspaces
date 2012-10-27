package org.tju.ebs.domain.manager;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.SysUser;
import org.tju.ebs.domain.dao.SysUserDAO;
import org.tju.ebs.utils.StringUtil;

public class SysUserManager extends BaseManager {

	private SysUserDAO sysUserDAO;
	private static final Logger log = LoggerFactory
			.getLogger(SysUserManager.class);

	public SysUser getSysUserById(String id) {
		SysUser result = this.sysUserDAO.getSysUserById(id);
		return result;
	}

	public SysUser getSysUserByLoginInfo(String loginName, String password) {
		SysUser result = null;
		Object obj = this.getMc().getObject(loginName + password);

		if (null == obj) {
			result = this.sysUserDAO.getSysUserByLoginInfo(loginName, password);
			this.getMc().setObject(loginName + password, result);
		} else {
			result = (SysUser) obj;
		}
		return result;
	}

	public void save(SysUser instance) throws Exception {
		String password = instance.getPassword();
		String key = instance.getLoginName() + password;
		instance.setPassword(StringUtil.getMD5String(password));
		if (this.getMc().getObject(key) != null) {
			this.getMc().setObject(key, instance);
		}
		this.sysUserDAO.save(instance);
	}

	public void setSysUserDAO(SysUserDAO sysUserDAO) {
		this.sysUserDAO = sysUserDAO;
	}

	public SysUserDAO getSysUserDAO() {
		return sysUserDAO;
	}
}
