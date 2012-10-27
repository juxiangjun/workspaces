package org.tju.ebs.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Address entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "address", catalog = "ebs")
public class Address extends org.tju.ebs.bean.BaseEntity implements
		java.io.Serializable {

	// Fields

	private String id;
	private String addressLine;
	private String postalCode;
	private String sysCityId;
	private String sysCityCode;
	private String sysCityName;
	private String sysProvinceId;
	private String sysProvinceCode;
	private String sysProvinceName;
	private String sysCountryId;
	private String sysCountryCode;
	private String sysCountryName;
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
	public Address() {
	}

	/** minimal constructor */
	public Address(String id) {
		this.id = id;
	}

	/** full constructor */
	public Address(String id, String addressLine, String postalCode,
			String sysCityId, String sysCityCode, String sysCityName,
			String sysProvinceId, String sysProvinceCode,
			String sysProvinceName, String sysCountryId, String sysCountryCode,
			String sysCountryName, String createdDate, String createdBy,
			String lastViewedDate, String lastViewedBy, String lastUpdatedDate,
			String lastUpdatedBy, String deletedDate, String deletedBy,
			String currViewedDate, String currViewedBy, Short deletedFlag) {
		this.id = id;
		this.addressLine = addressLine;
		this.postalCode = postalCode;
		this.sysCityId = sysCityId;
		this.sysCityCode = sysCityCode;
		this.sysCityName = sysCityName;
		this.sysProvinceId = sysProvinceId;
		this.sysProvinceCode = sysProvinceCode;
		this.sysProvinceName = sysProvinceName;
		this.sysCountryId = sysCountryId;
		this.sysCountryCode = sysCountryCode;
		this.sysCountryName = sysCountryName;
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

	@Column(name = "address_line", length = 200)
	public String getAddressLine() {
		return this.addressLine;
	}

	public void setAddressLine(String addressLine) {
		this.addressLine = addressLine;
	}

	@Column(name = "postal_code", length = 8)
	public String getPostalCode() {
		return this.postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	@Column(name = "sys_city_id", length = 36)
	public String getSysCityId() {
		return this.sysCityId;
	}

	public void setSysCityId(String sysCityId) {
		this.sysCityId = sysCityId;
	}

	@Column(name = "sys_city_code", length = 8)
	public String getSysCityCode() {
		return this.sysCityCode;
	}

	public void setSysCityCode(String sysCityCode) {
		this.sysCityCode = sysCityCode;
	}

	@Column(name = "sys_city_name", length = 32)
	public String getSysCityName() {
		return this.sysCityName;
	}

	public void setSysCityName(String sysCityName) {
		this.sysCityName = sysCityName;
	}

	@Column(name = "sys_province_id", length = 36)
	public String getSysProvinceId() {
		return this.sysProvinceId;
	}

	public void setSysProvinceId(String sysProvinceId) {
		this.sysProvinceId = sysProvinceId;
	}

	@Column(name = "sys_province_code", length = 8)
	public String getSysProvinceCode() {
		return this.sysProvinceCode;
	}

	public void setSysProvinceCode(String sysProvinceCode) {
		this.sysProvinceCode = sysProvinceCode;
	}

	@Column(name = "sys_province_name", length = 32)
	public String getSysProvinceName() {
		return this.sysProvinceName;
	}

	public void setSysProvinceName(String sysProvinceName) {
		this.sysProvinceName = sysProvinceName;
	}

	@Column(name = "sys_country_id", length = 36)
	public String getSysCountryId() {
		return this.sysCountryId;
	}

	public void setSysCountryId(String sysCountryId) {
		this.sysCountryId = sysCountryId;
	}

	@Column(name = "sys_country_code", length = 8)
	public String getSysCountryCode() {
		return this.sysCountryCode;
	}

	public void setSysCountryCode(String sysCountryCode) {
		this.sysCountryCode = sysCountryCode;
	}

	@Column(name = "sys_country_name", length = 32)
	public String getSysCountryName() {
		return this.sysCountryName;
	}

	public void setSysCountryName(String sysCountryName) {
		this.sysCountryName = sysCountryName;
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