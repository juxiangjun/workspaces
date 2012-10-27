package org.tju.ebs.domain.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.SysParam;

public class SysParamDAO extends BaseDAO<SysParam> {

	private static final Logger log = LoggerFactory
			.getLogger(SysParamDAO.class);

	@Override
	public void save(SysParam instance) throws Exception {
		log.debug("SysParamDAO: saving->" + instance.getId());
		super.save(instance);
	}

	public List<SysParam> getAll() {
		String hql = "from SysParam";
		return super.getObjectsByHQL(hql);
	}
}
