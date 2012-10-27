package com.zj198.service.loan;

import java.util.Map;

import com.zj198.model.OrdLoanRequest;

/**
 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-6-20 10:07:45
 * @modify: zeroleavebaoyang@gmail.com
 * @modifytime: 2012-6-28 13:21:23
 */
public interface LoanRequestService {

	/**
	 * 统计银行的数量
	 * @return
	 */
	public Long countBankNum();
	/**
	 * 统计各贷款机构的数量
	 * @param type
	 * @return
	 */
	public Long countUserByType(Short type);
	
	/**
	 * 快速申请保存
	 * @param loan
	 * @param loanObjects
	 * @param minBound
	 * @param maxBound
	 * @return
	 */
	public String saveLoanRequest(OrdLoanRequest loan, String[] loanObjects, Integer minBound, Integer maxBound);
	/**
	 * 根据贷款时间获取基准利率
	 * @param month
	 * @return
	 */
	public Double getBaseRate(Integer month);
	

    /**
     * 分页显示融资需求列表
     * 
     * @Author zeroleavebaoyang@gmail.com
     * @Description
     * @param url
     * @param userId
     * @param pageSize
     * @param pageNo
     * @return
     */
    public Map<String, Object> getPagationList(String url, int userId, int pageSize, int pageNo);

    /**
     * 分页显示融资需求列表
     * 
     * @Author zeroleavebaoyang@gmail.com
     * @Description
     * @param obj
     * @param pageSize
     * @param pageNo
     * @return
     */
    public Map<String, Object> getByObjCondition(OrdLoanRequest obj, Map<String, Map<String, Object>> map, int pageSize, int pageNo);

    /**
     * 根据ID查看Ord详情
     * 
     * @Author zeroleavebaoyang@gmail.com
     * @Description
     * @return
     */
    public OrdLoanRequest getOrdDetailById(int id);

}
