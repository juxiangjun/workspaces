package com.zj198.service.user;

import com.zj198.model.UsrUser;

public interface AccountService {
	/**
	 * 新增用户
	 * @param username
	 * @param password
	 * @param mobile
	 * @param email
	 * @param gender
	 * @param realname
	 * @param activeCode
	 * @return 成功返回用户id 用户名重复-1 手机号重复-2 email重复-3
	 */
	public int addUser(String username,String password,String mobile,String email,String realname,Short gender,String activeCode,Short userType);
	
	/**
	 * 用户登录，成功则记录登录历史
	 * @param username
	 * @param password
	 * @param ip
	 * @return 返回简单用户对象，登录失败返回null
	 */
	public UsrUser userLogin_tx(String username,String password,String ip);
	
	/**
	 * 更新用户类型，仅用于用户类型未确定初次选择类型，判断传入类型为枚举之一
	 * @param userId
	 * @param userType
	 * @return 成功为0，未更新-1
	 */
	public int updateUserType(Integer userId, Short userType);
	
	/**
	 * 用户激活
	 * @param uid
	 * @param activeType
	 * @param activecode
	 * @return 成功返回用户id，失败返回-1
	 */
	public int activeUser_tx(int uid, String activeType,String activecode);
	
	/**
	 * 用户激活
	 * @param username
	 * @param activecode
	 * @return 成功返回用户id，失败返回-1
	 */
	public int activeUser_tx(String username, String activecode);
	
	
	/**
	 * 根据用户账号找用户对象
	 * @param username
	 * @return 找到返回对象，没找到返回null
	 */	
	public UsrUser getUserByUsername(String username);
	
	/**
	 * 根据用户id找用户对象
	 * @param uid
	 * @return 找到返回对象，没找到返回null
	 */	
	public UsrUser getUserById(Integer uid);
	
	/**
	 * 更新用户，注意如果用户登录了，需要同时更新session
	 * @param user
	 * @return 成功为大于0，未更新-1
	 */
	public int updateUser(UsrUser user);

}
