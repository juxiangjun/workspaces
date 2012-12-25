package com.zj198.service.partner.impl;

import java.util.List;

import com.zj198.dao.PnrUserDAO;
import com.zj198.model.PnrUser;
import com.zj198.service.partner.PnrUsrService;
import com.zj198.util.SecurityUtil;

public class PnrUsrServiceImpl implements PnrUsrService {

	private PnrUserDAO pnrUserDAO;

	public void setPnrUserDAO(PnrUserDAO pnrUserDAO) {
		this.pnrUserDAO = pnrUserDAO;
	}

	public List<PnrUser> getlist() {
		return pnrUserDAO.findAll();
	}

	public PnrUser getById(Integer id) {
		return pnrUserDAO.get(id);
	}

	public void updatePnrUsr(PnrUser p) {
		pnrUserDAO.update(p);
		
	}

	public void savePnrUsr(PnrUser p) {
		p.setPassword(SecurityUtil.getMD5(p.getPassword()));
		pnrUserDAO.save(p);
	}
	/**
	 * 验证登陆
	 * @param userName
	 * @param password
	 * @return
	 */
	public PnrUser partnerUserLogin(String userName, String password){
		PnrUser puser = pnrUserDAO.findPnrUserByName(userName);
		if(puser != null && puser.getPassword().equals(SecurityUtil.getMD5(password))){
			return puser;
		}else{
			return null;
		}
	}
}
