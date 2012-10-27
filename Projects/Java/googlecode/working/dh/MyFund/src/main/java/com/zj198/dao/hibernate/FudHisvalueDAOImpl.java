package com.zj198.dao.hibernate;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.zj198.dao.FudHisvalueDAO;
import com.zj198.model.FudHisvalue;


public class FudHisvalueDAOImpl extends HibernateDAO<FudHisvalue, Integer> implements FudHisvalueDAO {

	/**Log4j*/
    private static final Logger log = LoggerFactory.getLogger(FudHisvalueDAOImpl.class);
    
	@SuppressWarnings("unchecked")
	@Override
	public List<FudHisvalue> findRecentlyList() {
		String hql = "select new com.zj198.model.FudHisvalue(model.id, model.fundcode, model.levelcode,model.unitvalue, model.accumulatvalue, model.dayincrease,model.day, model.totalvalue, Base.fundname) from FudHisvalue as model,FudBase as Base where Base.fundcode=model.fundcode and model.day = (select max(day) from FudHisvalue)";
		return this.findByHQL(hql, null);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<FudHisvalue> findByFundCode(String fundCode) {
		String hql = "select new com.zj198.model.FudHisvalue(model.id, model.fundcode, model.levelcode,model.unitvalue, model.accumulatvalue, model.dayincrease,model.day, model.totalvalue, Base.fundname) from FudHisvalue as model,FudBase as Base where Base.fundcode=model.fundcode and model.fundcode = :fundCode)";
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		params.put("fundCode", fundCode);
		return this.findByHQL(hql, params);
	}
	public Map<String, Object> findAllByFundCode(String fundCode, int pageSize,
			int pageNo){
		String hql = "select new com.zj198.model.FudHisvalue(model.id, model.fundcode, model.levelcode,model.unitvalue, model.accumulatvalue, model.dayincrease,model.day, model.totalvalue, Base.fundname) from FudHisvalue as model,FudBase as Base where Base.fundcode=model.fundcode and model.fundcode = :fundCode)";
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		params.put("fundCode", fundCode);
		return this.findByHqlOfMap(hql, params, pageSize, pageNo);
	}

	@Override
	public Map<String, Object> findRecentlyList(String typeName, int pageSize,
			int pageNo) {
		String hql = "select new com.zj198.model.FudHisvalue(model.id, model.fundcode, model.levelcode,model.unitvalue, model.accumulatvalue, model.dayincrease,model.day, model.totalvalue, Base.fundname) from FudHisvalue as model, FudBase as  Base where  Base.type= :type and Base.fundcode=model.fundcode and model.day = (select max(day) from FudHisvalue)";
		params.put("type", typeName);
		return this.findByHqlOfMap(hql, params, pageSize, pageNo);
	}

}
