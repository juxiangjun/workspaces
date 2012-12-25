package com.zj198.model;

import java.util.Date;

/**
 * PnrFee entity. @author MyEclipse Persistence Tools
 */

public class PnrFee implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private Integer ordId;
	private Double feeAmount;
	private Integer paymentStatus;
	private Date paymentDate;
	private Date createDt;
	private Integer status;
	
	private String applyNum;

	// Constructors

	/** default constructor */
	public PnrFee() {
	}

	/** minimal constructor */
	public PnrFee(Integer userId, Double feeAmount, Integer paymentStatus) {
		this.userId = userId;
		this.feeAmount = feeAmount;
		this.paymentStatus = paymentStatus;
	}

	/** full constructor */
	public PnrFee(Integer userId, Integer ordId, Double feeAmount,
			Integer paymentStatus, Date paymentDate, Date createDt,
			Integer status) {
		this.userId = userId;
		this.ordId = ordId;
		this.feeAmount = feeAmount;
		this.paymentStatus = paymentStatus;
		this.paymentDate = paymentDate;
		this.createDt = createDt;
		this.status = status;
	}
	
	public PnrFee(Integer userId, Integer ordId, Double feeAmount,
			Integer paymentStatus, Date paymentDate, Date createDt,
			Integer status, String applyNum) {
		this.userId = userId;
		this.ordId = ordId;
		this.feeAmount = feeAmount;
		this.paymentStatus = paymentStatus;
		this.paymentDate = paymentDate;
		this.createDt = createDt;
		this.status = status;
		this.applyNum = applyNum;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getOrdId() {
		return this.ordId;
	}

	public void setOrdId(Integer ordId) {
		this.ordId = ordId;
	}

	public Double getFeeAmount() {
		return this.feeAmount;
	}

	public void setFeeAmount(Double feeAmount) {
		this.feeAmount = feeAmount;
	}

	public Integer getPaymentStatus() {
		return this.paymentStatus;
	}

	public void setPaymentStatus(Integer paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public Date getPaymentDate() {
		return this.paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public Date getCreateDt() {
		return this.createDt;
	}

	public void setCreateDt(Date createDt) {
		this.createDt = createDt;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getApplyNum() {
		return applyNum;
	}

	public void setApplyNum(String applyNum) {
		this.applyNum = applyNum;
	}

}