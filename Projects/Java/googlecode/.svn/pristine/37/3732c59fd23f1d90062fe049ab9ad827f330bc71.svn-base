package org.tju.ebs.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * SysObjectRelated entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "sys_object_related", catalog = "ebs")
public class SysObjectRelated extends org.tju.ebs.bean.BaseEntity implements
		java.io.Serializable {

	// Fields

	private String id;
	private String sysObjectId;
	private String sysObjectCode;
	private String sysObjectName;
	private Short sequence;
	private String relatedObjectId;
	private String relatedObjectCode;
	private String relatedObjectName;
	private String relatedNamespace;
	private String relatedPropertyName;
	private String orderBy;
	private Short status;
	private String createdDate;
	private String createdBy;
	private String lastViewedDate;
	private String lastViewedBy;
	private String lastUpdatedDate;
	private String lastUpdatedBy;
	private String deletedDate;
	private String deletedBy;
	private String currViewedDate;
	private String currViewedBy;
	private Short deletedFlag;

	// Constructors

	/** default constructor */
	public SysObjectRelated() {
	}

	/** minimal constructor */
	public SysObjectRelated(String id) {
		this.id = id;
	}

	/** full constructor */
	public SysObjectRelated(String id, String sysObjectId,
			String sysObjectCode, String sysObjectName, Short sequence,
			String relatedObjectId, String relatedObjectCode,
			String relatedObjectName, String relatedNamespace,
			String relatedPropertyName, String orderBy, Short status,
			String createdDate, String createdBy, String lastViewedDate,
			String lastViewedBy, String lastUpdatedDate, String lastUpdatedBy,
			String deletedDate, String deletedBy, String currViewedDate,
			String currViewedBy, Short deletedFlag) {
		this.id = id;
		this.sysObjectId = sysObjectId;
		this.sysObjectCode = sysObjectCode;
		this.sysObjectName = sysObjectName;
		this.sequence = sequence;
		this.relatedObjectId = relatedObjectId;
		this.relatedObjectCode = relatedObjectCode;
		this.relatedObjectName = relatedObjectName;
		this.relatedNamespace = relatedNamespace;
		this.relatedPropertyName = relatedPropertyName;
		this.orderBy = orderBy;
		this.status = status;
		this.createdDate = createdDate;
		this.createdBy = createdBy;
		this.lastViewedDate = lastViewedDate;
		this.lastViewedBy = lastViewedBy;
		this.lastUpdatedDate = lastUpdatedDate;
		this.lastUpdatedBy = lastUpdatedBy;
		this.deletedDate = deletedDate;
		this.deletedBy = deletedBy;
		this.currViewedDate = currViewedDate;
		this.currViewedBy = currViewedBy;
		this.deletedFlag = deletedFlag;
	}

	// Property accessors
	@Id
	@Column(name = "id", unique = true, nullable = false, length = 36)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "sys_object_id", length = 36)
	public String getSysObjectId() {
		return this.sysObjectId;
	}

	public void setSysObjectId(String sysObjectId) {
		this.sysObjectId = sysObjectId;
	}

	@Column(name = "sys_object_code", length = 50)
	public String getSysObjectCode() {
		return this.sysObjectCode;
	}

	public void setSysObjectCode(String sysObjectCode) {
		this.sysObjectCode = sysObjectCode;
	}

	@Column(name = "sys_object_name", length = 50)
	public String getSysObjectName() {
		return this.sysObjectName;
	}

	public void setSysObjectName(String sysObjectName) {
		this.sysObjectName = sysObjectName;
	}

	@Column(name = "sequence")
	public Short getSequence() {
		return this.sequence;
	}

	public void setSequence(Short sequence) {
		this.sequence = sequence;
	}

	@Column(name = "related_object_id", length = 36)
	public String getRelatedObjectId() {
		return this.relatedObjectId;
	}

	public void setRelatedObjectId(String relatedObjectId) {
		this.relatedObjectId = relatedObjectId;
	}

	@Column(name = "related_object_code", length = 50)
	public String getRelatedObjectCode() {
		return this.relatedObjectCode;
	}

	public void setRelatedObjectCode(String relatedObjectCode) {
		this.relatedObjectCode = relatedObjectCode;
	}

	@Column(name = "related_object_name", length = 50)
	public String getRelatedObjectName() {
		return this.relatedObjectName;
	}

	public void setRelatedObjectName(String relatedObjectName) {
		this.relatedObjectName = relatedObjectName;
	}

	@Column(name = "related_namespace", length = 50)
	public String getRelatedNamespace() {
		return this.relatedNamespace;
	}

	public void setRelatedNamespace(String relatedNamespace) {
		this.relatedNamespace = relatedNamespace;
	}

	@Column(name = "related_property_name", length = 100)
	public String getRelatedPropertyName() {
		return this.relatedPropertyName;
	}

	public void setRelatedPropertyName(String relatedPropertyName) {
		this.relatedPropertyName = relatedPropertyName;
	}

	@Column(name = "order_by", length = 50)
	public String getOrderBy() {
		return this.orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	@Column(name = "status")
	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	@Column(name = "created_date", length = 24)
	public String getCreatedDate() {
		return this.createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	@Column(name = "created_by", length = 50)
	public String getCreatedBy() {
		return this.createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	@Column(name = "last_viewed_date", length = 24)
	public String getLastViewedDate() {
		return this.lastViewedDate;
	}

	public void setLastViewedDate(String lastViewedDate) {
		this.lastViewedDate = lastViewedDate;
	}

	@Column(name = "last_viewed_by", length = 50)
	public String getLastViewedBy() {
		return this.lastViewedBy;
	}

	public void setLastViewedBy(String lastViewedBy) {
		this.lastViewedBy = lastViewedBy;
	}

	@Column(name = "last_updated_date", length = 24)
	public String getLastUpdatedDate() {
		return this.lastUpdatedDate;
	}

	public void setLastUpdatedDate(String lastUpdatedDate) {
		this.lastUpdatedDate = lastUpdatedDate;
	}

	@Column(name = "last_updated_by", length = 50)
	public String getLastUpdatedBy() {
		return this.lastUpdatedBy;
	}

	public void setLastUpdatedBy(String lastUpdatedBy) {
		this.lastUpdatedBy = lastUpdatedBy;
	}

	@Column(name = "deleted_date", length = 24)
	public String getDeletedDate() {
		return this.deletedDate;
	}

	public void setDeletedDate(String deletedDate) {
		this.deletedDate = deletedDate;
	}

	@Column(name = "deleted_by", length = 50)
	public String getDeletedBy() {
		return this.deletedBy;
	}

	public void setDeletedBy(String deletedBy) {
		this.deletedBy = deletedBy;
	}

	@Column(name = "curr_viewed_date", length = 24)
	public String getCurrViewedDate() {
		return this.currViewedDate;
	}

	public void setCurrViewedDate(String currViewedDate) {
		this.currViewedDate = currViewedDate;
	}

	@Column(name = "curr_viewed_by", length = 50)
	public String getCurrViewedBy() {
		return this.currViewedBy;
	}

	public void setCurrViewedBy(String currViewedBy) {
		this.currViewedBy = currViewedBy;
	}

	@Column(name = "deleted_flag")
	public Short getDeletedFlag() {
		return this.deletedFlag;
	}

	public void setDeletedFlag(Short deletedFlag) {
		this.deletedFlag = deletedFlag;
	}

}