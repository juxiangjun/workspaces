package org.tju.ebs.domain.manager;

import org.tju.ebs.domain.dao.ModelTransactionDAO;

public class ModelTransactionManager extends BaseManager {
	private ModelTransactionDAO modelTransactionDAO;

	public void setModelTransactionDAO(ModelTransactionDAO modelTransactionDAO) {
		this.modelTransactionDAO = modelTransactionDAO;
	}

	public ModelTransactionDAO getModelTransactionDAO() {
		return modelTransactionDAO;
	}
}
