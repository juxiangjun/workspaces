package com.zj198.model;

import java.util.Set;

/**
 * OrdFinanceDatafile entity. @author MyEclipse Persistence Tools
 */

public class PrdFinanceDatafile implements java.io.Serializable {

	private static final long serialVersionUID = -1881999125284318746L;
	private Integer id;
	private Integer financeId;
	private Integer datafileId;
	private String dataName;
	private String dataSupply;
	private Integer needNum;
	private String otherMemo;
	private Integer haveMemo;
	private Integer haveTemplate;
//	private Set<PrdAttachTemplate> attachTemplateList;

	/** default constructor */
	public PrdFinanceDatafile() {
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

	public String getOtherMemo() {
		return otherMemo;
	}

	public void setOtherMemo(String otherMemo) {
		this.otherMemo = otherMemo;
	}

	public Integer getHaveMemo() {
		return haveMemo;
	}

	public void setHaveMemo(Integer haveMemo) {
		this.haveMemo = haveMemo;
	}

//	public Set<PrdAttachTemplate> getAttachTemplateList() {
//		return attachTemplateList;
//	}
//
//	public void setAttachTemplateList(Set<PrdAttachTemplate> attachTemplateList) {
//		this.attachTemplateList = attachTemplateList;
//	}

	public Integer getHaveTemplate() {
		return haveTemplate;
	}

	public void setHaveTemplate(Integer haveTemplate) {
		this.haveTemplate = haveTemplate;
	}


}