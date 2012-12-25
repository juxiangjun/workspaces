package com.zj198.model;

import java.util.Date;

/**
 * PrdAttachTemplate entity. @author MyEclipse Persistence Tools
 */

public class PrdAttachTemplate implements java.io.Serializable {

	private static final long serialVersionUID = -130881522906213732L;
	private Integer id;
	private Integer templateType;
	private Integer dataId;
	private String filePath;
	private String oldName;
	private Date createDt;
	private Integer isDeleted;

	// Constructors

	/** default constructor */
	public PrdAttachTemplate() {
	}

	/** full constructor */
	public PrdAttachTemplate(Integer templateType, Integer dataId,
			String filePath, String oldName, Date createDt,
			Integer isDeleted) {
		this.templateType = templateType;
		this.dataId = dataId;
		this.filePath = filePath;
		this.oldName = oldName;
		this.createDt = createDt;
		this.isDeleted = isDeleted;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTemplateType() {
		return this.templateType;
	}

	public void setTemplateType(Integer templateType) {
		this.templateType = templateType;
	}

	public Integer getDataId() {
		return this.dataId;
	}

	public void setDataId(Integer dataId) {
		this.dataId = dataId;
	}

	public String getFilePath() {
		return this.filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getOldName() {
		return this.oldName;
	}

	public void setOldName(String oldName) {
		this.oldName = oldName;
	}

	public Date getCreateDt() {
		return this.createDt;
	}

	public void setCreateDt(Date createDt) {
		this.createDt = createDt;
	}

	public Integer getIsDeleted() {
		return this.isDeleted;
	}

	public void setIsDeleted(Integer isDeleted) {
		this.isDeleted = isDeleted;
	}

}