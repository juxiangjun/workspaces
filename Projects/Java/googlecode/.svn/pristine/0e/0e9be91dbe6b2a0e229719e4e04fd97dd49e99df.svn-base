Ext.define('ebs.view.include.GridToolBar', {
	extend: 'Ext.toolbar.Toolbar',
    alias: 'widget.gridToolbar',
	mixins: {
		actionConstants: 'ebs.resources.ActionConstants',
		sysObjectConstants: 'ebs.resources.SysObjectConstants'
	},
    config: {
    	sysDomainObject: ''
	},
	initComponent: 
		function() {
			var btnStatus = this.getPermissions(this.sysDomainObject);
			Ext.apply(this, {
				items: 
				[
					{
						itemId: 'gtbNew',
					    text: this.NEW,
					    action: 'gtbCreate',
					    hidden:btnStatus[0]
					},
					{
						itemId: 'gtbEdit',
						text: this.EDIT,
						action: 'gtbEdit',
						disabled: true,
						hidden:btnStatus[1]
					},	
					{
						itemId: 'gtbDelete',
						text: this.DELETE,
						action: 'gtbDelete',
						disabled: true,
						hidden:btnStatus[2]
					},
					{
						text: this.REFRESH,
					    action: 'gtbRefresh'
					},
					{
						text: this.EXPORT,
						action: 'gtbExport'
					},
					{
						text: this.GOTO,
						action: 'gtbGoto'
					}
				]
			});
        this.callParent(arguments);
    },
	getViewMenu:
		function() {
			return Ext.create('Ext.menu.Menu',  
			{
				items: 
				[
					{text: this.ALL+' '+this.TBL_EMPLOYEE,action:'gtbAll'},
					'-',
					{
						text: this.CREATED_BY,
						menu: {
							items: 
							[	
								{text: this.TODAY, action:'gtbToday'},
								{text: this.THIS+' '+this.WEEK,action:'gtbWeek'},
								{text: this.THIS+' '+this.MONTH,action:'gtbMonth'},
								{text: this.THIS+' '+this.QUARTER,action:'gtbQuarter'},
								{text: this.THIS+' '+this.YEAR,action:'gtbYear'}
							]
						}
					},
					'-',
					{text:this.USER_CUSTOMIZE_VIEW, action:'gtbCustomizeView'}
				]
			});
	},
	getPermissions: 
		function(sysDomainObject) {
			var results = new Array();
       		results[0] = false;
       		results[1] = false;
       		results[2] = false;
			return results;
		}
});
