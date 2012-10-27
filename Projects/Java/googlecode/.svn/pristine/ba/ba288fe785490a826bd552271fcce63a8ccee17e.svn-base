package com.zj198.service.user.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.zj198.dao.DicUsertypeDAO;
import com.zj198.dao.UsrLoginhistoryDAO;
import com.zj198.dao.UsrUserDAO;
import com.zj198.model.DicUsertype;
import com.zj198.model.UsrLoginhistory;
import com.zj198.model.UsrUser;
import com.zj198.service.user.AccountService;
import com.zj198.util.Constants;
import com.zj198.util.NumberUtil;
import com.zj198.util.SecurityUtil;

public class AccountServiceImpl implements AccountService {
	private UsrUserDAO usrUserDAO;
	private UsrLoginhistoryDAO usrLoginhistoryDAO;
	private DicUsertypeDAO dicUsertypeDAO;

	@Override
	public int addUser(String username, String password, String mobile, String email,String realname,Short gender,String activeCode,Short userType) {
		if(usrUserDAO.isExistUsername(username)){
			return -1;
		}
		if(usrUserDAO.isExistMobile(mobile,null)){
			return -2;
		}
		if(usrUserDAO.isExistEmail(email,null)){
			return -3;
		}
		UsrUser user = new UsrUser();
		user.setUsername(username);
		user.setPassword(SecurityUtil.getMD5(password));
		user.setMobile(mobile);
		user.setEmail(email);
		user.setStatus(Constants.USER_STATUS_AVAILABLE);//正常用户
		Date now = Calendar.getInstance().getTime();
		user.setCreatedt(now);
		user.setUpdatedt(now);
		user.setRealname(realname);
		user.setGender(gender);
		user.setActivecode(activeCode);
		user.setActivetype(Constants.USER_ACTIVE_NONE);//未验证
		user.setAuditstatus(Constants.USER_AUDITSTATUS_NONE);//未审核
		if(userType!=null){
			user.setType(userType);
		}else{
			user.setType(Constants.USER_TYPE_NULL);//类型未选择
		}
		usrUserDAO.save(user);
		return user.getId();
	}


	@Override
	public UsrUser userLogin_tx(String username, String password, String ip) {
		UsrUser user = usrUserDAO.getByUsername(username);
		if(user!=null && user.getPassword().equals(SecurityUtil.getMD5(password))){
			UsrLoginhistory uh = new UsrLoginhistory();
			uh.setLogindt(Calendar.getInstance().getTime());
			uh.setLoginip(ip);
			uh.setUid(user.getId());
			usrLoginhistoryDAO.save(uh);
			UsrUser suser = new UsrUser(user.getId(),user.getType(),user.getUsername(),user.getRealname(),user.getGender(),user.getStatus(),user.getActivetype(),user.getAuditstatus());
			return suser;
		}
		return null;
	}
	
	@Override
	public int updateUserType(Integer userId, Short userType) {
		List<DicUsertype> usertypeList = dicUsertypeDAO.findAll();
		short typeGroup = 0;
		for(DicUsertype ut:usertypeList){
			if(ut.getId()-userType==0){
				typeGroup = ut.getGroup().shortValue();
				break;
			}
		}
		if(typeGroup>0){
			UsrUser user = usrUserDAO.get(userId);
			user.setType(userType);
			user.setUpdatedt(Calendar.getInstance().getTime());
			usrUserDAO.update(user);
			return 0;
		}else{
			return -1;
		}
		
	}
	
	@Override
	public int activeUser_tx(int uid, String activeType, String activecode) {
		UsrUser user = usrUserDAO.get(uid);
		if(user!=null && user.getActivecode()!=null){
			String[] active_db = user.getActivecode().split("\\|");
			if(activeType.equals(active_db[0]) && activecode.equals(active_db[1])){
				boolean flag=false;
				if(activeType.equals("1") && !NumberUtil.ifExist(user.getActivetype(),Constants.USER_ACTIVE_EMAIL)){
					user.setActivetype((short)(user.getActivetype()+Constants.USER_ACTIVE_EMAIL));
					flag=true;
				}else if(activeType.equals("2") && !NumberUtil.ifExist(user.getActivetype(),Constants.USER_ACTIVE_MOBILE)){
					user.setActivetype((short)(user.getActivetype()+Constants.USER_ACTIVE_MOBILE));
					flag=true;
				}
				if(flag){
					user.setActivecode(null);
					user.setUpdatedt(Calendar.getInstance().getTime());
					usrUserDAO.update(user);
					return user.getId();
				}
			}
		}
		return -1;
	}
	
	@Override
	public int activeUser_tx(String username, String activecode) {
		UsrUser user = usrUserDAO.getByUsername(username);
		if(user!=null){
			String[] active_db = user.getActivecode().split("\\|");
			if(activecode.equalsIgnoreCase(active_db[1])){
				boolean flag=false;
				if(active_db[0].equals("1") && !NumberUtil.ifExist(user.getActivetype(),Constants.USER_ACTIVE_EMAIL)){
					user.setActivetype((short)(user.getActivetype()+Constants.USER_ACTIVE_EMAIL));
					flag=true;
				}else if(active_db[0].equals("2") && !NumberUtil.ifExist(user.getActivetype(),Constants.USER_ACTIVE_MOBILE)){
					user.setActivetype((short)(user.getActivetype()+Constants.USER_ACTIVE_MOBILE));
					flag=true;
				}
				if(flag){
					user.setActivecode(null);
					user.setUpdatedt(Calendar.getInstance().getTime());
					usrUserDAO.update(user);
					return user.getId();
				}
			}
		}
		return -1;
	}
	
	@Override
	public UsrUser getUserByUsername(String username) {
		return usrUserDAO.getByUsername(username);
	}
	
	@Override
	public UsrUser getUserById(Integer uid) {
		return usrUserDAO.get(uid);
	}
	
	@Override
	public int updateUser(UsrUser user) {
		user.setUpdatedt(Calendar.getInstance().getTime());
		usrUserDAO.update(user);
		return user.getId();
	}
	
	//get  and  set
	public void setUsrUserDAO(UsrUserDAO usrUserDAO) {
		this.usrUserDAO = usrUserDAO;
	}
	public void setUsrLoginhistoryDAO(UsrLoginhistoryDAO usrLoginhistoryDAO) {
		this.usrLoginhistoryDAO = usrLoginhistoryDAO;
	}
	public void setDicUsertypeDAO(DicUsertypeDAO dicUsertypeDAO) {
		this.dicUsertypeDAO = dicUsertypeDAO;
	}

}
