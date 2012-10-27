package org.tju.ebs.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Contact entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "contact", catalog = "ebs")
public class Contact extends org.tju.ebs.bean.BaseEntity implements
		java.io.Serializable {

	// Fields

	private String id;
	private String firstName;
	private String lastName;
	private String title;
	private String email;
	private String phone;
	private String mobile;
	private String instanceType;
	private String instanceMessage;
	private String companyId;

	// Constructors

	/** default constructor */
	public Contact() {
	}

	/** minimal constructor */
	public Contact(String id) {
		this.id = id;
	}

	/** full constructor */
	public Contact(String id, String firstName, String lastName, String title,
			String email, String phone, String mobile, String instanceType,
			String instanceMessage, String companyId) {
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.title = title;
		this.email = email;
		this.phone = phone;
		this.mobile = mobile;
		this.instanceType = instanceType;
		this.instanceMessage = instanceMessage;
		this.companyId = companyId;
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

	@Column(name = "first_name", length = 32)
	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	@Column(name = "last_name", length = 32)
	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	@Column(name = "title", length = 20)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "email", length = 60)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "phone", length = 24)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "mobile", length = 24)
	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	@Column(name = "instance_type", length = 64)
	public String getInstanceType() {
		return this.instanceType;
	}

	public void setInstanceType(String instanceType) {
		this.instanceType = instanceType;
	}

	@Column(name = "instance_message", length = 64)
	public String getInstanceMessage() {
		return this.instanceMessage;
	}

	public void setInstanceMessage(String instanceMessage) {
		this.instanceMessage = instanceMessage;
	}

	@Column(name = "company_id", length = 36)
	public String getCompanyId() {
		return this.companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

}