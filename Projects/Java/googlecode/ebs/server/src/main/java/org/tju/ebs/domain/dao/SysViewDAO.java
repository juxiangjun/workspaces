package org.tju.ebs.domain.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tju.ebs.bean.SysView;

/**
 * A data access object (DAO) providing persistence and search support for
 * SysView entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see org.tju.ebs.bean.SysView
 * @author MyEclipse Persistence Tools
 */

public class SysViewDAO extends BaseDAO<SysView> {

	private static final Logger log = LoggerFactory.getLogger(SysViewDAO.class);

}