Ext.define('ebs.view.include.GridContextMenu', {
	extend: 'Ext.menu.Menu',
	alias: 'widget.gridContextMenu',
	config: {
		record: null
	},
	constructor: function(config) {
		this.callParent(arguments),
		this.initConfig(config)
	},
	
	initComponent: function () {
        Ext.apply(this, {
            items: 
            [
				{
					text: 'Create',
					iconCls: 'edit',
					action: 'createObject'
				},
				{
					text: 'Edit '+ this.record.get('FirstName')+"  " +this.record.get('LastName'),
					iconCls: 'edit',
					action: 'editObject'
				},
				{
					text: 'Delete',
					iconCls: 'edit',
					action: 'deleteObject'
				},
				{
					text: 'Set inactive',
					iconCls: 'edit'
				}
			]
        });
        this.callParent(arguments);
    }
});
