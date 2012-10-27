package com.zj198.dao.hibernate;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;

import com.zj198.dao.OrdLoanRequestDAO;
import com.zj198.model.OrdLoanRequest;
import com.zj198.util.GetConditionsUtil;
import com.zj198.util.Pagination;

/**
 * @author paul Description: CreateAuthor:paul CreateDate:2012-6-26 14:34:04
 * @modify: zeroleavebaoyang@gmail.com
 * @modifytime: 2012-6-28 13:21:23
 */
public class OrdLoanRequestDAOImpl extends HibernateDAO<OrdLoanRequest, Integer> implements OrdLoanRequestDAO {

	@SuppressWarnings("unchecked")
	public List<OrdLoanRequest> getByUserId(Integer userId) {
		Query q = this.getSession().createQuery("from OrdLoanRequest as m where m.userId : userId");
		q.setParameter("userId", userId);
		return q.list();
	}

	public Map<String, Object> getPagationList(String url, int userId, int pageSize, int pageNo) {
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		params.put("userId", userId);
		return this.findByHqlOfMap(url, params, pageSize, pageNo);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> getByObjCondition(OrdLoanRequest obj, Map<String, Map<String, Object>> map, int pageSize, int pageNo) {

		Map<String, Object> pagtion = new HashMap<String, Object>();
		pageNo = pageNo <= 0 ? 1 : pageNo;
		int startIndex = (pageNo - 1) * pageSize;

		StringBuffer sb = new StringBuffer("from OrdLoanRequest as model where 1=1");
		StringBuffer sbCount = new StringBuffer("select count (*) from OrdLoanRequest as model where 1=1");
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
				Set<String> key = map.keySet();
				boolean j = true;
				for (Iterator<String> it = key.iterator(); it.hasNext();) {
					String s = (String) it.next();
					if (names[i] == s) {
						j = false;
						break;
					}
				}
				if (!j) {
					continue;
				}
				sb.append(" and model.").append(names[i]).append(" = :").append(names[i]);
				sbCount.append(" and model.").append(names[i]).append(" = :").append(names[i]);
			}
			if (map != null && !"".equals(map)) {
				Set<String> key = map.keySet();
				for (Iterator<String> it = key.iterator(); it.hasNext();) {
					String s = (String) it.next();
					sb.append(" and model.").append(s).append(" between :");
					sbCount.append(" and model.").append(s).append(" between :");
					Set<String> keys = map.get(s).keySet();
					for (Iterator<String> ite = keys.iterator(); ite.hasNext();) {
						String t = (String) ite.next();
						sb.append(t).append(" and :");
						sbCount.append(t).append(" and :");
					}
					sb.delete(sb.length() - 6, sb.length());
					sbCount.delete(sbCount.length() - 6, sbCount.length());
				}
			}
			System.out.println(sb.toString());
			q = this.getSession().createQuery(sb.toString()).setFirstResult(startIndex).setMaxResults(pageSize);
			if (values != null && values.length > 0) {
				for (int i = 0; i < values.length; i++) {
					q.setParameter((String) names[i], values[i]);
				}
			}
			if (map != null && !"".equals(map)) {
				Set<String> key = map.keySet();
				for (Iterator<String> it = key.iterator(); it.hasNext();) {
					String s = (String) it.next();
					Map<String, Object> mp = map.get(s);
					Set<String> keys = mp.keySet();
					for (Iterator<String> ite = keys.iterator(); ite.hasNext();) {
						String t = (String) ite.next();
						q.setParameter(t, mp.get(t));
					}
				}
			}
			list = q.list();
			System.out.println(sbCount.toString());
			q = this.getSession().createQuery(sbCount.toString());
			if (values != null && values.length > 0) {
				for (int i = 0; i < values.length; i++) {
					q.setParameter((String) names[i], values[i]);
				}
			}
			if (map != null && !"".equals(map)) {
				Set<String> key = map.keySet();
				for (Iterator<String> it = key.iterator(); it.hasNext();) {
					String s = (String) it.next();
					Map<String, Object> mp = map.get(s);
					Set<String> keys = mp.keySet();
					for (Iterator<String> ite = keys.iterator(); ite.hasNext();) {
						String t = (String) ite.next();
						q.setParameter(t, mp.get(t));
					}
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
