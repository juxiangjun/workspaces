package com.zj198.model;

import java.util.Date;
import java.util.Set;


/**
 * OrdFinanceProduct entity. @author MyEclipse Persistence Tools
 */

public class OrdFinanceProduct implements java.io.Serializable {

	private Integer id;
	private Integer userId;
	private String financeName;
	private Integer financeType;
	private Integer proStatus;
	private Integer financeLittledt;
	private Integer financeMostdt;
	private Double financeLittleamount;
	private Double financeBigamount;
	private Integer interestType;
	private String repaymentType;
	private String mortgageType;
	private String purposeType;
	private Integer checkTime;
	private Double companyAllAsset;
	private Integer operatIncome;
	private Integer settingYear;
	private String otherRequire;
	private String proIntroduce;
	private String proSpecial;
	private String uploadWay;
	private Integer needEnsure;
	private Integer experience;
	private Integer runningArea;
	private Integer bankSalaryList;
	private Integer creditAcount;
	private Integer salaryIncome;
	private Integer salaryPutWay;
	private Integer workTime;
	private Integer house;
	private String houseProperty;
	private Integer useTime;
	private Integer surplus;
	private Integer isdeleted;
	private Date createdt;
	
	private Set<OrdFinanceInterest> interests;
	private Set<OrdFinanceArea> financeAreas;
	private Set<OrdFinanceInducty> financeInductys;
	private Set<OrdFinanceDatafile> dataFiles;
	/** default constructor */
	public OrdFinanceProduct() {
	}

	// Property accessors
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getFinanceName() {
		return this.financeName;
	}

	public void setFinanceName(String financeName) {
		this.financeName = financeName;
	}

	public Integer getFinanceType() {
		return this.financeType;
	}

	public void setFinanceType(Integer financeType) {
		this.financeType = financeType;
	}

	public Integer getProStatus() {
		return this.proStatus;
	}

	public void setProStatus(Integer proStatus) {
		this.proStatus = proStatus;
	}

	public Integer getFinanceLittledt() {
		return this.financeLittledt;
	}

	public void setFinanceLittledt(Integer financeLittledt) {
		this.financeLittledt = financeLittledt;
	}

	public Integer getFinanceMostdt() {
		return this.financeMostdt;
	}

	public void setFinanceMostdt(Integer financeMostdt) {
		this.financeMostdt = financeMostdt;
	}

	public Double getFinanceLittleamount() {
		return this.financeLittleamount;
	}

	public void setFinanceLittleamount(Double financeLittleamount) {
		this.financeLittleamount = financeLittleamount;
	}

	public Double getFinanceBigamount() {
		return this.financeBigamount;
	}

	public void setFinanceBigamount(Double financeBigamount) {
		this.financeBigamount = financeBigamount;
	}

	public Integer getInterestType() {
		return this.interestType;
	}

	public void setInterestType(Integer interestType) {
		this.interestType = interestType;
	}

	

	public Integer getCheckTime() {
		return this.checkTime;
	}

	public void setCheckTime(Integer checkTime) {
		this.checkTime = checkTime;
	}

	public Double getCompanyAllAsset() {
		return this.companyAllAsset;
	}

	public void setCompanyAllAsset(Double companyAllAsset) {
		this.companyAllAsset = companyAllAsset;
	}

	public Integer getOperatIncome() {
		return this.operatIncome;
	}

	public void setOperatIncome(Integer operatIncome) {
		this.operatIncome = operatIncome;
	}

	public Integer getSettingYear() {
		return this.settingYear;
	}

	public void setSettingYear(Integer settingYear) {
		this.settingYear = settingYear;
	}

	public String getOtherRequire() {
		return this.otherRequire;
	}

	public void setOtherRequire(String otherRequire) {
		this.otherRequire = otherRequire;
	}

	public String getProIntroduce() {
		return this.proIntroduce;
	}

	public void setProIntroduce(String proIntroduce) {
		this.proIntroduce = proIntroduce;
	}

	

	public Integer getNeedEnsure() {
		return this.needEnsure;
	}

	public void setNeedEnsure(Integer needEnsure) {
		this.needEnsure = needEnsure;
	}

	public Integer getExperience() {
		return this.experience;
	}

	public void setExperience(Integer experience) {
		this.experience = experience;
	}

	public Integer getRunningArea() {
		return this.runningArea;
	}

	public void setRunningArea(Integer runningArea) {
		this.runningArea = runningArea;
	}

	public Integer getBankSalaryList() {
		return this.bankSalaryList;
	}

	public void setBankSalaryList(Integer bankSalaryList) {
		this.bankSalaryList = bankSalaryList;
	}

	public Integer getCreditAcount() {
		return this.creditAcount;
	}

	public void setCreditAcount(Integer creditAcount) {
		this.creditAcount = creditAcount;
	}

	public Integer getSalaryIncome() {
		return this.salaryIncome;
	}

	public void setSalaryIncome(Integer salaryIncome) {
		this.salaryIncome = salaryIncome;
	}

	public Integer getSalaryPutWay() {
		return this.salaryPutWay;
	}

	public void setSalaryPutWay(Integer salaryPutWay) {
		this.salaryPutWay = salaryPutWay;
	}

	public Integer getWorkTime() {
		return this.workTime;
	}

	public void setWorkTime(Integer workTime) {
		this.workTime = workTime;
	}

	public Integer getHouse() {
		return this.house;
	}

	public void setHouse(Integer house) {
		this.house = house;
	}

	public String getHouseProperty() {
		return this.houseProperty;
	}

	public void setHouseProperty(String houseProperty) {
		this.houseProperty = houseProperty;
	}

	public Integer getUseTime() {
		return this.useTime;
	}

	public void setUseTime(Integer useTime) {
		this.useTime = useTime;
	}

	public Integer getSurplus() {
		return this.surplus;
	}

	public void setSurplus(Integer surplus) {
		this.surplus = surplus;
	}


	public Integer getIsdeleted() {
		return this.isdeleted;
	}

	public void setIsdeleted(Integer isdeleted) {
		this.isdeleted = isdeleted;
	}

	public Date getCreatedt() {
		return this.createdt;
	}

	public void setCreatedt(Date createdt) {
		this.createdt = createdt;
	}

	public Set<OrdFinanceInterest> getInterests() {
		return interests;
	}

	public void setInterests(Set<OrdFinanceInterest> interests) {
		this.interests = interests;
	}

	public Set<OrdFinanceArea> getFinanceAreas() {
		return financeAreas;
	}

	public void setFinanceAreas(Set<OrdFinanceArea> financeAreas) {
		this.financeAreas = financeAreas;
	}

	public Set<OrdFinanceInducty> getFinanceInductys() {
		return financeInductys;
	}

	public void setFinanceInductys(Set<OrdFinanceInducty> financeInductys) {
		this.financeInductys = financeInductys;
	}

	public Set<OrdFinanceDatafile> getDataFiles() {
		return dataFiles;
	}

	public void setDataFiles(Set<OrdFinanceDatafile> dataFiles) {
		this.dataFiles = dataFiles;
	}

	public String getRepaymentType() {
		return repaymentType;
	}

	public void setRepaymentType(String repaymentType) {
		this.repaymentType = repaymentType;
	}

	public String getMortgageType() {
		return mortgageType;
	}

	public void setMortgageType(String mortgageType) {
		this.mortgageType = mortgageType;
	}

	public String getPurposeType() {
		return purposeType;
	}

	public void setPurposeType(String purposeType) {
		this.purposeType = purposeType;
	}

	public String getProSpecial() {
		return proSpecial;
	}

	public void setProSpecial(String proSpecial) {
		this.proSpecial = proSpecial;
	}

	public String getUploadWay() {
		return uploadWay;
	}

	public void setUploadWay(String uploadWay) {
		this.uploadWay = uploadWay;
	}

}