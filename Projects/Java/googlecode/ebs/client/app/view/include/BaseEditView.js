Ext.define('ebs.view.include.BaseEditView', {
    extend: 'Ext.window.Window',
	config: {
		tableName:''
	},
	mixins: {
		actionConstants: 'ebs.resources.ActionConstants'
	},
    alias : 'widget.baseEditView',
    requires: ['Ext.form.Panel', 'ebs.utils.SysParamsUtil'],
    title : 'Edit Something',
    layout: 'fit',
    autoHeight:true,
//	style: 'background-color: #fff;',
	autoShow: true,
    height: 400,
    width: 600,
    initComponent: function() {
		Ext.apply(this, {
			items:  [
				{
					xtype: 'form',
					padding: '10 10 0 10',
					border:false, 
					fieldDefaults: {
						labelAlign: 'right',
						msgTarget: 'side'
					},
					height: 300,
					frame:true,
					width: 580,
				//	style: 'background-color: #ffffff;',
					items: [this.getFormFieldset()]
				}
			],
			buttons: [
				{
					text: this.SAVE,
					action: 'save'
				},
				{
					text: this.CANCEL,
					scope: this,
					handler: this.close
				}
			]
			});
        this.callParent(arguments);
    },
	getColumnsByTableName: function(tableName) {
        var columns = window.sysObjects;
        var result = new Array();
        m = 0;
        for( i=0; i<columns.length; i++) {
            var record = columns[i];
            if (record.TblCode == tableName) {
                result[m] = record;
                m++;
            }
        }
        return result;
    },
	getIsHidden:
		function(record) {
			var hidden = false;
			if (record.IsVisible == '0') {
				hidden = true;
			}
			return hidden;
		},
	getNumberField:
		function(record) {
			var hidden = this.getIsHidden(record);
			var minValue = record.FieldMinLength;
			var maxValue = record.FieldMaxLength;
			var allowBlank = record.IsRequired == '0';
			var item = {
				xtype: 'numberfield',
				name: record.FieldProperty,
				fieldLabel: record.FieldLabel,
				allowBlank: allowBlank
			};
			if (minValue != 0 || maxValue != 0) {
				item = {
					xtype: 'numberfield',
					name: record.FieldProperty,
					fieldLabel: record.FieldLabel,
					hidden: hidden,
					minValue: minValue,
					maxValue: maxValue,
					allowBlank: allowBlank
				}
			}	
			return item;
		},
	getDateField:
		function(record){
			var hidden = this.getIsHidden(record);
			var allowBlank = record.IsRequired == '0';
			var item = {
				xtype: 'datefield',
				name: record.FieldProperty,
				hidden: hidden,
				fieldLabel: record.FieldLabel,
				allowBlank: allowBlank
			};
			return item;
		},
	getCheckBoxField:
		function(record) {
				var hidden = this.getIsHidden(record);
				var allowBlank = record.IsRequired == '0';
				var item = {
					xtype: 'checkboxfield',
					name: record.FieldProperty,
					fieldLabel: record.FieldLabel,
					hidden: hidden,
					labelSeparator: '',
					boxLabel: '',
					allowBlank: allowBlank
				}
				return item;
			},
	getRadioField:
		function(record) {
			var hidden = this.getIsHidden(record);
			var data = ebs.utils.SysParamsUtil.getSysParamsData(record.ParameterListName);
			var radioItems = new Array();
			var i = 0;
			for (i; i<data.length; i++) {
				var dataItem = data[i];
				var radio = {
					boxLabel: dataItem.value,
					name: record.FieldProperty,
					inputValue: dataItem.name
				}
				radioItems[i] = radio;
			}
			var allowBlank = record.IsRequired == '0';
			var item = {
				xtype: 'radiogroup',
				//cls: 'x-check-group-alt',
				layout: 'anchor',
				fieldLabel: record.FieldLabel,
				hidden: hidden,
				items: radioItems,
				allowBlank: allowBlank
			}
			return item;
		},
	getTextField:
		function(record){
			var name = record.FieldProperty;
			var fieldLabel = record.FieldLabel;
			var hidden = this.getIsHidden(record);
			var minLength = record.FieldMinLength * 1;
			var maxLength = record.FieldMaxLength * 1;
			var allowBlank = record.IsRequired == '0';
			var regExpress = record.RegExpress;
			var item = {
				xtype: 'textfield',
				name:  name,
				fieldLabel: fieldLabel,
				hidden: hidden,
				allowBlank: allowBlank,
				itemId: 'tf'+record.FieldProperty
			}

			var defaultValue = record.DefaultValue;

			if (defaultValue != null && defaultValue.length>0) {
				item.text = defaultValue;
			}

			if (minLength != null && minLength.length>0) {
				item.minLength = minLength
			}

			if (maxLength != null && maxLength.length>0) {
				item.maxLength = maxLength
			}
		
			if (regExpress != null && regExpress.length >0) {
				var regex = new RegExp(regExpress);
				item.regex = regex;
				item.regexText = 'the data format you input does not meet the regular express.';
			}


			return item;
		},
	getComboField:
		function(record) {
			var parameterLookup = record.ParameterListName;
			var item = null;

			if (!Ext.isEmpty(parameterLookup)) {	
				var data = ebs.utils.SysParamsUtil.getSysParamsData(record.ParameterListName);
				var store = Ext.create('Ext.data.Store', {
					fields: ['name', 'value'],
					data: data
				});
				var hidden = this.getIsHidden(record);
				var allowBlank = record.IsRequired == '0';
				item = {
					xtype: 'combo',
					mode: 'local',
					value: '',
					triggerAction: 'all',
					forceSelection: true,
					editable: false,
					fieldLabel: record.FieldLabel,
					hidden: hidden,
					name: record.FieldProperty,
					displayField: 'value',
					valueField: 'name',
					queryMode: 'local',
					store: store,
					allowBlank: allowBlank
				}			
			}

			var strLookup = record.LookupListName;
		
			if (!Ext.isEmpty(strLookup)) {
			
				var lookupParams = Ext.JSON.decode(strLookup);	
				console.log(lookupParams);
				var modelName = 'ebs.model.'+lookupParams.lookup+'Model';
				ebs.utils.ModelFactory.define(modelName, Ext.utils.Format.uppercase(lookupParams.lookup));
				var store = Ext.create('ebs.store.'+lookupParams.lookup+'Store',{
					model: modelName
				});

				store.initComponent();

				var listConfig = {
					scope: this,
					loadingText: 'seaching...',
					emptyText: 'No matching data found.',
					getInnerTpl: function() {
						return lookupParams.tpl;
					}
				}

				var listeners = {
						select: {
							scope: this,
							fn: function(comob, record, index) {
								var data = record[0].data;
								for (var i=0; i<lookupParams.source.length; i++) {
									var source = lookupParams.source[i];
									var target = lookupParams.target[i];
									var tfTarget = this.down('#tf'+target);
									var value = data[source];
									if (!Ext.isEmpty(tfTarget)) {
										tfTarget.setRawValue(data[source]);
										tfTarget.setValue(data[source]);
									}
								}
							}
						}
					};

				item = {
					xtype: 'combo',
					triggerAction: 'all',
					fieldLabel: record.FieldLabel,
					hidden: hidden,
					name: record.FieldProperty,
					allowBlank: allowBlank,
					typeAhead: false,
					hideTrigger: true,
					displayField: 'ShortName',
					valueField: 'ShortName',
					store: store,
					listeners: listeners,
					minChars:2
				};

			}
			item.itemId = 'tf' + record.FieldProperty;
			return item;
		},
	    getFormFields:
        function(groupName){
        	
            var items = new Array();
            var columns = this.getColumnsByTableName(this.tableName);
						var m = 0;
            for (i=0; i<columns.length; i++) {
            	if(groupName==columns[i].InfoGroupName)
            	{
		              var record = columns[i];
						var inputType = record.FieldInputType;
						var item = null;
						
						if (inputType == 'textfield') {
							item = this.getTextField(record);
						}
		
						if (inputType == 'combo') {
							item = this.getComboField(record);
						}
		
						if (inputType == 'datefield') {
							item = this.getDateField(record);
						}
		
						if (inputType == 'radiofield') {
							item = this.getRadioField(record);
						}
					
						if (inputType == 'numberfield') {
							item = this.getNumberField(record);
						}			
			
						if (inputType == 'checkboxfield') {
							item = this.getCheckBoxField(record);
						}
		
						if (item != null) {
							items[m] = item;
							m++;
						}
			   }
        }
        return items;
       },
      getFormFieldset:function()
      {
      	var items = new Array();
      	var fields= new Array();
      	var columns = this.getColumnsByTableName(this.tableName);
      	for(var i=0;i<columns.length;i++)
      	{
      		 //var field=new Array();
//      		 field[0]=columns[i].InfoGroupId;
//      		 field[1]=columns[i].InfoGroupName;
      		 fields[i]=columns[i].InfoGroupName;;
      	}
      	
				var fieldsLength = fields.length;  
 				while(--fieldsLength){  
				     if(fields.lastIndexOf(fields[fieldsLength],fieldsLength-1) > -1) {
				          fields.splice(fieldsLength,1); 
				       }  
				  	}  
      	var m = 0;
			for(var i = 0;i<fields.length;i++)
			{
      	var item=null;
      	item={
      	xtype:  'fieldset',
      	layout: 'column',
				bodyStyle:'padding: 15px 15px 0',
				title:	fields[i],
      	collapsible: true,
				margin:'0 0 10',
				//style: 'background-color: #fff;',
      			flex:1,
      			defaults:{
						bodyPadding:4,
      					layout: {
            				     type: 'hbox',
               					 }	
      					},
        	  	items:	[this.getFormFields(fields[i])]
			   };
			   if (item != null) {
		 		items[m] = item;
					m++;
			      }
      	}
      	return items;
      }
});
