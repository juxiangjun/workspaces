package com.zj198.dao.hibernate;

import java.util.Hashtable;

import com.zj198.dao.PnrFeeDAO;
import com.zj198.model.PnrFee;
import com.zj198.service.partner.model.FindPartnerFeeSpModel;
import com.zj198.util.Pager;

public class PnrFeeDAOImpl extends HibernateDAO<PnrFee, Integer> implements PnrFeeDAO{
	public Pager findPartnerFee(FindPartnerFeeSpModel spModel){
		StringBuffer hql = new StringBuffer();
		hql.append("select new com.zj198.model.PnrFee(m.userId, m.ordId, m.feeAmount,m.paymentStatus, m.paymentDate, m.createDt,m.status, t.applyNum)");
		hql.append("from PnrFee as m, OrdFinanceApply t, UsrUser t1 where m.ordId = t.id and m.userId=t1.id and t1.referenceId=:referenceId");
		Hashtable<String, Object> paramMap = new Hashtable<String, Object>();
		paramMap.put("referenceId", spModel.getPnrUserId());
		if(spModel.getStartDt() != null){
			hql.append(" and date(m.createDt) >= :appstartdt");
			paramMap.put("appstartdt", spModel.getStartDt());
		}
		if(spModel.getEndDt() != null){
			hql.append(" and date(m.createDt) <= :appenddt");
			paramMap.put("appenddt", spModel.getEndDt());
		}
		if(spModel.getPaymentStatus() != null){
			hql.append(" and m.paymentStatus = :paymentStatus");
			paramMap.put("paymentStatus", spModel.getPaymentStatus());
		}
		hql.append(" order by m.id desc");
		return pagedQuery(hql.toString(),spModel.getPager().getCurrentPage(),spModel.getPager().getPageCount(),paramMap);
	}
}
