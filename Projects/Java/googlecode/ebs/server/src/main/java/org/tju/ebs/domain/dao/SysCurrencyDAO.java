package org.tju.ebs.domain.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.SysCurrency;

/**
 * A data access object (DAO) providing persistence and search support for
 * SysCurrency entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see org.tju.ebs.bean.SysCurrency
 * @author MyEclipse Persistence Tools
 */

public class SysCurrencyDAO extends BaseDAO<SysCurrency> {
	private static final Logger log = LoggerFactory
			.getLogger(SysCurrencyDAO.class);

	@Override
	public void save(SysCurrency instance) throws Exception {
		log.debug("SysCurrencyDAO: saving->" + instance.getId());
		super.save(instance);
	}
}