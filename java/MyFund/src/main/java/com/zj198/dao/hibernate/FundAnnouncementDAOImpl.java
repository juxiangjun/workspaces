package com.zj198.dao.hibernate;

import java.util.Hashtable;

import com.zj198.dao.FundAnnouncementDAO;
import com.zj198.model.FundAnnouncement;
import com.zj198.util.Pager;

public class FundAnnouncementDAOImpl  extends HibernateDAO<FundAnnouncement, Integer> implements  FundAnnouncementDAO{

	@Override
	public Pager findAnnByFundId(Integer id,Integer pageNo, Integer pageSize) {
		String hql="from FundAnnouncement as model where 1=1";
		Hashtable<String, Object> paramMap = new Hashtable<String, Object>();
		if(id!=null && id > 0){
			hql+=" and model.fundId=:id order by issuedDate desc";
			paramMap.put("id", id);
		}else{
			return null;
		}
		return pagedQuery(hql,pageNo,pageSize,paramMap);
	}

/*	@Override
	public List<FundAnnouncement> findAnnByCompId(Integer id) {
		String hql="from FundAnnouncement as model where model.fundId=:id";
		return list(hql,"id",id);
	}*/
}
