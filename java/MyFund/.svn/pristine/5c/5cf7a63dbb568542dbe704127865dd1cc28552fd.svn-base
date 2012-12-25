package com.zj198.service.user.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.dao.DicUsertypeDAO;
import com.zj198.dao.UsrContractDAO;
import com.zj198.dao.UsrLoginhistoryDAO;
import com.zj198.dao.UsrUserDAO;
import com.zj198.model.DicUsertype;
import com.zj198.model.NtyMessageQueue;
import com.zj198.model.UsrContract;
import com.zj198.model.UsrLoginhistory;
import com.zj198.model.UsrUser;
import com.zj198.service.common.NotifyQueueService;
import com.zj198.service.user.AccountService;
import com.zj198.service.user.model.RegisterUserSrModel;
import com.zj198.util.Constants;
import com.zj198.util.FreemarkerUtil;
import com.zj198.util.NumberUtil;
import com.zj198.util.Pager;
import com.zj198.util.PropertiesUtil;
import com.zj198.util.SecurityUtil;
import com.zj198.util.StringUtil;

public class AccountServiceImpl implements AccountService {
	private UsrUserDAO usrUserDAO;
	private UsrLoginhistoryDAO usrLoginhistoryDAO;
	private DicUsertypeDAO dicUsertypeDAO;
	private UsrContractDAO usrContractDAO;
	private NotifyQueueService notifyQueueService;

	@Override
	public Pager findUserContracts(UsrUser user, int pageSize, int pageNo) {
		return (Pager) this.usrContractDAO.findUserContracts(user.getId(), pageSize, pageNo);
	}


	@Override
	public Pager findUserContracts(int pageSize, int pageNo) {
		return (Pager) this.usrContractDAO.findUserContracts(pageSize, pageNo);
	}
	
	@Override
	public void saveOrUpdateUsrContract(UsrContract instance) {
		this.usrContractDAO.saveOrUpdate(instance);
	}


	@Override
	public UsrContract getUserContract(Integer id) {
		return this.usrContractDAO.get(id);
	}

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
		user.setViptype(Constants.USER_VIPTYPE_NONE);//未付费
		if(userType!=null){
			user.setType(userType);
		}else{
			user.setType(Constants.USER_TYPE_NULL);//类型未选择
		}
		usrUserDAO.save(user);
		return user.getId();
	}
	
	public RegisterUserSrModel addRegisterUser(UsrUser user, String ip){
		RegisterUserSrModel srModel = new RegisterUserSrModel();
		/**
		 * 保存用户信息
		 */
		if(usrUserDAO.isExistUsername(user.getUsername())){
			srModel.setMsg("注册失败：该用户名已被注册。");
			return srModel;
		}
		if(usrUserDAO.isExistMobile(user.getMobile(),null)){
			srModel.setMsg("注册失败：该手机号已被注册并验证。");
			return srModel;
		}
		if(usrUserDAO.isExistEmail(user.getEmail(),null)){
			srModel.setMsg("注册失败：该邮箱已被注册并验证。");
			return srModel;
		}
		UsrUser newUser = new UsrUser();
		newUser.setUsername(user.getUsername());
		newUser.setPassword(SecurityUtil.getMD5(user.getPassword()));
		newUser.setMobile(user.getMobile());
		newUser.setEmail(user.getEmail());
		newUser.setStatus(Constants.USER_STATUS_AVAILABLE);//正常用户
		Date now = Calendar.getInstance().getTime();
		newUser.setCreatedt(now);
		newUser.setUpdatedt(now);
		newUser.setRealname(user.getRealname());
		newUser.setGender(user.getGender());
		newUser.setActivetype(Constants.USER_ACTIVE_NONE);//未验证
		newUser.setAuditstatus(Constants.USER_AUDITSTATUS_NONE);//未审核
		newUser.setViptype(Constants.USER_VIPTYPE_NONE);//未付费
		if(user.getType()!=null){
			newUser.setType(user.getType());
		}else{
			newUser.setType(Constants.USER_TYPE_NULL);//类型未选择
		}
		int activeType = Integer.parseInt(PropertiesUtil.getByKey("activeType"));
		String activeCode = StringUtil.createActiveCode();
		newUser.setActivecode(activeType+"|"+activeCode);
		
		newUser.setReferenceId(user.getReferenceId());//合作伙伴ID
		usrUserDAO.save(newUser);
		/**
		 * 保存登陆日志
		 */
		
		UsrUser sessionUser = this.userLogin_tx(user.getUsername(), user.getPassword(), ip);
		
		/**
		 * 发送激活邮件
		 */
		if(activeType==1){//邮件验证
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("url", PropertiesUtil.getByKey("url"));
			map.put("realname", user.getRealname());
			if(user.getGender()==1){
				map.put("gender", "先生");
			}else{
				map.put("gender", "女士");
			}
			String v = new SecurityUtil().des_encrypt(newUser.getId()+"|"+activeType+"|"+activeCode);
			map.put("actionUrl", "Account!activate.act?v="+v);
			map.put("activeCode", activeCode);
			String body="";
			try {
				body = FreemarkerUtil.getContent("registerActive.htm", map, false, null, null);
			} catch (Exception e) {
				e.printStackTrace();
			}
			NtyMessageQueue message = new NtyMessageQueue();
			message.setTitle("注册验证邮件 - 中国资金网");
			message.setContent(body);
			message.setReceiver(user.getEmail());
			message.setType(Constants.NTYMESSAGEQUEUE_TYPE_EMAIL);
			notifyQueueService.addNewMessage(message);
		}else if(activeType==2){//TODO:手机验证
			
		}
		
		srModel.setUser(sessionUser);
		return srModel;
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
			int userTypeGroup = 0;
			if(user.getType()!=Constants.USER_TYPE_NULL){
				userTypeGroup = dicUsertypeDAO.get(user.getType().intValue()).getGroup();
			}
			//
			UsrUser suser = new UsrUser(user.getId(),user.getType(),user.getUsername(),user.getRealname(),user.getEmail(),user.getMobile(),user.getGender(),user.getStatus(),user.getActivetype(),user.getAuditstatus(),userTypeGroup,user.getAvatar(),user.getViptype(),null);
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
			if(user.getType()==0){
				user.setType(userType);
				user.setUpdatedt(Calendar.getInstance().getTime());
				usrUserDAO.update(user);
			}
			return user.getType();
		}else{
			return -1;
		}
		
	}
	
	@Override
	public int activeUser_tx(int uid, String activeType, String activecode) {
		UsrUser user = usrUserDAO.get(uid);
		if(user!=null){
			if(user.getActivetype()==Constants.USER_ACTIVE_NONE && user.getActivecode()!=null){
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
			}else{
				return 0;
			}
		}
		return -1;
	}
	
	@Override
	public int activeUser_tx(String username, String activecode) {
		UsrUser user = usrUserDAO.getByUsername(username);
		if(user!=null){
			if(user.getActivetype() != Constants.USER_ACTIVE_ALL && user.getActivecode()!=null){
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
			}else{
				return 0;
			}
		}
		return -1;
	}
	
	@Override
	public UsrUser getUserByUsername(String username) {
		return usrUserDAO.getByUsername(username);
	}
	
	@Override
	public Pager findUserByTodayReg(Integer pageNo,Integer pageSize){
		return usrUserDAO.findUserByTodayReg(pageNo,pageSize);
	}
	
	public Pager findByMutiCondition(String username,String realname,Short auditStatus,String userType,Integer pageNo,Integer pageSize,String email, String mobile, Date[] createdt, Date[] logindt){
		return usrUserDAO.findByMutiCondition(username,realname,auditStatus,userType,pageNo,pageSize,email,mobile,createdt,logindt);
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
	
	@Override
	public boolean isUserEmail(String email) {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser)context.getSession().get("_user");
		return usrUserDAO.isExistEmail(email,user.getId());
	}
	@Override
	public boolean isUserMobile(String mobile) {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser)context.getSession().get("_user");
		return usrUserDAO.isExistMobile(mobile,user.getId());
	}
	@Override
	public void updateUserAudit(Integer userId, Short audit) {
		UsrUser user = usrUserDAO.get(userId);
		if(user.getAuditstatus()==audit){
			return ;
		}
		user.setAuditstatus(audit);
		usrUserDAO.update(user);
	}
	@Override
	public void updateUserStatus(Integer userId, Short status) {
		UsrUser user = usrUserDAO.get(userId);
		user.setStatus(status);
		usrUserDAO.update(user);
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

	public void setUsrContractDAO(UsrContractDAO usrContractDAO) {
		this.usrContractDAO = usrContractDAO;
	}


	@Override
	public void updateUserVip(Integer userId, Integer Type) {
		UsrUser user = usrUserDAO.get(userId);
		user.setViptype(Type);
		usrUserDAO.update(user);
	}


	public void setNotifyQueueService(NotifyQueueService notifyQueueService) {
		this.notifyQueueService = notifyQueueService;
	}


}
