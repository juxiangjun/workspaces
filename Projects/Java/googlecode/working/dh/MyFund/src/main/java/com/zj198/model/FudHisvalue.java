package com.zj198.model;

import java.util.Date;

/**
 * FudHisvalue entity. @author MyEclipse Persistence Tools
 */

public class FudHisvalue implements java.io.Serializable {

	private static final long serialVersionUID = 2627897974553248522L;
	private Integer id;
	private String fundcode;
	private String levelcode;
	private Double unitvalue;
	private Double accumulatvalue;
	private Double dayincrease;
	private Date day;
	private Double totalvalue;
	
	private String fundName;

	

	/** default constructor */
	public FudHisvalue() {
		
	}
	
	//vo for display
	public FudHisvalue(Integer id, String fundcode, String levelcode,
			Double unitvalue, Double accumulatvalue, Double dayincrease,
			Date day, Double totalvalue, String fundName) {
		super();
		this.id = id;
		this.fundcode = fundcode;
		this.levelcode = levelcode;
		this.unitvalue = unitvalue;
		this.accumulatvalue = accumulatvalue;
		this.dayincrease = dayincrease;
		this.day = day;
		this.totalvalue = totalvalue;
		this.fundName = fundName;
	}

	// Property accessors
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFundcode() {
		return this.fundcode;
	}

	public void setFundcode(String fundcode) {
		this.fundcode = fundcode;
	}

	public String getLevelcode() {
		return this.levelcode;
	}

	public void setLevelcode(String levelcode) {
		this.levelcode = levelcode;
	}

	public Double getUnitvalue() {
		return this.unitvalue;
	}

	public void setUnitvalue(Double unitvalue) {
		this.unitvalue = unitvalue;
	}

	public Double getAccumulatvalue() {
		return this.accumulatvalue;
	}

	public void setAccumulatvalue(Double accumulatvalue) {
		this.accumulatvalue = accumulatvalue;
	}

	public Double getDayincrease() {
		return this.dayincrease;
	}

	public void setDayincrease(Double dayincrease) {
		this.dayincrease = dayincrease;
	}

	public Date getDay() {
		return this.day;
	}

	public void setDay(Date day) {
		this.day = day;
	}

	public Double getTotalvalue() {
		return this.totalvalue;
	}

	public void setTotalvalue(Double totalvalue) {
		this.totalvalue = totalvalue;
	}
	public String getFundName() {
		return fundName;
	}

	public void setFundName(String fundName) {
		this.fundName = fundName;
	}
}