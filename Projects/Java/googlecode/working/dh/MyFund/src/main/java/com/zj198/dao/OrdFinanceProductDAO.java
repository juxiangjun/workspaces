package com.zj198.dao;

import java.util.Map;

import com.zj198.model.OrdFinanceProduct;

public interface OrdFinanceProductDAO extends BaseDAO<OrdFinanceProduct, Integer> {

    public Map<String, Object> findByCondition(OrdFinanceProduct obj, int pageSize, int pageNo);
}
