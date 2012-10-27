Ext.define('ebs.utils.GridUtil', {
	singleton: true,
	requires: ['ebs.utils.DataRenderUtil'],
	mixins:{
		fieldLabelConstants: 'ebs.resources.FieldLabelConstants'
	},
	getIsHidden:
		function(record) {
		    var isHidden = false;
            if (record.visible == '0' ){
                isHidden = true;
            }
			return isHidden;  
		},
	addDefaultColumns:
		function(columns) {
			var isHidden = true;
			var result = columns;
			var m = result.length;
			var defaultColumns = window.defaultColumns;
			for(var i=0; i<defaultColumns.length; i++) { 
				var record = defaultColumns[i];
				var column = this.getNormalColumn('', record);
    			result[m+i] = column;
			}                                                                           
			return result; 
		},
	getNormalColumn:
		function(tableName, record) {
			var isHidden = this.getIsHidden(record);
			var header = '';
			if (Ext.isEmpty(tableName)) {
				header = eval('this.'+record.fieldId.toUpperCase());
			} else {
				header = eval('this.'+tableName.trim()+'_'+record.fieldId.toUpperCase());
			}
            var column = Ext.create('Ext.grid.column.Column', {                                    
				header: header,
                dataIndex: record.fieldCode,                                                   
                width: record.maxValue*1,                                                    
                flex: 1,                                                                           
                hidden: isHidden,                                                                  
                sortable: true,                                                                    
                triStateSort: false,                                                               
                filter:{                                                                           
                    type: record.dataType                                                     
                }
            });                                                                                    
			return column; 
		},
	getRenderColumn:
		function(tableName, record) {
			var isHidden = this.getIsHidden(record);
			var listName = record.parameterListName;
			var render = ebs.utils.DataRenderUtil.getRender(listName);
            var column = Ext.create('Ext.grid.column.Column', {                                    
				header: eval('this.'+tableName+'_'+record.fieldId.toUpperCase()),
                dataIndex: record.fieldCode,                                                   
                width: record.maxValue*1,                                                    
                flex: 1,                                                                           
                hidden: isHidden,                                                                  
                sortable: true,                                                                    
                triStateSort: false,                                                               
				renderer: render,
                filter:{                                                                           
                    type: record.dataType                                                     
                }
            });                                                                                    
			return column; 
		},
	getGridColumns: function(domainObjectName) {
        var result = new Array();
        var columns = ebs.utils.SysObjectUtil.getSysObjectPropertyList(domainObjectName);
		var tableName = ebs.utils.SysObjectUtil.getTableName(domainObjectName).toUpperCase();
		var i=0;
        for (i; i<columns.length; i++){
           	var record  = columns[i];
      	   	var lookupListName = record.listName;
			var column = null;
			if (!Ext.isEmpty(record.parameterListName)) {
				column = this.getRenderColumn(tableName, record);
			} else {
				column = this.getNormalColumn(tableName, record);
			}
           	result[i] = column.initialConfig;                                                      
        }                                                                                          
		result = this.addDefaultColumns(result);
        return result;                                                                             
    },
	getFilters:
        function() {
            var filters = {
                ftype: 'filters',
                encode: true, // json encode the filter query
                filters:
                [
                    {
                        type: 'string',
                        dataIndex: 'id'
                    },
					{
						type: 'string',
						dataIndex: 'createdDate'
					} 
                ]
            };  
            return filters;
        }     

});
