package org.tju.ebs.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * SysMenu entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "sys_menu", catalog = "ebs")
public class SysMenu extends org.tju.ebs.bean.BaseEntity implements
		java.io.Serializable {

	// Fields

	private String id;
	private String code;
	private String name;
	private String msgCode;
	private String parentId;
	private String parentCode;
	private String parentName;
	private String modelId;
	private String modelName;
	private String imgFile;
	private String panel;
	private Short leaf;
	private String controllers;
	private String tabItem;
	private Short isUserMenu;
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
	public SysMenu() {
	}

	/** minimal constructor */
	public SysMenu(String id, String code, Short leaf, Short isUserMenu) {
		this.id = id;
		this.code = code;
		this.leaf = leaf;
		this.isUserMenu = isUserMenu;
	}

	/** full constructor */
	public SysMenu(String id, String code, String name, String msgCode,
			String parentId, String parentCode, String parentName,
			String modelId, String modelName, String imgFile, String panel,
			Short leaf, String controllers, String tabItem, Short isUserMenu,
			String createdDate, String createdBy, String lastViewedDate,
			String lastViewedBy, String lastUpdatedDate, String lastUpdatedBy,
			String deletedDate, String deletedBy, String currViewedDate,
			String currViewedBy, Short deletedFlag) {
		this.id = id;
		this.code = code;
		this.name = name;
		this.msgCode = msgCode;
		this.parentId = parentId;
		this.parentCode = parentCode;
		this.parentName = parentName;
		this.modelId = modelId;
		this.modelName = modelName;
		this.imgFile = imgFile;
		this.panel = panel;
		this.leaf = leaf;
		this.controllers = controllers;
		this.tabItem = tabItem;
		this.isUserMenu = isUserMenu;
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

	@Column(name = "code", nullable = false, length = 50)
	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Column(name = "name", length = 100)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "msg_code", length = 100)
	public String getMsgCode() {
		return this.msgCode;
	}

	public void setMsgCode(String msgCode) {
		this.msgCode = msgCode;
	}

	@Column(name = "parent_id", length = 36)
	public String getParentId() {
		return this.parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	@Column(name = "parent_code", length = 36)
	public String getParentCode() {
		return this.parentCode;
	}

	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}

	@Column(name = "parent_name", length = 50)
	public String getParentName() {
		return this.parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	@Column(name = "model_id", length = 36)
	public String getModelId() {
		return this.modelId;
	}

	public void setModelId(String modelId) {
		this.modelId = modelId;
	}

	@Column(name = "model_name", length = 20)
	public String getModelName() {
		return this.modelName;
	}

	public void setModelName(String modelName) {
		this.modelName = modelName;
	}

	@Column(name = "img_file", length = 50)
	public String getImgFile() {
		return this.imgFile;
	}

	public void setImgFile(String imgFile) {
		this.imgFile = imgFile;
	}

	@Column(name = "panel", length = 100)
	public String getPanel() {
		return this.panel;
	}

	public void setPanel(String panel) {
		this.panel = panel;
	}

	@Column(name = "leaf", nullable = false)
	public Short getLeaf() {
		return this.leaf;
	}

	public void setLeaf(Short leaf) {
		this.leaf = leaf;
	}

	@Column(name = "controllers", length = 360)
	public String getControllers() {
		return this.controllers;
	}

	public void setControllers(String controllers) {
		this.controllers = controllers;
	}

	@Column(name = "tab_item", length = 60)
	public String getTabItem() {
		return this.tabItem;
	}

	public void setTabItem(String tabItem) {
		this.tabItem = tabItem;
	}

	@Column(name = "is_user_menu", nullable = false)
	public Short getIsUserMenu() {
		return this.isUserMenu;
	}

	public void setIsUserMenu(Short isUserMenu) {
		this.isUserMenu = isUserMenu;
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