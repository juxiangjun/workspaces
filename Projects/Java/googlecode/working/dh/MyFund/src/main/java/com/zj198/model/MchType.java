package com.zj198.model;

import java.util.Date;

/**
 * MchType entity. @author MyEclipse Persistence Tools
 */

public class MchType implements java.io.Serializable {

	private static final long serialVersionUID = -8393303197915164348L;
	private Integer id;
	private String name;
	private Short term;
	private Integer charge;
	private Date effectiveDate;
	private Date expiredDate;
	private Short isCancelled;
	private String createdBy;
	private Date createdDate;
	private String lastModifiedBy;
	private Date lastModifiedDate;
	private String deletedBy;
	private Date deletedDate;
	private Short deletedFlag;

	/** default constructor */
	public MchType() {
	}

	// Property accessors
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Short getTerm() {
		return this.term;
	}

	public void setTerm(Short term) {
		this.term = term;
	}

	public Integer getCharge() {
		return this.charge;
	}

	public void setCharge(Integer charge) {
		this.charge = charge;
	}

	public Date getEffectiveDate() {
		return this.effectiveDate;
	}

	public void setEffectiveDate(Date effectiveDate) {
		this.effectiveDate = effectiveDate;
	}

	public Date getExpiredDate() {
		return this.expiredDate;
	}

	public void setExpiredDate(Date expiredDate) {
		this.expiredDate = expiredDate;
	}

	public Short getIsCancelled() {
		return this.isCancelled;
	}

	public void setIsCancelled(Short isCancelled) {
		this.isCancelled = isCancelled;
	}

	public String getCreatedBy() {
		return this.createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedDate() {
		return this.createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getLastModifiedBy() {
		return this.lastModifiedBy;
	}

	public void setLastModifiedBy(String lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}

	public Date getLastModifiedDate() {
		return this.lastModifiedDate;
	}

	public void setLastModifiedDate(Date lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

	public String getDeletedBy() {
		return this.deletedBy;
	}

	public void setDeletedBy(String deletedBy) {
		this.deletedBy = deletedBy;
	}

	public Date getDeletedDate() {
		return this.deletedDate;
	}

	public void setDeletedDate(Date deletedDate) {
		this.deletedDate = deletedDate;
	}

	public Short getDeletedFlag() {
		return this.deletedFlag;
	}

	public void setDeletedFlag(Short deletedFlag) {
		this.deletedFlag = deletedFlag;
	}

}