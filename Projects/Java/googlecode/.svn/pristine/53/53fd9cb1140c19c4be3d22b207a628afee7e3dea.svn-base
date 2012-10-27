package org.tju.ebs.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * OrgEmployeePosition entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "org_employee_position", catalog = "ebs")
public class OrgEmployeePosition extends org.tju.ebs.bean.BaseEntity implements
		java.io.Serializable {

	// Fields

	private String id;
	private String orgEmployeeId;
	private String orgEmployeeName;
	private String orgPositionId;
	private String orgPositionName;
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
	public OrgEmployeePosition() {
	}

	/** minimal constructor */
	public OrgEmployeePosition(String id) {
		this.id = id;
	}

	/** full constructor */
	public OrgEmployeePosition(String id, String orgEmployeeId,
			String orgEmployeeName, String orgPositionId,
			String orgPositionName, String startDate, String endDate,
			String status, String createdDate, String createdBy,
			String lastViewedDate, String lastViewedBy, String lastUpdatedDate,
			String lastUpdatedBy, String deletedDate, String deletedBy,
			String currViewedDate, String currViewedBy, Short deletedFlag) {
		this.id = id;
		this.orgEmployeeId = orgEmployeeId;
		this.orgEmployeeName = orgEmployeeName;
		this.orgPositionId = orgPositionId;
		this.orgPositionName = orgPositionName;
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

	@Column(name = "org_employee_id", length = 36)
	public String getOrgEmployeeId() {
		return this.orgEmployeeId;
	}

	public void setOrgEmployeeId(String orgEmployeeId) {
		this.orgEmployeeId = orgEmployeeId;
	}

	@Column(name = "org_employee_name", length = 50)
	public String getOrgEmployeeName() {
		return this.orgEmployeeName;
	}

	public void setOrgEmployeeName(String orgEmployeeName) {
		this.orgEmployeeName = orgEmployeeName;
	}

	@Column(name = "org_position_id", length = 36)
	public String getOrgPositionId() {
		return this.orgPositionId;
	}

	public void setOrgPositionId(String orgPositionId) {
		this.orgPositionId = orgPositionId;
	}

	@Column(name = "org_position_name", length = 50)
	public String getOrgPositionName() {
		return this.orgPositionName;
	}

	public void setOrgPositionName(String orgPositionName) {
		this.orgPositionName = orgPositionName;
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