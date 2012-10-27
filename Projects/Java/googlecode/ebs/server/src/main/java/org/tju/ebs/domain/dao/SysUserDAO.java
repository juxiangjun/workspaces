package org.tju.ebs.domain.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.SysUser;
import org.tju.ebs.utils.StringUtil;

public class SysUserDAO extends BaseDAO<SysUser> {

	private static final Logger log = LoggerFactory.getLogger(SysCityDAO.class);

	public void save(SysUser instance) throws Exception {
		super.save(instance);
	}

	public SysUser getSysUserById(String id) {
		return (SysUser) super.getObjectById(id);
	}

	public SysUser getSysUserByLoginInfo(String loginName, String password) {

		SysUser result = null;

		password = StringUtil.getMD5String(password);
		String hql = "from SysUser where loginName ='" + loginName
				+ "' and password = '" + password + "'";
		List<SysUser> list = super.getObjectsByHQL(hql);

		int count = list.size();
		if (count == 1) {
			result = list.get(0);
		} else if (count > 1) {
			log.debug("found 2 users");
		}

		return result;
	}
}
