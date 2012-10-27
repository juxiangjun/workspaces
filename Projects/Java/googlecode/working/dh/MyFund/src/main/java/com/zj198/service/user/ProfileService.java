package com.zj198.service.user;

import com.zj198.model.UsrLoginhistory;


public interface ProfileService {
	
	/**
	 * 保存用户的profile, 自动根据当前登录的用户的类型保存到不同表
	 * @param profile
	 */
	public void saveorupdate(Object profile);
	
	/**
	 * 获取用户的profile
	 * @param uid
	 * @return Object类型, 使用前自行造型
	 */
	public Object getProfiles(Integer uid);
	
	/**
	 * 根据用户的类型type获取用户组类型id
	 * @param userType
	 * @return 组类型（个人，银行，金融机构，服务机构，企业）
	 */
	public int getGroupidByUserType(Short userType);
	
	/**
	 * 获取用户登录最后一次记录
	 * @param uid
	 * @return
	 */
	public UsrLoginhistory getLoginHistory();
}
