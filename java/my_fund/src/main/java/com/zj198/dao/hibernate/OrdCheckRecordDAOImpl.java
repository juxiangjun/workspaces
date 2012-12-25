package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.OrdCheckRecordDAO;
import com.zj198.model.OrdCheckRecord;

public class OrdCheckRecordDAOImpl extends HibernateDAO<OrdCheckRecord, Integer> implements OrdCheckRecordDAO {

	public List<OrdCheckRecord> findSelf() {
		return this.list("from OrdCheckRecord where type = 0 order by recordNo asc");
	}
	
	public List<OrdCheckRecord> findAsk() {
		return this.list("from OrdCheckRecord where type = 1 order by recordNo asc");
	}
	
	public List<OrdCheckRecord> findpSelf() {
		return this.list("from OrdCheckRecord where type = 2 order by recordNo asc");
	}
	
	public List<OrdCheckRecord> findpAsk() {
		return this.list("from OrdCheckRecord where type = 3 order by recordNo asc");
	}
}
