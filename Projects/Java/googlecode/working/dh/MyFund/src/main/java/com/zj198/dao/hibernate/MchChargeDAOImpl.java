package com.zj198.dao.hibernate;

import java.util.*;

import com.zj198.dao.MchChargeDAO;
import com.zj198.model.MchCharge;

public class MchChargeDAOImpl extends HibernateDAO<MchCharge, Integer> implements MchChargeDAO {
	@SuppressWarnings("unchecked")
	@Override
	public List<MchCharge> getMchChargeByType(Integer typeId) {
		String hql = "from MahCharge where typeId = :typeId";
		params.put("typeId", typeId);
		return super.findByHQL(hql, params);
	}
}
