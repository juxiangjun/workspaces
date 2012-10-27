package com.zj198.dao.hibernate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;

import com.zj198.dao.OrdFinanceProductDAO;
import com.zj198.model.OrdFinanceProduct;
import com.zj198.model.OrdLoanRequest;
import com.zj198.util.GetConditionsUtil;
import com.zj198.util.Pagination;

/**
 * 
 * @author zeroleavebaoyang@gmail.com
 * @since 2012-7-2|下午4:32:33
 */
public class OrdFinanceProductDAOImpl extends HibernateDAO<OrdFinanceProduct, Integer> implements OrdFinanceProductDAO {

	@SuppressWarnings("unchecked")
	public Map<String, Object> findByCondition(OrdFinanceProduct obj, int pageSize, int pageNo) {

		Map<String, Object> pagtion = new HashMap<String, Object>();
		pageNo = pageNo <= 0 ? 1 : pageNo;
		int startIndex = (pageNo - 1) * pageSize;

		StringBuffer sb = new StringBuffer("from OrdFinanceProduct as model where 1=1");
		StringBuffer sbCount = new StringBuffer("select count (*) from OrdFinanceProduct as model where 1=1");
		Map<Object, Object[]> condition = GetConditionsUtil.conditions(obj);
		Query q;
		List<OrdLoanRequest> list;
		List<Long> nums = null;
		int count = 0;
		if (condition.isEmpty()) {
			q = this.getSession().createQuery(sb.toString()).setFirstResult(startIndex).setMaxResults(pageSize);
			list = q.list();
			q = this.getSession().createQuery(sbCount.toString());
			nums = q.list();
		} else {
			Object[] names = condition.get("name");
			Object[] values = condition.get("value");
			for (int i = 0; i < names.length; i++) {
				if ("financeLittleamount".equals(names[i])) {
					sb.append(" and model.").append(names[i]).append(" < :").append(names[i]);
					sbCount.append(" and model.").append(names[i]).append(" < :").append(names[i]);
				} else if ("financeBigamount".equals(names[i])) {
					sb.append(" and model.").append(names[i]).append(" > :").append(names[i]);
					sbCount.append(" and model.").append(names[i]).append(" > :").append(names[i]);
				}else if ("financeLittledt".equals(names[i])) {
					sb.append(" and model.").append(names[i]).append(" < :").append(names[i]);
					sbCount.append(" and model.").append(names[i]).append(" < :").append(names[i]);
				}else if ("financeMostdt".equals(names[i])) {
					sb.append(" and model.").append(names[i]).append(" > :").append(names[i]);
					sbCount.append(" and model.").append(names[i]).append(" > :").append(names[i]);
				} else {
					sb.append(" and model.").append(names[i]).append(" = :").append(names[i]);
					sbCount.append(" and model.").append(names[i]).append(" = :").append(names[i]);
				}
			}
			System.out.println(sb.toString());
			System.out.println(sbCount.toString());
			q = this.getSession().createQuery(sb.toString()).setFirstResult(startIndex).setMaxResults(pageSize);
			if (values != null && values.length > 0) {
				for (int i = 0; i < values.length; i++) {
					q.setParameter((String) names[i], values[i]);
				}
			}
			list = q.list();
			q = this.getSession().createQuery(sbCount.toString());
			if (values != null && values.length > 0) {
				for (int i = 0; i < values.length; i++) {
					q.setParameter((String) names[i], values[i]);
				}
			}
			nums = q.list();
		}
		if (nums != null) {
			Long records = (Long) nums.get(0);
			count = records.intValue();
		}
	
		Pagination p = new Pagination(count, pageSize, pageNo);
		pagtion.put("list", list);
		pagtion.put("pagination", p);
		return pagtion;
	}

}
