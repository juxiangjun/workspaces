package com.zj198.service.user.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.zj198.dao.OrdMemberShipDAO;
import com.zj198.dao.UsrMemberPeroidDAO;
import com.zj198.model.OrdMembership;
import com.zj198.model.UsrCompany;
import com.zj198.model.UsrMemberPeroid;
import com.zj198.model.UsrPerson;
import com.zj198.model.UsrUser;
import com.zj198.service.user.MemberService;
import com.zj198.service.user.ProfileService;
import com.zj198.util.Constants;
import com.zj198.util.OrderNOCreator;
import com.zj198.util.Pager;

public class MemberServiceImpl implements MemberService {
	private OrdMemberShipDAO ordMemberShipDAO;
	private UsrMemberPeroidDAO usrMemberPeroidDAO;
	private ProfileService profileService;

	public UsrMemberPeroidDAO getUsrMemberPeroidDAO() {
		return usrMemberPeroidDAO;
	}
	public void setUsrMemberPeroidDAO(UsrMemberPeroidDAO usrMemberPeroidDAO) {
		this.usrMemberPeroidDAO = usrMemberPeroidDAO;
	}
	public OrdMemberShipDAO getOrdMemberShipDAO() {
		return ordMemberShipDAO;
	}
	public void setOrdMemberShipDAO(OrdMemberShipDAO ordMemberShipDAO) {
		this.ordMemberShipDAO = ordMemberShipDAO;
	}
	
	
	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}
	@Override
	public void saveOrUpdateOrdMP(OrdMembership ordMembership) {
		if(ordMembership.getId() == null){
			ordMembership.setIscancelled(0);
			ordMembership.setPayStatus(Constants.USER_VIPTYPE_PAYSTATUS_OFF);
			ordMembership.setCreateTime(Calendar.getInstance().getTime());
			ordMemberShipDAO.save(ordMembership);
			ordMembership.setOrdNum(OrderNOCreator.userFeeOrderNO(ordMembership.getId()));
			ordMemberShipDAO.update(ordMembership);
		}else{
			ordMembership.setCreateTime(Calendar.getInstance().getTime());
			ordMemberShipDAO.update(ordMembership);
		}
	}
//	@Override
//	public void updateOrdMP(OrdMembership ordMembership) {
//		ordMembership.setCreateTime(Calendar.getInstance().getTime());
//		ordMemberShipDAO.update(ordMembership);
//	}
	@Override
	public void deleteOrdMPByIdUid(Integer id,Integer uid) {
		OrdMembership order = ordMemberShipDAO.get(id);
		if(order.getUserId()-uid==0){
			order.setIscancelled(Constants.USER_VIPTYPE_ISCANCELLED_OFF);
			ordMemberShipDAO.update(order);
		}
	}
	@Override
	public OrdMembership getOrdMPById(Integer id) {
		return ordMemberShipDAO.get(id);
	}
	@Override
	public List<OrdMembership> findOrdMPByUserid(Integer userid) {
		return ordMemberShipDAO.findOrdMSByUserid(userid);
	}
	@Override
	public Pager findAllOrdMP(String ordNum,String username,Integer iscancelled,Integer ordStatus,Integer memberType,Date[] startdt,Date[] createdt,Integer pageNo, Integer pageSize) {
		return ordMemberShipDAO.findAllOrdMS(ordNum, username, iscancelled,ordStatus, memberType, startdt, createdt, pageNo, pageSize);
	}
	@Override
	public Pager findAllUsrMP(String ordNum,String username,Integer status,Integer memberType,Date[] startdt,Date[] createdt,Integer pageNo, Integer pageSize) {
		return usrMemberPeroidDAO.findAllUsrMP(ordNum, username, status, memberType, startdt, createdt, pageNo, pageSize);
	}
	@Override
	public void updateOrdMPStatus(Integer id, Integer status) {
		OrdMembership ordMembership = ordMemberShipDAO.get(id);
		if(ordMembership.getUserId().equals("")){
			
		}
		ordMembership.setPayStatus(status);
		ordMemberShipDAO.update(ordMembership);
	}
	@Override
	public void saveUsrMP(UsrMemberPeroid usrMemberPeroid) {
		
		usrMemberPeroidDAO.save(usrMemberPeroid);
	}
	@Override
	public UsrMemberPeroid getUsrMP(Integer userid) {
		return usrMemberPeroidDAO.getUsrMP(userid);
	}
	@Override
	public UsrMemberPeroid getUsrMPById(Integer id) {
		return usrMemberPeroidDAO.get(id);
	}
	@Override
	public OrdMembership voluationOrdByUser(UsrUser user, OrdMembership member) {
		int groupid = user.getUserTypeGroup();
		switch (groupid){
			case Constants.USERTYPE_GROUP_PERSONAL:
				UsrPerson usrPerson = (UsrPerson)profileService.getProfiles(user.getId());
				member.setProvinceid(usrPerson.getProvinceid());
				member.setCityid(usrPerson.getCityid());
				member.setDistrictid(usrPerson.getDistrictid());
//				member.setPostcode(usrPerson.getPostcode());
				member.setInvoiceReceiver(user.getRealname());
				member.setAddress(usrPerson.getAddress());
				member.setTelphone(user.getMobile());
				break;
			case Constants.USERTYPE_GROUP_COMPANY:
				UsrCompany usrCompany= (UsrCompany)profileService.getProfiles(user.getId());
				member.setProvinceid(usrCompany.getBizprovinceid());
				member.setCityid(usrCompany.getBizcityid());
				member.setDistrictid(usrCompany.getBizdistrictid());
				member.setAddress(usrCompany.getBizaddress());
//				member.setPostcode(usrCompany.getBizpostcode());
				member.setInvoiceReceiver(usrCompany.getLinkname());
				member.setTelphone(usrCompany.getLinktelephone());
				break;
			default:
				return null;
		}
		return member;
	}
	
	@Override
	public OrdMembership getOrdMPByOrdNum(String num) {
		return ordMemberShipDAO.getOrdMSByOrdNum(num);
	}
	@Override
	public OrdMembership getOrdMPByUsrid(Integer userid) {
		return this.ordMemberShipDAO.getOrdMPByUsrid(userid);
	}
	@Override
	public List<UsrMemberPeroid> findUsrMP(Integer userid) {
		return this.usrMemberPeroidDAO.findUsrMP(userid);
	}
	@Override
	public void updateUsrMPStatus(Integer id, Integer status) {
		UsrMemberPeroid member=this.usrMemberPeroidDAO.get(id);
		member.setStatus(status);
		this.usrMemberPeroidDAO.update(member);
		
	}
	
}
