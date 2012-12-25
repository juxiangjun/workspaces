package com.zj198.service.partner.model;

import java.util.Date;

import com.zj198.util.Pager;

public class FindPartnerApplySpModel {
	private Pager pager;
	private Integer pnrUserId;
	private Date startDt;
	private Date endDt;
	private Integer applyType;
	public Pager getPager() {
		return pager;
	}
	public void setPager(Pager pager) {
		this.pager = pager;
	}
	public Integer getPnrUserId() {
		return pnrUserId;
	}
	public void setPnrUserId(Integer pnrUserId) {
		this.pnrUserId = pnrUserId;
	}
	public Date getStartDt() {
		return startDt;
	}
	public void setStartDt(Date startDt) {
		this.startDt = startDt;
	}
	public Date getEndDt() {
		return endDt;
	}
	public void setEndDt(Date endDt) {
		this.endDt = endDt;
	}
	public Integer getApplyType() {
		return applyType;
	}
	public void setApplyType(Integer applyType) {
		this.applyType = applyType;
	}
}
