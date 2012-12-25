package com.zj198.service.partner;

import java.util.List;

import com.zj198.model.PnrUser;


public interface PnrUsrService {

	List<PnrUser> getlist();
	
	PnrUser getById(Integer id);
	
	void updatePnrUsr(PnrUser p);
	
	void savePnrUsr(PnrUser p);
	
	public PnrUser partnerUserLogin(String userName, String password);
}
