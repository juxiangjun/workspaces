package org.tju.ebs.domain.manager;

import org.tju.ebs.bean.OrgCompanyAddress;
import org.tju.ebs.domain.dao.OrgCompanyAddressDAO;

public class OrgCompanyAddressManager extends BaseManager {

	private OrgCompanyAddressDAO orgCompanyAddressDAO;

	public void save(OrgCompanyAddress instance) throws Exception {
		this.orgCompanyAddressDAO.save(instance);
	}

	/*
	 * public OrgCompanyAddress save(String companyId, Short addressType,
	 * Address address){ if (StringUtil.isNull(address.getId())){
	 * address.setId(this.getUUID()); }
	 * 
	 * this.addressDAO.save(address); OrgCompany orgCompany =
	 * orgCompanyMgr.getOrgCompanyById(companyId); OrgCompanyAddress
	 * orgCompanyAddress = new OrgCompanyAddress(); orgCompanyAddress =
	 * (OrgCompanyAddress) this.checkID(orgCompanyAddress);
	 * orgCompanyAddress.setAddressType(addressType);
	 * orgCompanyAddress.setAddressId(address.getId());
	 * orgCompanyAddress.setOrgCompanyId(orgCompany.getId());
	 * orgCompanyAddress.setOrgCompanyName(orgCompany.getFullName());
	 * orgCompanyAddress = orgCompanyAddressDAO.save(orgCompanyAddress); return
	 * orgCompanyAddress; }
	 */

	public void setOrgCompanyAddressDAO(
			OrgCompanyAddressDAO orgCompanyAddressDAO) {
		this.orgCompanyAddressDAO = orgCompanyAddressDAO;
	}

	public OrgCompanyAddressDAO getOrgCompanyAddressDAO() {
		return orgCompanyAddressDAO;
	}

}
