package org.tju.ebs.domain.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.ModelTransaction;

/**
 * A data access object (DAO) providing persistence and search support for
 * ModelTransaction entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see org.tju.ebs.bean.ModelTransaction
 * @author MyEclipse Persistence Tools
 */

public class ModelTransactionDAO extends BaseDAO<ModelTransaction> {

	private static final Logger log = LoggerFactory
			.getLogger(ModelTransactionDAO.class);

	public ModelTransaction getModelTransactionById(String id) {
		log.debug("");
		return (ModelTransaction) super.getObjectById(id);
	}

	public void save(ModelTransaction instance) throws Exception {
		super.save(instance);
	}

}