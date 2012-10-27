package org.tju.ebs.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * SysObject entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "sys_object", catalog = "ebs")
public class SysObject extends org.tju.ebs.bean.BaseEntity implements
		java.io.Serializable {

	// Fields

	private String id;
	private String code;
	private String tableName;
	private String formName;
	private String actionNamespace;
	private String actionName;
	private String formTheme;
	private String formMethod;
	private String formValidation;
	private String formTargets;
	private String formJs;
	private String objNameProperty;
	private Short isSystemObject;
	private String appModelId;
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
	public SysObject() {
	}

	/** minimal constructor */
	public SysObject(String id, String formMethod, String formValidation) {
		this.id = id;
		this.formMethod = formMethod;
		this.formValidation = formValidation;
	}

	/** full constructor */
	public SysObject(String id, String code, String tableName, String formName,
			String actionNamespace, String actionName, String formTheme,
			String formMethod, String formValidation, String formTargets,
			String formJs, String objNameProperty, Short isSystemObject,
			String appModelId, String createdDate, String createdBy,
			String lastViewedDate, String lastViewedBy, String lastUpdatedDate,
			String lastUpdatedBy, String deletedDate, String deletedBy,
			String currViewedDate, String currViewedBy, Short deletedFlag) {
		this.id = id;
		this.code = code;
		this.tableName = tableName;
		this.formName = formName;
		this.actionNamespace = actionNamespace;
		this.actionName = actionName;
		this.formTheme = formTheme;
		this.formMethod = formMethod;
		this.formValidation = formValidation;
		this.formTargets = formTargets;
		this.formJs = formJs;
		this.objNameProperty = objNameProperty;
		this.isSystemObject = isSystemObject;
		this.appModelId = appModelId;
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

	@Column(name = "code", length = 30)
	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Column(name = "table_name", length = 100)
	public String getTableName() {
		return this.tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	@Column(name = "form_name", length = 50)
	public String getFormName() {
		return this.formName;
	}

	public void setFormName(String formName) {
		this.formName = formName;
	}

	@Column(name = "action_namespace", length = 50)
	public String getActionNamespace() {
		return this.actionNamespace;
	}

	public void setActionNamespace(String actionNamespace) {
		this.actionNamespace = actionNamespace;
	}

	@Column(name = "action_name", length = 50)
	public String getActionName() {
		return this.actionName;
	}

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}

	@Column(name = "form_theme", length = 50)
	public String getFormTheme() {
		return this.formTheme;
	}

	public void setFormTheme(String formTheme) {
		this.formTheme = formTheme;
	}

	@Column(name = "form_method", nullable = false, length = 50)
	public String getFormMethod() {
		return this.formMethod;
	}

	public void setFormMethod(String formMethod) {
		this.formMethod = formMethod;
	}

	@Column(name = "form_validation", nullable = false, length = 50)
	public String getFormValidation() {
		return this.formValidation;
	}

	public void setFormValidation(String formValidation) {
		this.formValidation = formValidation;
	}

	@Column(name = "form_targets", length = 50)
	public String getFormTargets() {
		return this.formTargets;
	}

	public void setFormTargets(String formTargets) {
		this.formTargets = formTargets;
	}

	@Column(name = "form_js", length = 65535)
	public String getFormJs() {
		return this.formJs;
	}

	public void setFormJs(String formJs) {
		this.formJs = formJs;
	}

	@Column(name = "obj_name_property", length = 50)
	public String getObjNameProperty() {
		return this.objNameProperty;
	}

	public void setObjNameProperty(String objNameProperty) {
		this.objNameProperty = objNameProperty;
	}

	@Column(name = "is_system_object")
	public Short getIsSystemObject() {
		return this.isSystemObject;
	}

	public void setIsSystemObject(Short isSystemObject) {
		this.isSystemObject = isSystemObject;
	}

	@Column(name = "app_model_id", length = 36)
	public String getAppModelId() {
		return this.appModelId;
	}

	public void setAppModelId(String appModelId) {
		this.appModelId = appModelId;
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