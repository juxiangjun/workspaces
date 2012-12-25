package com.zj198.dao;

import java.util.List;

import com.zj198.model.OrdCheckRecord;

public interface OrdCheckRecordDAO extends BaseDAO<OrdCheckRecord, Integer> {

	public List<OrdCheckRecord> findSelf();

	public List<OrdCheckRecord> findAsk();

	public List<OrdCheckRecord> findpSelf();

	public List<OrdCheckRecord> findpAsk();
}
