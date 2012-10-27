package org.tju.ebs.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * OrgPosition entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "org_position", catalog = "ebs")
public class OrgPosition extends org.tju.ebs.bean.BaseEntity implements
		java.io.Serializable {

	// Fields

	private String id;
	private String code;
	private String name;
	private String orgCompanyId;
	private String orgCompanyName;
	private String positionLevelId;
	private String positionLevelName;
	private String comments;
	private String startDate;
	private String endDate;
	private String status;
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
	public OrgPosition() {
	}

	/** minimal constructor */
	public OrgPosition(String id) {
		this.id = id;
	}

	/** full constructor */
	public OrgPosition(String id, String code, String name,
			String orgCompanyId, String orgCompanyName, String positionLevelId,
			String positionLevelName, String comments, String startDate,
			String endDate, String status, String createdDate,
			String createdBy, String lastViewedDate, String lastViewedBy,
			String lastUpdatedDate, String lastUpdatedBy, String deletedDate,
			String deletedBy, String currViewedDate, String currViewedBy,
			Short deletedFlag) {
		this.id = id;
		this.code = code;
		this.name = name;
		this.orgCompanyId = orgCompanyId;
		this.orgCompanyName = orgCompanyName;
		this.positionLevelId = positionLevelId;
		this.positionLevelName = positionLevelName;
		this.comments = comments;
		this.startDate = startDate;
		this.endDate = endDate;
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

	@Column(name = "code", length = 50)
	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Column(name = "name", length = 100)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "org_company_id", length = 36)
	public String getOrgCompanyId() {
		return this.orgCompanyId;
	}

	public void setOrgCompanyId(String orgCompanyId) {
		this.orgCompanyId = orgCompanyId;
	}

	@Column(name = "org_company_name", length = 100)
	public String getOrgCompanyName() {
		return this.orgCompanyName;
	}

	public void setOrgCompanyName(String orgCompanyName) {
		this.orgCompanyName = orgCompanyName;
	}

	@Column(name = "position_level_id", length = 10)
	public String getPositionLevelId() {
		return this.positionLevelId;
	}

	public void setPositionLevelId(String positionLevelId) {
		this.positionLevelId = positionLevelId;
	}

	@Column(name = "position_level_name", length = 20)
	public String getPositionLevelName() {
		return this.positionLevelName;
	}

	public void setPositionLevelName(String positionLevelName) {
		this.positionLevelName = positionLevelName;
	}

	@Column(name = "comments", length = 100)
	public String getComments() {
		return this.comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	@Column(name = "start_date", length = 24)
	public String getStartDate() {
		return this.startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	@Column(name = "end_date", length = 24)
	public String getEndDate() {
		return this.endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	@Column(name = "status", length = 10)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
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