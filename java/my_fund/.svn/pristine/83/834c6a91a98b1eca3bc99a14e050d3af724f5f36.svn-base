package com.zj198.dao.hibernate;

import java.util.Date;
import java.util.Hashtable;
import java.util.List;

import org.springframework.util.StringUtils;

import com.zj198.dao.OrdMemberShipDAO;
import com.zj198.model.OrdMembership;
import com.zj198.util.Pager;

public class OrdMemberShipDAOImpl  extends HibernateDAO<OrdMembership, Integer> implements  OrdMemberShipDAO{

	@Override
	public List<OrdMembership> findOrdMSByUserid(Integer userid) {
		String hql="from OrdMembership as model where model.userId=:userid and model.iscancelled = 0 order by model.createTime desc";
		return list(hql,"userid", userid);
	}
	
	@Override
	public OrdMembership getOrdMPByUsrid(Integer userid) {
		String hql="from OrdMembership as model where model.userId=:userid and model.iscancelled = 0";
		List<OrdMembership> lists=list(hql,"userid", userid);
		if(lists.size() >= 1){
			return lists.get(0);
		}
		return null;
	}
	
	/**
	 *  
	 * @return
		@Override
	 */
	public Pager findAllOrdMS(String ordNum,String username,Integer iscancelled,Integer ordStatus,Integer memberType,Date[] startdt,Date[] createdt,Integer pageNo, Integer pageSize) {
		String hql = "select new com.zj198.model.OrdMembership(o.id, o.userId, o.payAmount,o.memberType,o.invoiceType,o.invoiceSendway,o.payStatus, o.payWay, o.payTime, o.createTime,o.iscancelled,o.ordNum, u.username)from OrdMembership as o,UsrUser as u where o.userId=u.id";
		Hashtable<String, Object> paramMap = new Hashtable<String, Object>();
		if(StringUtils.hasText(ordNum)){
			hql+=" and o.ordNum like :num";
			paramMap.put("num", ordNum);
		}
		if(StringUtils.hasText(username)){
			hql+=" and u.username like :username";
			paramMap.put("username", username);
		}
		if(iscancelled!=null && iscancelled!=-1){
			hql+=" and o.iscancelled=:iscancelled";
			paramMap.put("iscancelled", iscancelled);
		}
		if(ordStatus!=null && ordStatus!=-1){
			hql+=" and o.payStatus=:payStatus";
			paramMap.put("payStatus", ordStatus);
		}
		if(memberType!=null && memberType!=-1){
			hql+=" and o.memberType=:memberType";
			paramMap.put("memberType", memberType);
		}
		/*
		if (startdt != null && startdt.length > 0){
			Date j0 = startdt[0];
			Date j1 = startdt[1];
			if (j0 != null && j1 != null) {
				hql = hql + " and date(u.memberStart) >= :j0 and date(u.memberStart) <= :j1";
				paramMap.put("j0", j0);
				paramMap.put("j1", j1);
			}
		}
		if (createdt != null && createdt.length > 0){
			Date j0 = createdt[0];
			Date j1 = createdt[1];
			if (j0 != null && j1 != null) {
				hql = hql + " and date(u.createTime) >= :j0 and date(u.createTime) <= :j1";
				paramMap.put("j0", j0);
				paramMap.put("j1", j1);
			}
		}
		*/
		return  pagedQuery(hql+=" order by o.createTime desc",pageNo,pageSize,paramMap);
	}
	@Override
	public OrdMembership getOrdMSByOrdNum(String num) {
		String hql = "select new com.zj198.model.OrdMembership(o.id, o.userId, o.payAmount,o.memberType,o.invoiceType,o.invoiceSendway,o.payStatus, o.payWay, o.payTime, o.createTime,o.iscancelled,o.ordNum, u.username)from OrdMembership as o,UsrUser as u where o.userId=u.id and o.ordNum like :num";
		List<OrdMembership> lists=list(hql,"num",num);
		if(lists.size()==1){
			return lists.get(0);
		}
		return null;
	}

}
