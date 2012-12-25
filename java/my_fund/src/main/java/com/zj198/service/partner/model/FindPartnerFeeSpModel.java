package com.zj198.service.partner.model;

import java.util.Date;

import com.zj198.util.Pager;

public class FindPartnerFeeSpModel {
	private Pager pager;
	private Integer pnrUserId;
	private Date startDt;
	private Date endDt;
	private Integer paymentStatus;
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
	public Integer getPaymentStatus() {
		return paymentStatus;
	}
	public void setPaymentStatus(Integer paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
}
