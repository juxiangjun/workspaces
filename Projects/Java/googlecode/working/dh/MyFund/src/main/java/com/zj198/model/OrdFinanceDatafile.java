package com.zj198.model;

/**
 * OrdFinanceDatafile entity. @author MyEclipse Persistence Tools
 */

public class OrdFinanceDatafile implements java.io.Serializable {

	private static final long serialVersionUID = -1881999125284318746L;
	private Integer id;
	private Integer financeId;
	private Integer datafileId;
	private String dataName;
	private String dataSupply;
	private Integer needNum;
	private String otherMeno;

	/** default constructor */
	public OrdFinanceDatafile() {
	}

	// Property accessors
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getFinanceId() {
		return this.financeId;
	}

	public void setFinanceId(Integer financeId) {
		this.financeId = financeId;
	}

	public Integer getDatafileId() {
		return this.datafileId;
	}

	public void setDatafileId(Integer datafileId) {
		this.datafileId = datafileId;
	}

	public String getDataName() {
		return this.dataName;
	}

	public void setDataName(String dataName) {
		this.dataName = dataName;
	}

	public String getDataSupply() {
		return this.dataSupply;
	}

	public void setDataSupply(String dataSupply) {
		this.dataSupply = dataSupply;
	}

	public Integer getNeedNum() {
		return this.needNum;
	}

	public void setNeedNum(Integer needNum) {
		this.needNum = needNum;
	}

	public String getOtherMeno() {
		return this.otherMeno;
	}

	public void setOtherMeno(String otherMeno) {
		this.otherMeno = otherMeno;
	}

}