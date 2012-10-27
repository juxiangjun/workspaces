package com.zj198.dao.hibernate;

import java.lang.reflect.ParameterizedType;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.Assert;

import com.zj198.dao.BaseDAO;
import com.zj198.util.Pagination;


public abstract class HibernateDAO<M extends java.io.Serializable, PK extends java.io.Serializable> implements BaseDAO<M, PK> {
	
	/**泛型传入的类*/
    private final Class<M> entityClass;
    /**SessionFactory*/
    private SessionFactory sessionFactory;
    /**Log4j*/
    private static final Logger log = LoggerFactory.getLogger(HibernateDAO.class);
    /**参数传递的Hashtable*/
    protected Hashtable<String, Object> params;
    
    @SuppressWarnings("unchecked")
	public HibernateDAO() {
    	params = new Hashtable<String, Object>();
        this.entityClass = (Class<M>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }
    
    public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @SuppressWarnings("unchecked")
	@Override
	public PK save(M model) {
        return (PK) getSession().save(model);
    }
    
    public void saveOrUpdate(M model) {
    	this.getSession().saveOrUpdate(model);
    }

    @Override
    public void update(M model) {
        getSession().update(model);
    }

    @Override
    public void delete(PK id) {
    	M m = get(id);
    	if(m!=null){
    		deleteObject(m);
    	}
    }

    @Override
    public void deleteObject(M model) {
        getSession().delete(model);
    }

    @Override
    public boolean exists(PK id) {
        return get(id) != null;
    }
   
    @SuppressWarnings("unchecked")
	@Override
    public M get(PK id) {
        return (M) getSession().get(this.entityClass, id);
    }
    
    
    @SuppressWarnings({ "unchecked"})
	public <T> List<T> list(final String sql, final Hashtable<String, Object>  paramList) {
        return this.getQuery(sql, paramList).list();
    }

    /**
     * @author tju
     * @functon: 根据HQL语句取Top n.
     * @param sql
     * @param paramList
     * @param top
     * @return
     */
    @SuppressWarnings({ "unchecked"})
	public <T> List<T> list(final String sql, final Hashtable<String, Object>  paramList, int top) {
    	Query query = this.getQuery(sql, paramList);
		List<T> list = query.setFirstResult(1)
				.setMaxResults(top).list();
    	return list;
    }

    
    /***
     * @author tju
     * @Function: 取相关DAO的全部记录
     * @return
     */
    @SuppressWarnings({ "unchecked"})
    public List<M> findAll(){
    	String hql = "from "+ this.entityClass.getName();
    	Query query = this.getQuery(hql, null);
    	return query.list();
    }
    
    /***
     * @author tju
     * @Function: 对指定表的全部记录进行分页查询
     * @param pageSize
     * @param pageNo
     * @return
     */
    @SuppressWarnings({ "unchecked"})
    protected List<M> findAllofList(int pageSize, int pageNo){
    	pageNo = pageNo <= 0 ? 1 : pageNo;
		int startIndex = (pageNo-1) * pageSize;
    	String hql = "from "+ this.entityClass.getName();
    	Query query = this.getQuery(hql, null);
    	return query.setFirstResult(startIndex - 1)
				.setMaxResults(pageSize).list();
    }
    
    @SuppressWarnings("rawtypes")
	protected Map<String, Object> findAllOfMap(int pageSize, int pageNo) {
    	String hql = "from "+ this.entityClass.getName();
    	Map<String, Object> map = new HashMap<String, Object>();
    	int recordCount = this.getRecordCount(hql, null);
    	List list = this.findByHqlOfList(hql, null, pageSize, pageNo);
    	Pagination p = new Pagination(recordCount, pageSize, pageNo);
    	map.put("pagination", p);
    	map.put("list", list);
    	return map;
    }
    
    /**
     * @author tju
     * @Function: 根据HQL进行查询，不分页
     * @param hql
     * @param params
     * @return
     */
    @SuppressWarnings({ "rawtypes" })
	protected List findByHQL(String hql, Hashtable<String, Object> params) {
    	List result  = null;
    	try {
    		Query query = this.getQuery(hql, params);
    		result = query.list();
    	} catch (Exception e) {
    		log.error(e.toString());
    	}
    	
    	return result;
    }
    
    /**
     * @author tju
     * @Function:根据HQL进行查询，提供分页
     * @param hql
     * @param params
     * @param pageSize
     * @param pageNo
     * @return
     */
    @SuppressWarnings({ "rawtypes" })
    protected List findByHqlOfList(String hql, Hashtable<String, Object> params, int pageSize, int pageNo) {
    	pageNo = pageNo <= 0 ? 1 : pageNo;
		int startIndex = (pageNo-1) * pageSize;
    	Query query = this.getQuery(hql, params);
    	return query.setFirstResult(startIndex)
				.setMaxResults(pageSize).list();
    }
    
    /**
     * @function: 包含分页信息
     * @param hql
     * @param params
     * @param pageSize
     * @param pageNo
     * @return
     */
    @SuppressWarnings("rawtypes")
	protected Map<String, Object> findByHqlOfMap(String hql, Hashtable<String, Object> params, int pageSize, int pageNo) {
    	Map<String, Object> map = new HashMap<String, Object>();
    	int recordCount = this.getRecordCount(hql, params);
    	List list = this.findByHqlOfList(hql, params, pageSize, pageNo);
    	Pagination p = new Pagination(recordCount, pageSize, pageNo);
    	map.put("pagination", p);
    	map.put("list", list);
    	return map;
    }
    
    /***d
     * @author tju
     * @function: 得到相关查询语句所返回的记录数
     * @param hql
     * @param params
     * @return
     */
    @SuppressWarnings("rawtypes")
	protected int getRecordCount(String hql, final Hashtable<String, Object> params) {
    	Integer result = 0;
    	String countQueryString = " select count (*) " + removeHQLSelect(removeHQLOrder(hql));
    	Query query = this.getQuery(countQueryString, params);
    	List list = query.list();
    	
    	if (null != list) {
    		Long records =  (Long)list.get(0);
    		result = records.intValue();
    	}
    	return result.intValue();
    }
     
    /**
     * @author tju
     * @funciton: 构建查询Query
     * @param sql
     * @param paramList
     * @return
     */
    @SuppressWarnings("rawtypes")
   	private Query getQuery(final String sql,  final Hashtable<String, Object> paramList) {
       	
       	Query query =  this.getSession().createQuery(sql);
           if (paramList != null && paramList.size()>0) {
           	Enumeration keys = paramList.keys();
           	while (keys.hasMoreElements()){
           		String key = keys.nextElement().toString();
           		query.setParameter(key, paramList.get(key));
           	}
           }
           
           return query;
       }
       
    /**
     * @author tju
     * @function: 去除查询语句中的select与from之间的内容
     * @param hql
     * @return
     */
    private String removeHQLSelect(String hql) {
		Assert.hasText(hql);
		int beginPos = hql.toLowerCase().indexOf("from");
		Assert.isTrue(beginPos != -1, " hql : " + hql
				+ " must has a keyword 'from'");
		return hql.substring(beginPos);
	}

    /**
     * @author tju
     * @function: 去除HQL语句中Order By部分
     * @param hql
     * @return
     */
	private String removeHQLOrder(String hql) {
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
