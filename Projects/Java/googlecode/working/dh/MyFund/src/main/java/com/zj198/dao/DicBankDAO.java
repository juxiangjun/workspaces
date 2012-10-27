package com.zj198.dao;

import java.util.List;

import com.zj198.model.DicBank;

public interface DicBankDAO extends BaseDAO<DicBank, Integer> {

	public List<DicBank> findAll();
}
