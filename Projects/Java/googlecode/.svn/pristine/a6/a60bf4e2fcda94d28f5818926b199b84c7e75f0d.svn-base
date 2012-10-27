package com.zj198.dao.hibernate;

import java.util.Calendar;
import java.util.Date;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.zj198.dao.PrdBankfinanceDAO;
import com.zj198.model.PrdBankfinance;


public class PrdBankfinanceDAOImpl extends HibernateDAO<PrdBankfinance, Integer> implements PrdBankfinanceDAO {

	private static final Logger log = LoggerFactory.getLogger(PrdBankfinanceDAOImpl.class);
	
	@Override
	public List<PrdBankfinance> findByBenefitRate(int num) {
		String hql = "from PrdBankfinance as model order by model.benefitrate desc";
		return super.list(hql, null, num);
	}
	
	public Map<String, Object> findAll(int pageSize, int pageNo) {
		return this.findAllOfMap(pageSize, pageNo);
	}

	@SuppressWarnings("unchecked")
	@Override
	public PrdBankfinance getByCode(String code) {
		String hql = "from PrdBankfinance as model where model.code = :code";
		log.debug(hql + "[code = "+ code +"]");
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		params.put("code", code);
		List<PrdBankfinance> list = this.findByHQL(hql, params);
		if (list.size()>0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public Map<String, Object> findByMultiConditions(String[] query, int pageSize , int pageNo) {
		
		String hql = "from PrdBankfinance where 1 = 1 ";
		
		
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		
		if (null != query && query.length==6) {
			/**根据销售日期与截止日期判断预售，在售与停售三种状态*/
			String q0 = query[0].trim();
			if (Integer.parseInt(q0)>58) {
				Date today = DateUtils.truncate(Calendar.getInstance().getTime(), Calendar.DAY_OF_MONTH);
				
				if (q0.equals("59")) {
					hql = hql + " and (sellstart<= :sell_start and sellend> :sell_end)";
					params.put("sell_start", today);
					params.put("sell_end", today);
				}
				
				if (q0.equals("60")) {
					hql = hql + " and (sellstart> :sell_start and sellend> :sell_end)";
					params.put("sell_start", today);
					params.put("sell_end", today);
				}
				
				if (q0.equals("61")) {
					hql = hql + " and (sellend< :sell_end)";
					params.put("sell_end", today);
				}
			}
			
			
			String q1 = query[1].trim();
			if (!q1.equals("全部")){
				hql = hql + " and bank = :bank";
				params.put("bank", q1);
			}
			
			/**查询产品投资期限*/
			String q2 = query[2].trim();
			if (Integer.parseInt(q2)>41) {
				if (q2.equals("42")) {
					hql = hql + " and  (manageperiod between :start_date and :end_date)";
					params.put("start_date", 0);
					params.put("end_date", 90);
				}
				
				if (q2.equals("43")) {
					hql = hql + " and  (manageperiod between :start_date and :end_date)";
					params.put("start_date", 90);
					params.put("end_date", 180);
				}
				
				
				if (q2.equals("44")) {
					hql = hql + " and  (manageperiod between :start_date and :end_date)";
					params.put("start_date", 180);
					params.put("end_date", 365);
				}
				
				
				if (q2.equals("45")) {
					hql = hql + " and  (manageperiod between :start_date and :end_date)";
					params.put("start_date", 365);
					params.put("end_date", 1068);
				}
				
				if (q2.equals("46")) {
					hql = hql + " and  (manageperiod > :end_date)";
					params.put("end_date", 1068);
				}
			}
			
			/**查询产品年收益率*/
			String q3 = query[3].trim();
			if (Integer.parseInt(q3)>47) {
				if (q3.equals("48")) {
					hql = hql + " and (benefitrate between :start_rate and :end_rate)";
					params.put("start_rate", 0.0);
					params.put("end_rate", 2.0);
				}
				
				if (q3.equals("49")) {
					hql = hql + " and (benefitrate between :start_rate and :end_rate)";
					params.put("start_rate", 2.0);
					params.put("end_rate", 5.0);
				}
				
				if (q3.equals("50")) {
					hql = hql + " and (benefitrate between :start_rate and :end_rate)";
					params.put("start_rate", 5.0);
					params.put("end_rate", 10.0);
				}
				
				if (q3.equals("51")) {
					hql = hql + " and (benefitrate between :start_rate and :end_rate)";
					params.put("start_rate", 10.0);
					params.put("end_rate", 15.0);
				}
				
				if (q3.equals("52")) {
					hql = hql + " and (benefitrate > :end_rate0";
					params.put("end_rate", 15.0);
				}
			}
			
			
			/**根据投资金额（本金）*/
			String q4 = query[4].trim();
			if (Integer.parseInt(q4)>53) {
				if (q4.equals("54")) {
					hql = hql + " and (replace(minamount,'万元','') between :start_amount and :end_amount)";
					params.put("start_amount", 0);
					params.put("end_amount", 5);
				}
				
				if (q4.equals("55")) {
					hql = hql + " and (replace(minamount,'万元','') between :start_amount and :end_amount)";
					params.put("start_amount", 5);
					params.put("end_amount", 10);
				}
				
				
				if (q4.equals("56")) {
					hql = hql + " and (replace(minamount,'万元','') between :start_amount and :end_amount)";
					params.put("start_amount", 10);
					params.put("end_amount", 20);
				}
				
				if (q4.equals("57")) {
					hql = hql + " and (replace(minamount,'万元','')> :end_amount)";
					params.put("end_amount", 20);
				}
			}
			
			/**根据产品名称*/
			String q5 = query[5].trim();
			if (!StringUtils.isBlank(q5) && !q5.equals("关键字")) {
				hql = hql + " and name like :prod_name ";
				params.put("prod_name", "%"+q5+"%");
			}
		}
		
		return super.findByHqlOfMap(hql, params, pageSize, pageNo);
	}

}
