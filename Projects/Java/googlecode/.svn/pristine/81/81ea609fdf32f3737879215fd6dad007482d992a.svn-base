package org.tju.ebs.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * SysUser entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "sys_user", catalog = "ebs")
public class SysUser extends org.tju.ebs.bean.BaseEntity implements
		java.io.Serializable {

	// Fields

	private String id;
	private String loginName;
	private String password;
	private String userName;
	private String employeeId;
	private String employeeCode;
	private String employeeFullName;
	private String status;
	private Integer loginTimes;
	private String orgCompanyId;
	private String orgCompanyCode;
	private String orgCompanyName;
	private Short passwordResetStatus;
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
	public SysUser() {
	}

	/** minimal constructor */
	public SysUser(String id) {
		this.id = id;
	}

	/** full constructor */
	public SysUser(String id, String loginName, String password,
			String userName, String employeeId, String employeeCode,
			String employeeFullName, String status, Integer loginTimes,
			String orgCompanyId, String orgCompanyCode, String orgCompanyName,
			Short passwordResetStatus, String createdDate, String createdBy,
			String lastViewedDate, String lastViewedBy, String lastUpdatedDate,
			String lastUpdatedBy, String deletedDate, String deletedBy,
			String currViewedDate, String currViewedBy, Short deletedFlag) {
		this.id = id;
		this.loginName = loginName;
		this.password = password;
		this.userName = userName;
		this.employeeId = employeeId;
		this.employeeCode = employeeCode;
		this.employeeFullName = employeeFullName;
		this.status = status;
		this.loginTimes = loginTimes;
		this.orgCompanyId = orgCompanyId;
		this.orgCompanyCode = orgCompanyCode;
		this.orgCompanyName = orgCompanyName;
		this.passwordResetStatus = passwordResetStatus;
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

	@Column(name = "login_name", length = 50)
	public String getLoginName() {
		return this.loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	@Column(name = "password", length = 50)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "user_name", length = 50)
	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "employee_id", length = 36)
	public String getEmployeeId() {
		return this.employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	@Column(name = "employee_code", length = 50)
	public String getEmployeeCode() {
		return this.employeeCode;
	}

	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
	}

	@Column(name = "employee_full_name", length = 50)
	public String getEmployeeFullName() {
		return this.employeeFullName;
	}

	public void setEmployeeFullName(String employeeFullName) {
		this.employeeFullName = employeeFullName;
	}

	@Column(name = "status", length = 50)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "login_times")
	public Integer getLoginTimes() {
		return this.loginTimes;
	}

	public void setLoginTimes(Integer loginTimes) {
		this.loginTimes = loginTimes;
	}

	@Column(name = "org_company_id", length = 36)
	public String getOrgCompanyId() {
		return this.orgCompanyId;
	}

	public void setOrgCompanyId(String orgCompanyId) {
		this.orgCompanyId = orgCompanyId;
	}

	@Column(name = "org_company_code", length = 50)
	public String getOrgCompanyCode() {
		return this.orgCompanyCode;
	}

	public void setOrgCompanyCode(String orgCompanyCode) {
		this.orgCompanyCode = orgCompanyCode;
	}

	@Column(name = "org_company_name", length = 100)
	public String getOrgCompanyName() {
		return this.orgCompanyName;
	}

	public void setOrgCompanyName(String orgCompanyName) {
		this.orgCompanyName = orgCompanyName;
	}

	@Column(name = "password_reset_status")
	public Short getPasswordResetStatus() {
		return this.passwordResetStatus;
	}

	public void setPasswordResetStatus(Short passwordResetStatus) {
		this.passwordResetStatus = passwordResetStatus;
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