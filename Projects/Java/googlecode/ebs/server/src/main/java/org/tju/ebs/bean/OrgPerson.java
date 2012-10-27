package org.tju.ebs.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * OrgPerson entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "org_person", catalog = "ebs")
public class OrgPerson extends org.tju.ebs.bean.BaseEntity implements
		java.io.Serializable {

	// Fields

	private String id;
	private String identityNumber;
	private String firstName;
	private String lastName;
	private String gender;
	private String bornDate;
	private Short eduLevel;
	private String email;
	private String skype;
	private String msn;
	private String qq;
	private String mobilePhone;
	private String addressId;
	private String addressLine;
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
	public OrgPerson() {
	}

	/** minimal constructor */
	public OrgPerson(String id) {
		this.id = id;
	}

	/** full constructor */
	public OrgPerson(String id, String identityNumber, String firstName,
			String lastName, String gender, String bornDate, Short eduLevel,
			String email, String skype, String msn, String qq,
			String mobilePhone, String addressId, String addressLine,
			String createdDate, String createdBy, String lastViewedDate,
			String lastViewedBy, String lastUpdatedDate, String lastUpdatedBy,
			String deletedDate, String deletedBy, String currViewedDate,
			String currViewedBy, Short deletedFlag) {
		this.id = id;
		this.identityNumber = identityNumber;
		this.firstName = firstName;
		this.lastName = lastName;
		this.gender = gender;
		this.bornDate = bornDate;
		this.eduLevel = eduLevel;
		this.email = email;
		this.skype = skype;
		this.msn = msn;
		this.qq = qq;
		this.mobilePhone = mobilePhone;
		this.addressId = addressId;
		this.addressLine = addressLine;
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

	@Column(name = "identity_number", length = 50)
	public String getIdentityNumber() {
		return this.identityNumber;
	}

	public void setIdentityNumber(String identityNumber) {
		this.identityNumber = identityNumber;
	}

	@Column(name = "first_name", length = 50)
	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	@Column(name = "last_name", length = 50)
	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	@Column(name = "gender", length = 50)
	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Column(name = "born_date", length = 20)
	public String getBornDate() {
		return this.bornDate;
	}

	public void setBornDate(String bornDate) {
		this.bornDate = bornDate;
	}

	@Column(name = "edu_level")
	public Short getEduLevel() {
		return this.eduLevel;
	}

	public void setEduLevel(Short eduLevel) {
		this.eduLevel = eduLevel;
	}

	@Column(name = "email", length = 100)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "skype", length = 20)
	public String getSkype() {
		return this.skype;
	}

	public void setSkype(String skype) {
		this.skype = skype;
	}

	@Column(name = "msn", length = 100)
	public String getMsn() {
		return this.msn;
	}

	public void setMsn(String msn) {
		this.msn = msn;
	}

	@Column(name = "qq", length = 50)
	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	@Column(name = "mobile_phone", length = 20)
	public String getMobilePhone() {
		return this.mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	@Column(name = "address_id", length = 36)
	public String getAddressId() {
		return this.addressId;
	}

	public void setAddressId(String addressId) {
		this.addressId = addressId;
	}

	@Column(name = "address_line", length = 100)
	public String getAddressLine() {
		return this.addressLine;
	}

	public void setAddressLine(String addressLine) {
		this.addressLine = addressLine;
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