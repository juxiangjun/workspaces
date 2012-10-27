package org.tju.ebs.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * ProdItem entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "prod_item", catalog = "ebs")
public class ProdItem extends BaseEntity implements java.io.Serializable {

	// Fields

	private String id;
	private String prodCode;
	private String prodBarcode;
	private String shortName;
	private String fullName;
	private String categoryId;
	private String categoryName;
	private String factoryId;
	private String factoryName;
	private String brandId;
	private String brandName;
	private String companyId;
	private String property1;
	private String property2;
	private String property3;
	private String property4;
	private String property5;
	private String property6;
	private String property7;
	private String property8;
	private String property9;
	private String property0;
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
	public ProdItem() {
	}

	/** minimal constructor */
	public ProdItem(String id) {
		this.id = id;
	}

	/** full constructor */
	public ProdItem(String id, String prodCode, String prodBarcode,
			String shortName, String fullName, String categoryId,
			String categoryName, String factoryId, String factoryName,
			String brandId, String brandName, String companyId,
			String property1, String property2, String property3,
			String property4, String property5, String property6,
			String property7, String property8, String property9,
			String property0, String createdDate, String createdBy,
			String lastViewedDate, String lastViewedBy, String lastUpdatedDate,
			String lastUpdatedBy, String deletedDate, String deletedBy,
			String currViewedDate, String currViewedBy, Short deletedFlag) {
		this.id = id;
		this.prodCode = prodCode;
		this.prodBarcode = prodBarcode;
		this.shortName = shortName;
		this.fullName = fullName;
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.factoryId = factoryId;
		this.factoryName = factoryName;
		this.brandId = brandId;
		this.brandName = brandName;
		this.companyId = companyId;
		this.property1 = property1;
		this.property2 = property2;
		this.property3 = property3;
		this.property4 = property4;
		this.property5 = property5;
		this.property6 = property6;
		this.property7 = property7;
		this.property8 = property8;
		this.property9 = property9;
		this.property0 = property0;
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

	@Column(name = "prod_code", length = 36)
	public String getProdCode() {
		return this.prodCode;
	}

	public void setProdCode(String prodCode) {
		this.prodCode = prodCode;
	}

	@Column(name = "prod_barcode", length = 120)
	public String getProdBarcode() {
		return this.prodBarcode;
	}

	public void setProdBarcode(String prodBarcode) {
		this.prodBarcode = prodBarcode;
	}

	@Column(name = "short_name", length = 80)
	public String getShortName() {
		return this.shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	@Column(name = "full_name", length = 120)
	public String getFullName() {
		return this.fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	@Column(name = "category_id", length = 36)
	public String getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	@Column(name = "category_name", length = 36)
	public String getCategoryName() {
		return this.categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Column(name = "factory_id", length = 36)
	public String getFactoryId() {
		return this.factoryId;
	}

	public void setFactoryId(String factoryId) {
		this.factoryId = factoryId;
	}

	@Column(name = "factory_name", length = 36)
	public String getFactoryName() {
		return this.factoryName;
	}

	public void setFactoryName(String factoryName) {
		this.factoryName = factoryName;
	}

	@Column(name = "brand_id", length = 36)
	public String getBrandId() {
		return this.brandId;
	}

	public void setBrandId(String brandId) {
		this.brandId = brandId;
	}

	@Column(name = "brand_name", length = 60)
	public String getBrandName() {
		return this.brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	@Column(name = "company_id", length = 36)
	public String getCompanyId() {
		return this.companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	@Column(name = "property_1", length = 24)
	public String getProperty1() {
		return this.property1;
	}

	public void setProperty1(String property1) {
		this.property1 = property1;
	}

	@Column(name = "property_2", length = 24)
	public String getProperty2() {
		return this.property2;
	}

	public void setProperty2(String property2) {
		this.property2 = property2;
	}

	@Column(name = "property_3", length = 24)
	public String getProperty3() {
		return this.property3;
	}

	public void setProperty3(String property3) {
		this.property3 = property3;
	}

	@Column(name = "property_4", length = 24)
	public String getProperty4() {
		return this.property4;
	}

	public void setProperty4(String property4) {
		this.property4 = property4;
	}

	@Column(name = "property_5", length = 24)
	public String getProperty5() {
		return this.property5;
	}

	public void setProperty5(String property5) {
		this.property5 = property5;
	}

	@Column(name = "property_6", length = 24)
	public String getProperty6() {
		return this.property6;
	}

	public void setProperty6(String property6) {
		this.property6 = property6;
	}

	@Column(name = "property_7", length = 24)
	public String getProperty7() {
		return this.property7;
	}

	public void setProperty7(String property7) {
		this.property7 = property7;
	}

	@Column(name = "property_8", length = 24)
	public String getProperty8() {
		return this.property8;
	}

	public void setProperty8(String property8) {
		this.property8 = property8;
	}

	@Column(name = "property_9", length = 24)
	public String getProperty9() {
		return this.property9;
	}

	public void setProperty9(String property9) {
		this.property9 = property9;
	}

	@Column(name = "property_0", length = 24)
	public String getProperty0() {
		return this.property0;
	}

	public void setProperty0(String property0) {
		this.property0 = property0;
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