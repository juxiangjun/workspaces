package com.zj198.dao;

import java.util.List;

import com.zj198.action.loan.model.FinanceApplySpModel;
import com.zj198.model.OrdFinanceApply;
import com.zj198.service.partner.model.FindPartnerApplySpModel;
import com.zj198.util.Pager;

/**
 * @author 岳龙
 * Description:
 * CreateAuthor:岳龙
 * CreateDate:2012-7-05 15:09:59
 */
public interface OrdFinanceApplyDAO extends BaseDAO<OrdFinanceApply, Integer>{
	public Pager findUserApply(int currentPage, int pageCount,Integer userId);
	public Pager findFinanceApply(FinanceApplySpModel spModel);
	public Pager orgFindFinanceApply(FinanceApplySpModel spModel);
	OrdFinanceApply findById(Integer id);
	
	public List<OrdFinanceApply> findApplyByUserId(Integer userId, Integer number);
	public List<OrdFinanceApply> findApplyByOrg(Integer userId, Integer number);
	/**
	 * 查询合作伙伴推荐用户的融资申请
	 * @param spModel
	 * @return
	 */
	public Pager findPartnerApply(FindPartnerApplySpModel spModel);
}
