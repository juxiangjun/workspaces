package com.zj198.service.loan;

import java.util.List;

import com.zj198.model.OrdCheckRecord;

public interface OrdCheckRecordService {

	public List<OrdCheckRecord> getSelfRecord();

	public List<OrdCheckRecord> getAskRecord();

	public List<OrdCheckRecord> getSelfpRecord();

	public List<OrdCheckRecord> getAskpRecord();
}
