package com.zj198.dao.hibernate;

import java.util.List;

import org.hibernate.Query;

import com.zj198.dao.OrdLrRecommendDao;
import com.zj198.model.OrdLrRecommend;
import com.zj198.util.Constants;

/**
 * 推荐产品
 * 
 * @author zeroleavebaoyang@gmail.com
 * @time 2012-7-18| 下午3:59:32
 */
@SuppressWarnings("unchecked")
public class OrdLrRecommendDaoImpl extends HibernateDAO<OrdLrRecommend, Integer> implements OrdLrRecommendDao {


	public List<Integer> getByRequestId(Integer id, Integer recommendType) {
		String hql = "select o.financeId from OrdLrRecommend o where o.requestId = :requestId and o.recommendType = :recommendType";
		Query q = getQuery(hql,"requestId", id,"recommendType", recommendType);
		List<Integer> proIds = q.list();
		return proIds;
	}
	public List<Integer> getRequestByOrg(Integer id, Integer orgId) {
		String hql = "select o.financeId from OrdLrRecommend o where o.requestId = :requestId and o.recommendType = :recommendType and o.createUserId=:orgId";
		Query q = getQuery(hql,"requestId", id,"recommendType", Constants.ORD_LOAN_RECOMMEND_TYPE_BANK,"orgId",orgId);
		List<Integer> proIds = q.list();
		return proIds;
	}

	public List<OrdLrRecommend> getByRequestAdminID(Integer id) {
		String hql = "from OrdLrRecommend o where o.recommendType = 1 and o.requestId = :requestId";

		return list(hql,"requestId", id);
	}

	public List<OrdLrRecommend> getByRequestLoanID(Integer id) {
		String hql = "from OrdLrRecommend o where o.recommendType = 0 and o.requestId = :requestId";

		return list(hql, "requestId", id);
	}

}
