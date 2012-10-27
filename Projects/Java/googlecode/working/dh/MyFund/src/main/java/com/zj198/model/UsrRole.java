package com.zj198.model;

/**
 * UsrRole entity. @author MyEclipse Persistence Tools
 */

public class UsrRole implements java.io.Serializable {

	private static final long serialVersionUID = -612205776847671066L;
	private Integer id;
	private String rolename;
	private String rights;
	private String remarks;

	/** default constructor */
	public UsrRole() {
	}

	// Property accessors
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getRolename() {
		return this.rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	public String getRights() {
		return this.rights;
	}

	public void setRights(String rights) {
		this.rights = rights;
	}

	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

}