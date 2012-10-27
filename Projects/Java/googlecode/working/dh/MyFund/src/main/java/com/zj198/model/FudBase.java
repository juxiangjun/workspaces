package com.zj198.model;

import java.util.Date;

/**
 * FudBase entity. @author MyEclipse Persistence Tools
 */

public class FudBase implements java.io.Serializable {

	private static final long serialVersionUID = -3188087453415884817L;
	private String fundcode;
	private String fundname;
	private String fundfullname;
	private String carrytype;
	private String type;
	private String fundcompany;
	private String agentcompany;
	private Date begindate;
	private Date expiredate;
	private Short status;
	private Short from;

	/** default constructor */
	public FudBase() {
	}

	// Property accessors
	public String getFundcode() {
		return this.fundcode;
	}

	public void setFundcode(String fundcode) {
		this.fundcode = fundcode;
	}

	public String getFundname() {
		return this.fundname;
	}

	public void setFundname(String fundname) {
		this.fundname = fundname;
	}

	public String getFundfullname() {
		return this.fundfullname;
	}

	public void setFundfullname(String fundfullname) {
		this.fundfullname = fundfullname;
	}

	public String getCarrytype() {
		return this.carrytype;
	}

	public void setCarrytype(String carrytype) {
		this.carrytype = carrytype;
	}


	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getFundcompany() {
		return this.fundcompany;
	}

	public void setFundcompany(String fundcompany) {
		this.fundcompany = fundcompany;
	}

	public String getAgentcompany() {
		return this.agentcompany;
	}

	public void setAgentcompany(String agentcompany) {
		this.agentcompany = agentcompany;
	}

	public Date getBegindate() {
		return this.begindate;
	}

	public void setBegindate(Date begindate) {
		this.begindate = begindate;
	}

	public Date getExpiredate() {
		return this.expiredate;
	}

	public void setExpiredate(Date expiredate) {
		this.expiredate = expiredate;
	}

	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	public Short getFrom() {
		return this.from;
	}

	public void setFrom(Short from) {
		this.from = from;
	}

}