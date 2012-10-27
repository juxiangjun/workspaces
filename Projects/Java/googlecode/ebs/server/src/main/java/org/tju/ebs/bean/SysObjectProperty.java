package org.tju.ebs.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * SysObjectProperty entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "sys_object_property", catalog = "ebs")
public class SysObjectProperty extends org.tju.ebs.bean.BaseEntity implements
		java.io.Serializable {

	// Fields

	private Integer id;
	private Short sequence;
	private String sysObjectId;
	private String sysObjectName;
	private String fieldId;
	private String fieldLabel;
	private String fieldCode;
	private Short sysLabel;
	private Short required;
	private Short readonly;
	private Short visible;
	private String dataType;
	private String inputType;
	private Short minValue;
	private Short maxValue;
	private Short groupId;
	private String parameterListName;
	private String listName;
	private String fieldHint;
	private Short isLookupField;
	private String lookupField;
	private Short isTreeRender;
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
	public SysObjectProperty() {
	}

	/** full constructor */
	public SysObjectProperty(Short sequence, String sysObjectId,
			String sysObjectName, String fieldId, String fieldLabel,
			String fieldCode, Short sysLabel, Short required, Short readonly,
			Short visible, String dataType, String inputType, Short minValue,
			Short maxValue, Short groupId, String parameterListName,
			String listName, String fieldHint, Short isLookupField,
			String lookupField, Short isTreeRender, String createdDate,
			String createdBy, String lastViewedDate, String lastViewedBy,
			String lastUpdatedDate, String lastUpdatedBy, String deletedDate,
			String deletedBy, String currViewedDate, String currViewedBy,
			Short deletedFlag) {
		this.sequence = sequence;
		this.sysObjectId = sysObjectId;
		this.sysObjectName = sysObjectName;
		this.fieldId = fieldId;
		this.fieldLabel = fieldLabel;
		this.fieldCode = fieldCode;
		this.sysLabel = sysLabel;
		this.required = required;
		this.readonly = readonly;
		this.visible = visible;
		this.dataType = dataType;
		this.inputType = inputType;
		this.minValue = minValue;
		this.maxValue = maxValue;
		this.groupId = groupId;
		this.parameterListName = parameterListName;
		this.listName = listName;
		this.fieldHint = fieldHint;
		this.isLookupField = isLookupField;
		this.lookupField = lookupField;
		this.isTreeRender = isTreeRender;
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
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "sequence")
	public Short getSequence() {
		return this.sequence;
	}

	public void setSequence(Short sequence) {
		this.sequence = sequence;
	}

	@Column(name = "sys_object_id", length = 36)
	public String getSysObjectId() {
		return this.sysObjectId;
	}

	public void setSysObjectId(String sysObjectId) {
		this.sysObjectId = sysObjectId;
	}

	@Column(name = "sys_object_name", length = 100)
	public String getSysObjectName() {
		return this.sysObjectName;
	}

	public void setSysObjectName(String sysObjectName) {
		this.sysObjectName = sysObjectName;
	}

	@Column(name = "field_id", length = 50)
	public String getFieldId() {
		return this.fieldId;
	}

	public void setFieldId(String fieldId) {
		this.fieldId = fieldId;
	}

	@Column(name = "field_label", length = 36)
	public String getFieldLabel() {
		return this.fieldLabel;
	}

	public void setFieldLabel(String fieldLabel) {
		this.fieldLabel = fieldLabel;
	}

	@Column(name = "field_code", length = 50)
	public String getFieldCode() {
		return this.fieldCode;
	}

	public void setFieldCode(String fieldCode) {
		this.fieldCode = fieldCode;
	}

	@Column(name = "sys_label")
	public Short getSysLabel() {
		return this.sysLabel;
	}

	public void setSysLabel(Short sysLabel) {
		this.sysLabel = sysLabel;
	}

	@Column(name = "required")
	public Short getRequired() {
		return this.required;
	}

	public void setRequired(Short required) {
		this.required = required;
	}

	@Column(name = "readonly")
	public Short getReadonly() {
		return this.readonly;
	}

	public void setReadonly(Short readonly) {
		this.readonly = readonly;
	}

	@Column(name = "visible")
	public Short getVisible() {
		return this.visible;
	}

	public void setVisible(Short visible) {
		this.visible = visible;
	}

	@Column(name = "data_type", length = 20)
	public String getDataType() {
		return this.dataType;
	}

	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	@Column(name = "input_type", length = 20)
	public String getInputType() {
		return this.inputType;
	}

	public void setInputType(String inputType) {
		this.inputType = inputType;
	}

	@Column(name = "min_value")
	public Short getMinValue() {
		return this.minValue;
	}

	public void setMinValue(Short minValue) {
		this.minValue = minValue;
	}

	@Column(name = "max_value")
	public Short getMaxValue() {
		return this.maxValue;
	}

	public void setMaxValue(Short maxValue) {
		this.maxValue = maxValue;
	}

	@Column(name = "group_id")
	public Short getGroupId() {
		return this.groupId;
	}

	public void setGroupId(Short groupId) {
		this.groupId = groupId;
	}

	@Column(name = "parameter_list_name", length = 36)
	public String getParameterListName() {
		return this.parameterListName;
	}

	public void setParameterListName(String parameterListName) {
		this.parameterListName = parameterListName;
	}

	@Column(name = "list_name", length = 50)
	public String getListName() {
		return this.listName;
	}

	public void setListName(String listName) {
		this.listName = listName;
	}

	@Column(name = "field_hint", length = 200)
	public String getFieldHint() {
		return this.fieldHint;
	}

	public void setFieldHint(String fieldHint) {
		this.fieldHint = fieldHint;
	}

	@Column(name = "is_lookup_field")
	public Short getIsLookupField() {
		return this.isLookupField;
	}

	public void setIsLookupField(Short isLookupField) {
		this.isLookupField = isLookupField;
	}

	@Column(name = "lookup_field", length = 36)
	public String getLookupField() {
		return this.lookupField;
	}

	public void setLookupField(String lookupField) {
		this.lookupField = lookupField;
	}

	@Column(name = "is_tree_render")
	public Short getIsTreeRender() {
		return this.isTreeRender;
	}

	public void setIsTreeRender(Short isTreeRender) {
		this.isTreeRender = isTreeRender;
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