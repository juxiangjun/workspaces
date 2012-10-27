package com.zj198.dao;

import java.util.List;
import java.util.Map;

import com.zj198.model.OrdLoanRequest;

/**
 * @author paul Description: CreateAuthor:paul CreateDate:2012-6-26 14:34:04
 * @modify: zeroleavebaoyang@gmail.com
 * @modifytime: 2012-6-28 13:21:23
 */
public interface OrdLoanRequestDAO extends BaseDAO<OrdLoanRequest, Integer>{

    public List<OrdLoanRequest> getByUserId(Integer userId);

    public Map<String, Object> getPagationList(String url, int userId, int pageSize, int pageNo);

    public Map<String, Object> getByObjCondition(OrdLoanRequest obj, Map<String, Map<String, Object>> map,  int pageSize, int pageNo);
}
