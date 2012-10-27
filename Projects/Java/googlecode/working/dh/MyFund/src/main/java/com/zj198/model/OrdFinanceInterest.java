package com.zj198.model;

import java.util.Date;


/**
 * OrdFinanceInterest entity. @author MyEclipse Persistence Tools
 */

public class OrdFinanceInterest implements java.io.Serializable {

	private static final long serialVersionUID = -2219084381339078775L;
	private Integer id;
	private Integer financeId;
	private Integer financeStartdt;
	private Integer financeEnddt;
	private Double interestLittle;
	private Double interestBig;
	private Date createdt;
	private Integer isdeleted;

	/** default constructor */
	public OrdFinanceInterest() {
	}

	// Property accessors
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getFinanceId() {
		return this.financeId;
	}

	public void setFinanceId(Integer financeId) {
		this.financeId = financeId;
	}

	public Integer getFinanceStartdt() {
		return this.financeStartdt;
	}

	public void setFinanceStartdt(Integer financeStartdt) {
		this.financeStartdt = financeStartdt;
	}

	public Integer getFinanceEnddt() {
		return this.financeEnddt;
	}

	public void setFinanceEnddt(Integer financeEnddt) {
		this.financeEnddt = financeEnddt;
	}

	public Double getInterestLittle() {
		return this.interestLittle;
	}

	public void setInterestLittle(Double interestLittle) {
		this.interestLittle = interestLittle;
	}

	public Double getInterestBig() {
		return this.interestBig;
	}

	public void setInterestBig(Double interestBig) {
		this.interestBig = interestBig;
	}

	public Date getCreatedt() {
		return this.createdt;
	}

	public void setCreatedt(Date createdt) {
		this.createdt = createdt;
	}

	public Integer getIsdeleted() {
		return this.isdeleted;
	}

	public void setIsdeleted(Integer isdeleted) {
		this.isdeleted = isdeleted;
	}

}