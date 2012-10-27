package com.zj198.model;

/**
 * UsrBank entity. @author MyEclipse Persistence Tools
 */

public class UsrBank implements java.io.Serializable {

	private static final long serialVersionUID = 4768862790628908907L;
	private Integer userid;
	private Integer bankid;
	private String detailname;
	private String linkname;
	private Short linkgenderr;
	private String linkemail;
	private String linktelephone;
	private String department;
	private String position;
	private String remarks;

	/** default constructor */
	public UsrBank() {
	}

	// Property accessors
	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getBankid() {
		return this.bankid;
	}

	public void setBankid(Integer bankid) {
		this.bankid = bankid;
	}

	public String getDetailname() {
		return this.detailname;
	}

	public void setDetailname(String detailname) {
		this.detailname = detailname;
	}

	public String getLinkname() {
		return this.linkname;
	}

	public void setLinkname(String linkname) {
		this.linkname = linkname;
	}

	public Short getLinkgenderr() {
		return this.linkgenderr;
	}

	public void setLinkgenderr(Short linkgenderr) {
		this.linkgenderr = linkgenderr;
	}

	public String getLinkemail() {
		return this.linkemail;
	}

	public void setLinkemail(String linkemail) {
		this.linkemail = linkemail;
	}

	public String getLinktelephone() {
		return this.linktelephone;
	}

	public void setLinktelephone(String linktelephone) {
		this.linktelephone = linktelephone;
	}

	public String getDepartment() {
		return this.department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getPosition() {
		return this.position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

}