package org.tju.ebs.domain.dao;

import java.lang.reflect.Type;
import java.lang.reflect.ParameterizedType;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.hibernate.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.util.Assert;
import org.tju.ebs.bean.BaseEntity;
import org.tju.ebs.bean.Filter;
import org.tju.ebs.utils.StringUtil;

//import org.apache.lucene.search.QueryluceneQuery;

import org.apache.commons.beanutils.*;

import com.google.gson.*;
import com.google.gson.reflect.TypeToken;

public abstract class BaseDAO<T extends BaseEntity> extends HibernateDaoSupport {

	private static final Logger log = LoggerFactory.getLogger(BaseDAO.class);

	@SuppressWarnings("unchecked")
	protected List<T> getAll() {
		String hql = "from " + this.getGenericClassName();
		return this.getHibernateTemplate().find(hql);
	}

	@SuppressWarnings("unchecked")
	protected List<T> getObjectsByHQL(String hql) {
		return this.getHibernateTemplate().find(hql);
	}

	@SuppressWarnings("unchecked")
	private String getGenericClassName() {
		Class<T> beanClass = null;
		Type type = getClass().getGenericSuperclass();
		Type trueType = ((ParameterizedType) type).getActualTypeArguments()[0];
		beanClass = (Class<T>) trueType;
	
		String result = beanClass.getName();
		return result;
	}

	protected Map<String, Object> getAll(int pageNo, int pageSize) {
		String hql = "from " + this.getGenericClassName();
		return this.getObjectsByHql(hql, pageNo, pageSize);
	}
	
	protected Map<String, Object> getAll(int pageNo, int pageSize, String filterJson) {
		String hql = "from " + this.getGenericClassName() +" where 1=1";
		if (!StringUtil.isNull(filterJson)) {
			Gson gson = new Gson();
			Type type = new TypeToken<List<Filter>>(){}.getType();
			List<Filter> list =  gson.fromJson(filterJson, type);
			for (int i=0; i<list.size(); i++) {
				Filter filter = list.get(i);
				hql = hql + this.getFilterScripts(filter);
			}
		}
		return this.getObjectsByHql(hql, pageNo, pageSize);
	}
	
	private String getFilterScripts(Filter filter) {
		String result = " and (";
		String type = filter.getType();
		String value = filter.getValue();
		String field = filter.getField();
		value = value.replace("'", "''");
		if (type.equals("string")) {
				result = result + field + " like '%" + value + "%'";
		}
		return result + " )";
	}
	

	@SuppressWarnings("unchecked")
	protected Map<String, Object> getObjectsByHql(String hql, int pageNo,
			int pageSize) {
		Assert.hasText(hql);
		pageNo = pageNo <= 0 ? 1 : pageNo;
		// int startIndex = (pageNo - 1) * pageSize;
		int startIndex = pageNo;
		Query query = this.getSession().createQuery(hql);
		List<T> list = query.setFirstResult(startIndex - 1)
				.setMaxResults(pageSize).list();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("count", this.getRecordCount(hql));
		map.put("list", list);
		return map;
		
	}

	protected long getRecordCount(String hql) {
		String countQueryString = " select count (*) "
				+ removeHQLSelect(removeHQLOrder(hql));
		List<?> countlist = getHibernateTemplate().find(countQueryString);
		return (Long) countlist.get(0);
	}

	protected void save(T instance) throws Exception {
		log.debug("start to save object:" + this.getGenericClassName());
		try {
			getHibernateTemplate().merge(instance);
		} catch (Exception e) {
			try {
				log.error("failed to save object(" + this.getGenericClassName()
						+ "):"
						+ PropertyUtils.getProperty(instance, "id").toString()
						+ "[" + e.toString() + "]");
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			throw e;
		}
	}

	protected void delete(T instance) throws Exception {
		log.debug("start to delete object:" + this.getGenericClassName());
		try {
			//this.getHibernateTemplate().delete(this.getGenericClassName(), instance);
			this.getHibernateTemplate().delete(instance);
		} catch (Exception e) {
			try {
				log.error("failed to save object(" + this.getGenericClassName()
						+ "):"
						+ PropertyUtils.getProperty(instance, "id").toString());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
	}

	@SuppressWarnings("unchecked")
	protected T getObjectById(String id) {
		return (T) this.getHibernateTemplate().get(this.getGenericClassName(),
				id);
	}

	private static String removeHQLSelect(String hql) {
		Assert.hasText(hql);
		int beginPos = hql.toLowerCase().indexOf("from");
		Assert.isTrue(beginPos != -1, " hql : " + hql
				+ " must has a keyword 'from'");
		return hql.substring(beginPos);
	}

	private static String removeHQLOrder(String hql) {
		Assert.hasText(hql);
		Pattern p = Pattern.compile("order\\s*by[\\w|\\W|\\s|\\S]*",
				Pattern.CASE_INSENSITIVE);
		Matcher m = p.matcher(hql);
		StringBuffer sb = new StringBuffer();
		while (m.find()) {
			m.appendReplacement(sb, "");
		}
		m.appendTail(sb);
		return sb.toString();
	}
}
