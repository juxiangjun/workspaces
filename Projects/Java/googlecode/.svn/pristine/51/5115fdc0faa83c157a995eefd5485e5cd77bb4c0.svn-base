package org.tju.ebs.domain.manager;

import org.tju.ebs.bean.SysRegistration;
import org.tju.ebs.domain.dao.SysRegistrationDAO;

public class SysRegistrationManager extends BaseManager {

	private SysRegistrationDAO sysRegistrationDAO;

	public SysRegistration getSysRegistrationById(String id) {

		SysRegistration result = null;

		Object obj = this.getMc().getObject(id);
		if (obj != null) {
			result = (SysRegistration) obj;
		} else {
			result = (SysRegistration) this.sysRegistrationDAO
					.getSysRegistrationById(id);
			this.getMc().setObject(result.getId(), result);
		}
		return result;
	}

	public void saveSysRegistration(SysRegistration instance) throws Exception {
		getMc().setObject(instance.getId(), instance);
		this.sysRegistrationDAO.save(instance);
	}

	public void setSysRegistrationDAO(SysRegistrationDAO sysRegistrationDAO) {
		this.sysRegistrationDAO = sysRegistrationDAO;
	}

	public SysRegistrationDAO getSysRegistrationDAO() {
		return sysRegistrationDAO;
	}
}
