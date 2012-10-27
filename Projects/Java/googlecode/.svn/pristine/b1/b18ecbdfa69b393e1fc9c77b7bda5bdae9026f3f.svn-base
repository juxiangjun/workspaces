Ext.require([
    'Ext.grid.*',
    'Ext.data.*',
    'Ext.ux.RowExpander',
    'Ext.selection.CheckboxModel',
	  'Ext.ux.grid.FiltersFeature',
]);

Ext.define('ebs.view.include.BaseGridPanel' ,{
    extend: 'Ext.grid.Panel',
    alias : 'widget.baseGridPanel',
	requires: [
		'ebs.utils.GridUtil', 
		'ebs.utils.ModelFactory', 
        'ebs.view.include.GridToolBar',
        'ebs.utils.SysObjectUtil',
        'ebs.utils.ModelFactory'
    ],
	border:0,
	padding: 0,
	bodyBorder : false,
	frame : false,
	config: {
		tableName: ''
	},
    initComponent: function() {
		// set checkbox for each grid.
		var sm = Ext.create('Ext.selection.CheckboxModel',{});
		// dynamically generate data model according to the table name.
		var modelName = 'ebs.model.'+this.tableName+'Model';
		ebs.utils.ModelFactory.define(modelName, this.tableName);
		// set data store.			
		var store = Ext.create('ebs.store.'+this.tableName+'Store',{
			model: modelName
		});
		// initialize the store's proxy.
		store.initComponent();
		var columns = ebs.utils.GridUtil.getGridColumns(this.tableName);
		Ext.apply(this, {
			store: store,
			tbar: {xtype: 'gridToolbar', sysDomainObject: 'do'+this.tableName},
			bbar:{
				xtype: 'pagingtoolbar',
				store: store,
				displayInfo: true
			},
			selModel: sm,
			columns: columns, 
			features: [ebs.utils.GridUtil.getFilters()]
		});
        this.callParent();
    }
});
