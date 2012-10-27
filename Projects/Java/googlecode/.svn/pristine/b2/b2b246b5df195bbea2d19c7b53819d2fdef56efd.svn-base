package org.tju.ebs.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * SysCurrencyExchange entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "sys_currency_exchange", catalog = "ebs")
public class SysCurrencyExchange extends org.tju.ebs.bean.BaseEntity implements
		java.io.Serializable {

	// Fields

	private String id;
	private String publishDate;
	private String mainCurrencyId;
	private String targetCurrencyId;
	private Double exchangeRate;
	private Double buyingRate;
	private Double cashBuyingRate;
	private Double sellingRate;
	private Double middleRate;
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
	public SysCurrencyExchange() {
	}

	/** minimal constructor */
	public SysCurrencyExchange(String id) {
		this.id = id;
	}

	/** full constructor */
	public SysCurrencyExchange(String id, String publishDate,
			String mainCurrencyId, String targetCurrencyId,
			Double exchangeRate, Double buyingRate, Double cashBuyingRate,
			Double sellingRate, Double middleRate, String createdDate,
			String createdBy, String lastViewedDate, String lastViewedBy,
			String lastUpdatedDate, String lastUpdatedBy, String deletedDate,
			String deletedBy, String currViewedDate, String currViewedBy,
			Short deletedFlag) {
		this.id = id;
		this.publishDate = publishDate;
		this.mainCurrencyId = mainCurrencyId;
		this.targetCurrencyId = targetCurrencyId;
		this.exchangeRate = exchangeRate;
		this.buyingRate = buyingRate;
		this.cashBuyingRate = cashBuyingRate;
		this.sellingRate = sellingRate;
		this.middleRate = middleRate;
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

	@Column(name = "publish_date", length = 20)
	public String getPublishDate() {
		return this.publishDate;
	}

	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}

	@Column(name = "main_currency_id", length = 36)
	public String getMainCurrencyId() {
		return this.mainCurrencyId;
	}

	public void setMainCurrencyId(String mainCurrencyId) {
		this.mainCurrencyId = mainCurrencyId;
	}

	@Column(name = "target_currency_id", length = 36)
	public String getTargetCurrencyId() {
		return this.targetCurrencyId;
	}

	public void setTargetCurrencyId(String targetCurrencyId) {
		this.targetCurrencyId = targetCurrencyId;
	}

	@Column(name = "exchange_rate", precision = 18, scale = 4)
	public Double getExchangeRate() {
		return this.exchangeRate;
	}

	public void setExchangeRate(Double exchangeRate) {
		this.exchangeRate = exchangeRate;
	}

	@Column(name = "buying_rate", precision = 18, scale = 4)
	public Double getBuyingRate() {
		return this.buyingRate;
	}

	public void setBuyingRate(Double buyingRate) {
		this.buyingRate = buyingRate;
	}

	@Column(name = "cash_buying_rate", precision = 18, scale = 4)
	public Double getCashBuyingRate() {
		return this.cashBuyingRate;
	}

	public void setCashBuyingRate(Double cashBuyingRate) {
		this.cashBuyingRate = cashBuyingRate;
	}

	@Column(name = "selling_rate", precision = 18, scale = 4)
	public Double getSellingRate() {
		return this.sellingRate;
	}

	public void setSellingRate(Double sellingRate) {
		this.sellingRate = sellingRate;
	}

	@Column(name = "middle_rate", precision = 18, scale = 4)
	public Double getMiddleRate() {
		return this.middleRate;
	}

	public void setMiddleRate(Double middleRate) {
		this.middleRate = middleRate;
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