package com.zj198.model;

import java.util.Date;

/**
 * OrdFee entity. @author MyEclipse Persistence Tools
 */

public class OrdFee implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer feeType;
	private Integer ordId;
	private Double feeAmount;
	private Integer paymentStatus;
	private Date paymentDate;
	private Date createDt;
	private Integer status;

	// Constructors

	/** default constructor */
	public OrdFee() {
	}

	/** minimal constructor */
	public OrdFee(Integer feeType) {
		this.feeType = feeType;
	}

	/** full constructor */
	public OrdFee(Integer feeType, Integer ordId, Double feeAmount,
			Integer paymentStatus, Date paymentDate, Date createDt,
			Integer status) {
		this.feeType = feeType;
		this.ordId = ordId;
		this.feeAmount = feeAmount;
		this.paymentStatus = paymentStatus;
		this.paymentDate = paymentDate;
		this.createDt = createDt;
		this.status = status;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getFeeType() {
		return this.feeType;
	}

	public void setFeeType(Integer feeType) {
		this.feeType = feeType;
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

}