package com.zj198.dao;

import com.zj198.model.FundAnnouncement;
import com.zj198.util.Pager;

public interface FundAnnouncementDAO extends BaseDAO<FundAnnouncement, Integer> {
	/**基金相关公告 -------------pager 分页*/
	public Pager findAnnByFundId(Integer id,Integer pageNo, Integer pageSize);
//	public List<FundAnnouncement> findAnnByCompId(Integer compId);
}
