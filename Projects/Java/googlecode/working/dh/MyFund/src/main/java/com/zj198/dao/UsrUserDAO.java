package com.zj198.dao;

import java.util.List;

import com.zj198.model.UsrUser;

public interface UsrUserDAO extends BaseDAO<UsrUser, Integer> {
	
	/**
	 * 检查是否存在此用户名的用户
	 * @param username
	 * @return 存在返回true，否则返回false
	 */
	public boolean isExistUsername(String username);
	/**
	 * 检查是否存在此手机的用户，除uid用户以外
	 * @param mobile
	 * @param uid
	 * @return 存在返回true，否则返回false
	 */
	public boolean isExistMobile(String mobile,Integer uid);
	
	/**
	 * 检查是否存在此email的用户，除uid用户以外
	 * @param email
	 * @param uid
	 * @return 存在返回true，否则返回false
	 */
	public boolean isExistEmail(String email,Integer uid);
	
	/**
	 * 根据用户名查找用户
	 * @param username
	 * @return 用户对象，找不到返回null
	 */
	public UsrUser getByUsername(String username);
	/**
	 * 根据用户类型获取用户清单
	 * @param type
	 * @return
	 */
	public List<UsrUser> findUserByType(Short type);
}
