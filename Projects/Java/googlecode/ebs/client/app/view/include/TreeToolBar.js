Ext.define('ebs.view.include.TreeToolBar', {
	extend: 'Ext.toolbar.Toolbar',
    alias: 'widget.treeToolBar',
	itemId: 'bbar',
	mixins: {
		actionConstants: 'ebs.resource.ActionConstants',
		sysObjectConstants: 'ebs.resource.SysObjectConstants'
	},
    config: {
    	sysDomainObject: ''
	},
	
	initComponent: function() {
		var btnStatus = this.getToolBarByPermission(this.sysDomainObject);
		Ext.apply(this, {
			items: 
				[
					{
						itemId: 'gtbNew',
					    text: this.NEW,
					    action: 'gtbCreate',
						disabled: true,
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
					}
				]
			});
        this.callParent(arguments);
    },
	getToolBarByPermission: function(sysDomainObject) {
		var permissions = window.permission;
		var result='';
		var results = new Array();
		for( i=0; i<permissions.length; i++) {
			var record = permissions[i];
			if (record.DomainObjectId == sysDomainObject) {
				 result = record;
				 console.log(result.Code);
				 break;
			}
		}
		if(result.Code=='1')
		{
       results[0]=true;
       results[1]=false;
       results[2]=true;
		};
		if(result.Code=='2')
		{
       results[0]=false;
       results[1]=false;
       results[2]=true;
		};
		if(result.Code=='3')
		{
       results[0]=false;
       results[1]=false;
       results[2]=false;
		}
		return results;
	}

});
