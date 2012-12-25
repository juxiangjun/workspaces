package com.zj198.dao.hibernate;

import java.util.Hashtable;

import com.zj198.dao.FundFileDAO;
import com.zj198.model.FundFile;
import com.zj198.util.Pager;

public class FundFileDAOImpl  extends HibernateDAO<FundFile, Integer> implements  FundFileDAO{

	@Override
	public Pager findFileByFundId(Integer id,Integer pageNo, Integer pageSize) {
		String hql="from FundFile as model where 1=1";
		Hashtable<String, Object> paramMap = new Hashtable<String, Object>();
		if(id!=null && id > 0){
			hql+=" and model.fundId=:id order by issuedDate desc";
			paramMap.put("id", id);
		}else{
			return null;
		}
		return pagedQuery(hql,pageNo,pageSize,paramMap);
	}

}
