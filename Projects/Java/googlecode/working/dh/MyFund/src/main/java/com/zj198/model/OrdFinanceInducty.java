package com.zj198.model;

/**
 * OrdFinanceInducty entity. @author MyEclipse Persistence Tools
 */

public class OrdFinanceInducty implements java.io.Serializable {

	private static final long serialVersionUID = -2168186688054185665L;
	private Integer id;
	private Integer financeId;
	private Integer industryId;
	private Integer industryChildid;

	/** default constructor */
	public OrdFinanceInducty() {
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

	public Integer getIndustryId() {
		return this.industryId;
	}

	public void setIndustryId(Integer industryId) {
		this.industryId = industryId;
	}

	public Integer getIndustryChildid() {
		return this.industryChildid;
	}

	public void setIndustryChildid(Integer industryChildid) {
		this.industryChildid = industryChildid;
	}

}