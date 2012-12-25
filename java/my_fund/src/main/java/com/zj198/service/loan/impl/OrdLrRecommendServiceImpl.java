package com.zj198.service.loan.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.zj198.dao.PrdFinanceDAO;
import com.zj198.dao.OrdLrRecommendDao;
import com.zj198.model.PrdFinance;
import com.zj198.model.OrdLrRecommend;
import com.zj198.service.loan.OrdLrRecommendService;

public class OrdLrRecommendServiceImpl implements OrdLrRecommendService {

	private OrdLrRecommendDao ordLrRecommendDao;
	private PrdFinanceDAO prdFinanceDAO;

	public void saveSelRecProByAdmin(Integer requestId, Integer userId, Integer[] prdIds, Integer type) {
		if(prdIds != null && prdIds.length > 0){
			for(Integer pid : prdIds){
				OrdLrRecommend o = new OrdLrRecommend();
				o.setFinanceId(pid);
				o.setRequestId(requestId);
				o.setCreatedt(new Date());
				o.setRecommendType(type);//推荐类型(0:资金网  1:金融机构)
				o.setCreateUserId(userId);
				ordLrRecommendDao.save(o);
			}
		}
	}

	public void saveSelRecProByLoan(Integer requestId, List<OrdLrRecommend> list1) {
		List<OrdLrRecommend> list2 = ordLrRecommendDao.getByRequestLoanID(requestId);
		List<OrdLrRecommend> list3 = new ArrayList<OrdLrRecommend>();
		if (list2 != null) {
			list3.addAll(list2);
			list2.removeAll(list1);
			for (OrdLrRecommend o : list2) {
				ordLrRecommendDao.deleteObject(o);
			}
		}
		if (list1 != null) {
			list1.removeAll(list3);
			for (OrdLrRecommend o : list1) {
				ordLrRecommendDao.save(o);
			}
		}
	}

	public List<PrdFinance> getListByIds(Object[] ids) {
		List<PrdFinance> list = prdFinanceDAO.getListByIds(ids);
		for(PrdFinance p : list){
			p.getInterests().size();
		}
		return list;
	}

	public List<Integer> getByRequestId(Integer id, Integer recommendType) {
		return ordLrRecommendDao.getByRequestId(id, recommendType);
	}
	public List<Integer> getRequestByOrg(Integer id, Integer orgId)  {
		return ordLrRecommendDao.getRequestByOrg(id, orgId);
	}

	public void setOrdLrRecommendDao(OrdLrRecommendDao ordLrRecommendDao) {
		this.ordLrRecommendDao = ordLrRecommendDao;
	}

	public void setPrdFinanceDAO(PrdFinanceDAO prdFinanceDAO) {
		this.prdFinanceDAO = prdFinanceDAO;
	}

}
