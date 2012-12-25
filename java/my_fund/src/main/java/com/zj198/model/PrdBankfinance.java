package com.zj198.model;

import java.util.Date;

/**
 * PrdBankfinance entity. @author MyEclipse Persistence Tools
 */

public class PrdBankfinance implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6553494948040584942L;
	// Fields

	private Integer id;
	private String code;
	private String name;
	private String bank;
	private String currency;
	private Integer manageperiod;
	private Date benefitstart;
	private Date sellstart;
	private Date sellend;
	private Integer benefitperiod;
	private Double benefitrate;
	private String type;
	private String minamount;
	private String benefittype;
	private String sellarea;
	private Integer addunit;
	private String managefee;
	private String guarantee;
	private String sellstatus;
	private String endcondition;
	private String description;
	private String benefitratedesc;
	private Short from;
	private Date issuedDate;
	private Date importedDate;
	
	private Integer sequence;

	// Constructors

	/** default constructor */
	public PrdBankfinance() {
	}

	/** minimal constructor */
	public PrdBankfinance(Integer id,String code, String name, String bank,
			Integer manageperiod, Date benefitstart, Date sellstart,
			Date sellend, Integer benefitperiod, Double benefitrate,
			String type, String minamount, String benefittype, String sellarea,
			Integer addunit, String managefee, String guarantee,
			String endcondition, String description, String benefitratedesc,
			Integer sequence) {
		this.id=id;
		this.code = code;
		this.name = name;
		this.bank = bank;
		this.manageperiod = manageperiod;
		this.benefitstart = benefitstart;
		this.sellstart = sellstart;
		this.sellend = sellend;
		this.benefitperiod = benefitperiod;
		this.benefitrate = benefitrate;
		this.type = type;
		this.minamount = minamount;
		this.benefittype = benefittype;
		this.sellarea = sellarea;
		this.addunit = addunit;
		this.managefee = managefee;
		this.guarantee = guarantee;
		this.endcondition = endcondition;
		this.description = description;
		this.benefitratedesc = benefitratedesc;
		this.sequence=sequence;
	}

	/** full constructor */
	public PrdBankfinance(String code, String name, String bank,
			String currency, Integer manageperiod, Date benefitstart,
			Date sellstart, Date sellend, Integer benefitperiod,
			Double benefitrate, String type, String minamount,
			String benefittype, String sellarea, Integer addunit,
			String managefee, String guarantee, String sellstatus,
			String endcondition, String description, String benefitratedesc,
			Short from, Date issuedDate, Date importedDate,Integer sequence) {
		this.code = code;
		this.name = name;
		this.bank = bank;
		this.currency = currency;
		this.manageperiod = manageperiod;
		this.benefitstart = benefitstart;
		this.sellstart = sellstart;
		this.sellend = sellend;
		this.benefitperiod = benefitperiod;
		this.benefitrate = benefitrate;
		this.type = type;
		this.minamount = minamount;
		this.benefittype = benefittype;
		this.sellarea = sellarea;
		this.addunit = addunit;
		this.managefee = managefee;
		this.guarantee = guarantee;
		this.sellstatus = sellstatus;
		this.endcondition = endcondition;
		this.description = description;
		this.benefitratedesc = benefitratedesc;
		this.from = from;
		this.issuedDate = issuedDate;
		this.importedDate = importedDate;
		
		this.sequence=sequence;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBank() {
		return this.bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getCurrency() {
		return this.currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public Integer getManageperiod() {
		return this.manageperiod;
	}

	public void setManageperiod(Integer manageperiod) {
		this.manageperiod = manageperiod;
	}

	public Date getBenefitstart() {
		return this.benefitstart;
	}

	public void setBenefitstart(Date benefitstart) {
		this.benefitstart = benefitstart;
	}

	public Date getSellstart() {
		return this.sellstart;
	}

	public void setSellstart(Date sellstart) {
		this.sellstart = sellstart;
	}

	public Date getSellend() {
		return this.sellend;
	}

	public void setSellend(Date sellend) {
		this.sellend = sellend;
	}

	public Integer getBenefitperiod() {
		return this.benefitperiod;
	}

	public void setBenefitperiod(Integer benefitperiod) {
		this.benefitperiod = benefitperiod;
	}

	public Double getBenefitrate() {
		return this.benefitrate;
	}

	public void setBenefitrate(Double benefitrate) {
		this.benefitrate = benefitrate;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getMinamount() {
		return this.minamount;
	}

	public void setMinamount(String minamount) {
		this.minamount = minamount;
	}

	public String getBenefittype() {
		return this.benefittype;
	}

	public void setBenefittype(String benefittype) {
		this.benefittype = benefittype;
	}

	public String getSellarea() {
		return this.sellarea;
	}

	public void setSellarea(String sellarea) {
		this.sellarea = sellarea;
	}

	public Integer getAddunit() {
		return this.addunit;
	}

	public void setAddunit(Integer addunit) {
		this.addunit = addunit;
	}

	public String getManagefee() {
		return this.managefee;
	}

	public void setManagefee(String managefee) {
		this.managefee = managefee;
	}

	public String getGuarantee() {
		return this.guarantee;
	}

	public void setGuarantee(String guarantee) {
		this.guarantee = guarantee;
	}

	public String getSellstatus() {
		return this.sellstatus;
	}

	public void setSellstatus(String sellstatus) {
		this.sellstatus = sellstatus;
	}

	public String getEndcondition() {
		return this.endcondition;
	}

	public void setEndcondition(String endcondition) {
		this.endcondition = endcondition;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getBenefitratedesc() {
		return this.benefitratedesc;
	}

	public void setBenefitratedesc(String benefitratedesc) {
		this.benefitratedesc = benefitratedesc;
	}

	public Short getFrom() {
		return this.from;
	}

	public void setFrom(Short from) {
		this.from = from;
	}

	public Date getIssuedDate() {
		return this.issuedDate;
	}

	public void setIssuedDate(Date issuedDate) {
		this.issuedDate = issuedDate;
	}

	public Date getImportedDate() {
		return this.importedDate;
	}

	public void setImportedDate(Date importedDate) {
		this.importedDate = importedDate;
	}

	public Integer getSequence() {
		return sequence;
	}

	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}

}