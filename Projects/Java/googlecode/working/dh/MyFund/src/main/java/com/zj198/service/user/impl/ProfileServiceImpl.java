package com.zj198.service.user.impl;

import org.springframework.beans.BeanUtils;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.dao.DicUsertypeDAO;
import com.zj198.dao.UsrBankDAO;
import com.zj198.dao.UsrCompanyDAO;
import com.zj198.dao.UsrFinanceorgDAO;
import com.zj198.dao.UsrLoginhistoryDAO;
import com.zj198.dao.UsrPersonDAO;
import com.zj198.dao.UsrServiceorgDAO;
import com.zj198.dao.UsrUserDAO;
import com.zj198.model.DicUsertype;
import com.zj198.model.UsrBank;
import com.zj198.model.UsrCompany;
import com.zj198.model.UsrFinanceorg;
import com.zj198.model.UsrLoginhistory;
import com.zj198.model.UsrPerson;
import com.zj198.model.UsrServiceorg;
import com.zj198.model.UsrUser;
import com.zj198.service.user.ProfileService;
import com.zj198.util.Constants;

public class ProfileServiceImpl implements ProfileService {
	private UsrUserDAO usrUserDAO;
	private DicUsertypeDAO dicUsertypeDAO;
	private UsrPersonDAO usrPersonDAO;
	private UsrBankDAO usrBankDAO;
	private UsrFinanceorgDAO usrFinanceorgDAO;
	private UsrServiceorgDAO usrServiceorgDAO;
	private UsrCompanyDAO usrCompanyDAO;
	private UsrLoginhistoryDAO usrLoginhistoryDAO;
	
	public void setUsrLoginhistoryDAO(UsrLoginhistoryDAO usrLoginhistoryDAO) {
		this.usrLoginhistoryDAO = usrLoginhistoryDAO;
	}
	public void setUsrUserDAO(UsrUserDAO usrUserDAO) {
		this.usrUserDAO = usrUserDAO;
	}
	public void setDicUsertypeDAO(DicUsertypeDAO dicUsertypeDAO) {
		this.dicUsertypeDAO = dicUsertypeDAO;
	}
	public void setUsrPersonDAO(UsrPersonDAO usrPersonDAO) {
		this.usrPersonDAO = usrPersonDAO;
	}
	public void setUsrBankDAO(UsrBankDAO usrBankDAO) {
		this.usrBankDAO = usrBankDAO;
	}
	public void setUsrFinanceorgDAO(UsrFinanceorgDAO usrFinanceorgDAO) {
		this.usrFinanceorgDAO = usrFinanceorgDAO;
	}
	public void setUsrServiceorgDAO(UsrServiceorgDAO usrServiceorgDAO) {
		this.usrServiceorgDAO = usrServiceorgDAO;
	}
	public void setUsrCompanyDAO(UsrCompanyDAO usrCompanyDAO) {
		this.usrCompanyDAO = usrCompanyDAO;
	}

	@Override
	public void saveorupdate(Object profile) {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser)context.getSession().get("_user");
		DicUsertype ut = dicUsertypeDAO.get(user.getType()+0);
		if(ut==null){
			return;
		}
		switch (ut.getGroup()){
			case Constants.USERTYPE_GROUP_COMPANY:
				saveOrUpdateCompanyProfile((UsrCompany)profile,user.getId());
				break;
			case Constants.USERTYPE_GROUP_BANK:
				saveOrUpdateBankProfile((UsrBank)profile,user.getId());
				break;
			case Constants.USERTYPE_GROUP_FINANCEORG:
				saveOrUpdateFinanceorgProfile((UsrFinanceorg)profile,user.getId());
				break;
			case Constants.USERTYPE_GROUP_SERVICEORG:
				saveOrUpdateServiceorgProfile((UsrServiceorg)profile,user.getId());
				break;
			case Constants.USERTYPE_GROUP_PERSONAL:
				saveOrUpdatePersonProfile((UsrPerson)profile,user.getId());
				break;
		}
	}
	
	private void saveOrUpdatePersonProfile(UsrPerson profile,int uid){
		UsrPerson profile_old = usrPersonDAO.getByUid(uid);
		if(profile_old==null){
			profile.setUserid(uid);
			usrPersonDAO.save(profile);
		}else{
			BeanUtils.copyProperties(profile, profile_old);
			profile_old.setUserid(uid);
			usrPersonDAO.update(profile_old);
		}
	}
	
	private void saveOrUpdateBankProfile(UsrBank profile,int uid){
		UsrBank profile_old = usrBankDAO.getByUid(uid);
		if(profile_old==null){
			profile.setUserid(uid);
			usrBankDAO.save(profile);
		}else{
			BeanUtils.copyProperties(profile, profile_old);
			profile_old.setUserid(uid);
			usrBankDAO.update(profile_old);
		}
	}
	
	private void saveOrUpdateServiceorgProfile(UsrServiceorg profile,int uid){
		UsrServiceorg profile_old = usrServiceorgDAO.getByUid(uid);
		if(profile_old==null){
			profile.setUserid(uid);
			usrServiceorgDAO.save(profile);
		}else{
			BeanUtils.copyProperties(profile, profile_old);
			profile_old.setUserid(uid);
			usrServiceorgDAO.update(profile_old);
		}
	}
	
	private void saveOrUpdateFinanceorgProfile(UsrFinanceorg profile,int uid){
		UsrFinanceorg profile_old = usrFinanceorgDAO.getByUid(uid);
		if(profile_old==null){
			profile.setUserid(uid);
			usrFinanceorgDAO.save(profile);
		}else{
			BeanUtils.copyProperties(profile, profile_old);
			profile_old.setUserid(uid);
			usrFinanceorgDAO.update(profile_old);
		}
	}
	
	private void saveOrUpdateCompanyProfile(UsrCompany profile,int uid){
		UsrCompany profile_old = usrCompanyDAO.getByUid(uid);
		if(profile_old==null){
			profile.setUserid(uid);
			usrCompanyDAO.save(profile);
		}else{
			BeanUtils.copyProperties(profile, profile_old);
			profile_old.setUserid(uid);
			usrCompanyDAO.update(profile_old);
		}
	}

	@Override
	public Object getProfiles(Integer uid) {
		UsrUser user = usrUserDAO.get(uid);
		int groupid = this.getGroupidByUserType(user.getType());
		switch (groupid){
			case Constants.USERTYPE_GROUP_COMPANY:
				return usrCompanyDAO.getByUid(uid);
			case Constants.USERTYPE_GROUP_BANK:
				return usrBankDAO.getByUid(uid);
			case Constants.USERTYPE_GROUP_FINANCEORG:
				return usrFinanceorgDAO.getByUid(uid);
			case Constants.USERTYPE_GROUP_SERVICEORG:
				return usrServiceorgDAO.getByUid(uid);
			case Constants.USERTYPE_GROUP_PERSONAL:
				return usrPersonDAO.getByUid(uid);
		}
		return null;
	}
	
	@Override
	public int getGroupidByUserType(Short userType) {
		DicUsertype ut = dicUsertypeDAO.get(userType+0);
		if(ut==null){
			return 0;
		}else{
			return ut.getGroup();
		}
	}
	
	@Override
	public UsrLoginhistory getLoginHistory(){
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser)context.getSession().get("_user");
		return usrLoginhistoryDAO.getLastByUid(user.getId());
	}

}
