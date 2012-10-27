package com.zj198.dao.hibernate;

import java.util.List;

import org.hibernate.Query;

import com.zj198.dao.UsrUserDAO;
import com.zj198.model.UsrUser;

public class UsrUserDAOImpl extends HibernateDAO<UsrUser, Integer> implements UsrUserDAO{

	/**
	 * @comments:
	 * 1. 是否可以以用户注册的电子邮件作为用户账号，用户名字就可以由用户自己定义，允许重名.
	 * 2. 建议DAO层只处理数据的读写，不涉及到业务逻辑的判断。如要判断某一个电话是否被注册，
	 * 	DAO层只需要根据电话号码进行查询，并返回一个LIST给业务层，业务层去判断List的Size是否大于0.
	 */
	@Override
	public boolean isExistUsername(String username) {
		String hql="from UsrUser as model where model.username=:username";
		Query query = this.getSession().createQuery(hql);
		query.setParameter("username", username);
		return query.list().size()>0;
	}

	@Override
	public boolean isExistMobile(String mobile, Integer uid) {
		String hql="from UsrUser as model where model.mobile=:mobile";
		if(uid!=null){
			hql+=" and model.id!="+uid;
		}
		Query query = this.getSession().createQuery(hql);
		query.setParameter("mobile", mobile);
		
		return query.list().size()>0;
	}

	@Override
	public boolean isExistEmail(String email, Integer uid) {
		String hql="from UsrUser as model where model.email=:email";
		if(uid!=null){
			hql+=" and model.id!="+uid;
		}
		Query query = this.getSession().createQuery(hql);
		query.setParameter("email", email);
		
		return query.list().size()>0;
	}

	@Override
	public UsrUser getByUsername(String username) {
		String hql="from UsrUser as model where model.username=:username";
		Query query = this.getSession().createQuery(hql);
		query.setParameter("username", username);
		List<UsrUser> userList = query.list();
		if(userList.size()==1){
			return userList.get(0);
		}
		return null;
	}
	public List<UsrUser> findUserByType(Short type){
		String hql="from UsrUser as model where model.status=0 and model.type=:type";
		Query query = this.getSession().createQuery(hql);
		query.setParameter("type", type);
		List<UsrUser> userList = query.list();
		return userList;
	}
}
