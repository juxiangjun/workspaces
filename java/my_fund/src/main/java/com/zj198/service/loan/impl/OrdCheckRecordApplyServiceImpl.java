package com.zj198.service.loan.impl;

import java.util.ArrayList;
import java.util.List;

import com.zj198.dao.OrdCheckRecordApplyDAO;
import com.zj198.dao.OrdCheckRecordDAO;
import com.zj198.model.OrdCheckRecordApply;
import com.zj198.service.loan.OrdCheckRecordApplyService;

public class OrdCheckRecordApplyServiceImpl implements OrdCheckRecordApplyService {

	private OrdCheckRecordApplyDAO ordCheckRecordApplyDAO;
	private OrdCheckRecordDAO ordCheckRecordDAO;

	
	public void setOrdCheckRecordDAO(OrdCheckRecordDAO ordCheckRecordDAO) {
		this.ordCheckRecordDAO = ordCheckRecordDAO;
	}

	public void setOrdCheckRecordApplyDAO(OrdCheckRecordApplyDAO ordCheckRecordApplyDAO) {
		this.ordCheckRecordApplyDAO = ordCheckRecordApplyDAO;
	}

	public void saveOrUpdateRecordAly(OrdCheckRecordApply record) {
		ordCheckRecordApplyDAO.saveOrUpdate(record);
	}

	public OrdCheckRecordApply getByAppIdAndId(Integer appId,Integer id) {
		return ordCheckRecordApplyDAO.getByAppIdAndId(appId, id);
	}

	public List<OrdCheckRecordApply> getByAppIdAndTpid(Integer appId, Integer typeid) {
		List<OrdCheckRecordApply> l = null;
		List<OrdCheckRecordApply> s = ordCheckRecordApplyDAO.getByAppIdAndTypeid(appId, typeid);
		if(s != null && s.size() > 0){
			l = new ArrayList<OrdCheckRecordApply>();
			for(OrdCheckRecordApply j : s){
				j.setTitle(ordCheckRecordDAO.get(j.getCrId()).getTitle());
				l.add(j);
			}
		}
		return l;
	}
}
