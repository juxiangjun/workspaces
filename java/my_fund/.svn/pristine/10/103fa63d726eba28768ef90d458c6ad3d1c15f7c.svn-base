package com.zj198.dao.hibernate;

import java.util.Date;
import java.util.Hashtable;

import org.springframework.util.StringUtils;

import com.zj198.dao.FundDAO;
import com.zj198.model.Fund;
import com.zj198.util.Pager;

public class FundDAOImpl  extends HibernateDAO<Fund, Integer> implements  FundDAO{

	@Override
	public Pager findFundAll(String catelogName, String companyName, String fundCode, String fullName,Date[] issuedDt,Integer pageSize, Integer pageNo,String status,Integer recommendation) {
		String hql = "from Fund as model where 1=1";
		Hashtable<String, Object> paramMap = new Hashtable<String, Object>();
		if(StringUtils.hasText(catelogName)){
			hql+=" and model.catelogName like :catelogName";
			paramMap.put("catelogName", "%"+catelogName+"%");
		}
		if(StringUtils.hasText(companyName)){
			hql+=" and model.fundCompanyName like :companyName";
			paramMap.put("companyName", "%"+companyName+"%");
		}
		if(StringUtils.hasText(fundCode)){
			hql+=" and model.code like :fundCode";
			paramMap.put("fundCode",fundCode);
		}
		if(StringUtils.hasText(fullName)){
			hql+=" and model.fullName like :fullName";
			paramMap.put("fullName", "%"+fullName+"%");
		}
//		if (issuedDt != null && issuedDt.length > 0){
//			Date j0 = issuedDt[0];
//			Date j1 = issuedDt[1];
//			if (j0 != null && j1 != null) {
//				hql = hql + " and date(model.issuedDate) >= :j0 and date(model.issuedDate) <= :j1";
//				paramMap.put("j0", j0);
//				paramMap.put("j1", j1);
//			}
//		}
		if(StringUtils.hasText(status)){
//			Integer[] fundStatus=StringUtil.getArrayByStr(status);
//			for(Integer fs:fundStatus){
//				System.out.println(fs);
//			}
			hql+=" and model.status =:status ";
			paramMap.put("status", status);
		}
//		else{
//			hql+=" and model.status =1 ";
//		}
		if(recommendation !=null && recommendation.intValue() >-1){
			if(recommendation.intValue() == 0){
				hql = hql + " and model.id not in (select prodId from PrdRecommendation where typeId=3) ";
			} else {
				if (recommendation.intValue() == 2) {
					recommendation = 0;
				}
				hql = hql + " and model.id in (select prodId from PrdRecommendation where typeId=3 and status = :recommendation) ";
				paramMap.put("recommendation", recommendation);
			}
		}
		hql+=" order by lastUpdatedTime desc";
		return pagedQuery(hql,pageNo,pageSize,paramMap);
	}

//	@Override
//	public List<Fund> findFundAll(Integer compId) {
//		String hql = "from Fund as model where model.fundCompanyId =:compId";
//		return list(hql,"compId",compId);
//	}

}
