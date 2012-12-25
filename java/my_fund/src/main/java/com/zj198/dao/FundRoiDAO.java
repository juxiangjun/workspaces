package com.zj198.dao;

import java.util.List;

import com.zj198.model.FundRoi;

public interface FundRoiDAO extends BaseDAO<FundRoi, Integer> {
	/**基金投次回报*/
	public List<FundRoi> findRoiByFundId(Integer id);
}
