package org.tju.ebs.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * ProdPropertyValue entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "prod_property_value", catalog = "ebs")
public class ProdPropertyValue extends BaseEntity implements
		java.io.Serializable {

	// Fields

	private String id;
	private String prodPropertyId;
	private String prodPropName;
	private String prodPropValue;
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
	public ProdPropertyValue() {
	}

	/** minimal constructor */
	public ProdPropertyValue(String id, String prodPropertyId) {
		this.id = id;
		this.prodPropertyId = prodPropertyId;
	}

	/** full constructor */
	public ProdPropertyValue(String id, String prodPropertyId,
			String prodPropName, String prodPropValue, String createdDate,
			String createdBy, String lastViewedDate, String lastViewedBy,
			String lastUpdatedDate, String lastUpdatedBy, String deletedDate,
			String deletedBy, String currViewedDate, String currViewedBy,
			Short deletedFlag) {
		this.id = id;
		this.prodPropertyId = prodPropertyId;
		this.prodPropName = prodPropName;
		this.prodPropValue = prodPropValue;
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

	@Column(name = "prod_property_id", nullable = false, length = 36)
	public String getProdPropertyId() {
		return this.prodPropertyId;
	}

	public void setProdPropertyId(String prodPropertyId) {
		this.prodPropertyId = prodPropertyId;
	}

	@Column(name = "prod_prop_name", length = 80)
	public String getProdPropName() {
		return this.prodPropName;
	}

	public void setProdPropName(String prodPropName) {
		this.prodPropName = prodPropName;
	}

	@Column(name = "prod_prop_value", length = 100)
	public String getProdPropValue() {
		return this.prodPropValue;
	}

	public void setProdPropValue(String prodPropValue) {
		this.prodPropValue = prodPropValue;
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