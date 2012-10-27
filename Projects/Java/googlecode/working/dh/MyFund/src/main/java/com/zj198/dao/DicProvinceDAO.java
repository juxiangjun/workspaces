package com.zj198.dao;

import java.util.List;

import com.zj198.model.DicProvince;

public interface DicProvinceDAO extends BaseDAO<DicProvince, Integer> {
	public List<DicProvince> findAll();
}
