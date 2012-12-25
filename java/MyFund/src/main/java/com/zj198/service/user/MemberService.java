package com.zj198.service.user;

import java.util.Date;
import java.util.List;

import com.zj198.model.OrdMembership;
import com.zj198.model.UsrMemberPeroid;
import com.zj198.model.UsrUser;
import com.zj198.util.Pager;


public interface MemberService {
	
	/***增加用户的付款信息*/
	public void saveOrUpdateOrdMP(OrdMembership ordMembership);
	
	/***增加会员信息*/
	public void saveUsrMP(UsrMemberPeroid usrMemberPeroid);
	
//	/*** 更新订单列表*/
//	public void updateOrdMP(OrdMembership ordMembership);
	
	/*** 根据id更改付款信息状态* @para*/
	public void updateOrdMPStatus(Integer id,Integer status);
	
	/*** 根据id删除付款信息* @param id*/
	public void deleteOrdMPByIdUid(Integer id,Integer uid);
	
	/*** 根据id查询付款信息* @param id*/
	public OrdMembership getOrdMPById(Integer id);
	
	/***userid 查询用户 会员类型付款信息* @param id*/
	public OrdMembership getOrdMPByUsrid(Integer userid);
	
	/*** 根据订单编号查询付款信息* @param num*/
	public OrdMembership getOrdMPByOrdNum(String num);
	
	/*** 根据用户id查询所有付款信息---列表* @param userid*/
	public List<OrdMembership> findOrdMPByUserid(Integer userid);
	
	/*** 管理员取所有用户的订单信息---列表*/
	public Pager findAllOrdMP(String ordNum,String username,Integer iscancelled,Integer payStatus,Integer memberType,Date[] startdt,Date[] createdt,Integer pageNo, Integer pageSize);
	
	/*** 管理员取所有会员信息---列表*/
	public Pager findAllUsrMP(String ordNum,String username,Integer status,Integer memberType,Date[] startdt,Date[] createdt,Integer pageNo, Integer pageSize);
	
	/*** 管理员取会员信息最后一条 有返回最后一条信息  没有则为null---列表*/
	public UsrMemberPeroid getUsrMP(Integer userid);
	
	/*** 用于用户升级vip时作废其它会员信息* @para*/
	public void updateUsrMPStatus(Integer id,Integer status);
	
	/*** 管理员根据id取会员详细信息 没有则为null---*/
	public UsrMemberPeroid getUsrMPById(Integer id);
	
	/*** 用户发票的寄信地址---*/
	public OrdMembership voluationOrdByUser(UsrUser user,OrdMembership member);
	
	/*** 用户非过期*用于认证会员升级vip会员 @param userid* @return*/
	public List<UsrMemberPeroid> findUsrMP(Integer userid);
}
