package com.zj198.service.loan.impl;

import java.util.List;

import com.zj198.dao.OrdCheckRecordDAO;
import com.zj198.model.OrdCheckRecord;
import com.zj198.service.loan.OrdCheckRecordService;

public class OrdCheckRecordServiceImpl implements OrdCheckRecordService {
	private OrdCheckRecordDAO ordCheckRecordDAO;
	

	public void setOrdCheckRecordDAO(OrdCheckRecordDAO ordCheckRecordDAO) {
		this.ordCheckRecordDAO = ordCheckRecordDAO;
	}

	public List<OrdCheckRecord> getSelfRecord() {
		return ordCheckRecordDAO.findSelf();
	}

	public List<OrdCheckRecord> getAskRecord() {
		return ordCheckRecordDAO.findAsk();
	}

	public List<OrdCheckRecord> getSelfpRecord() {
		return ordCheckRecordDAO.findpSelf();
	}

	public List<OrdCheckRecord> getAskpRecord() {
		return ordCheckRecordDAO.findpAsk();
	}

}
