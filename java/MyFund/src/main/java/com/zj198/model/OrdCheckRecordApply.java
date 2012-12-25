package com.zj198.model;

import java.util.Date;


/**
 * OrdCheckRecordApply entity. @author MyEclipse Persistence Tools
 */

public class OrdCheckRecordApply implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer crId;
	private Integer applyId;
	private Integer checkStatus;
	private Date createDt;
	private String checkMemo;
	private Integer crType;
	private String title;
	

	// Constructors

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	/** default constructor */
	public OrdCheckRecordApply() {
	}

	/** full constructor */
	public OrdCheckRecordApply(Integer crId, Integer applyId,
			Integer checkStatus, Date createDt, String checkMemo) {
		this.crId = crId;
		this.applyId = applyId;
		this.checkStatus = checkStatus;
		this.createDt = createDt;
		this.checkMemo = checkMemo;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCrId() {
		return this.crId;
	}

	public void setCrId(Integer crId) {
		this.crId = crId;
	}

	public Integer getApplyId() {
		return this.applyId;
	}

	public void setApplyId(Integer applyId) {
		this.applyId = applyId;
	}

	public Integer getCheckStatus() {
		return this.checkStatus;
	}

	public void setCheckStatus(Integer checkStatus) {
		this.checkStatus = checkStatus;
	}

	public Date getCreateDt() {
		return this.createDt;
	}

	public void setCreateDt(Date createDt) {
		this.createDt = createDt;
	}

	public String getCheckMemo() {
		return this.checkMemo;
	}

	public void setCheckMemo(String checkMemo) {
		this.checkMemo = checkMemo;
	}

	public Integer getCrType() {
		return crType;
	}

	public void setCrType(Integer crType) {
		this.crType = crType;
	}

}