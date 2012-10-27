Ext.define('ebs.view.org.OrgCompanyListView' ,{
    extend: 'ebs.view.include.BaseGridPanel',
    id: 'orgCompanyListView',
    alias : 'widget.orgCompanyListView',
    tableName: 'OrgCompany',
        initComponent: function() {
        this.callParent();
    },
	requires: [
        'ebs.store.OrgCompanyStore',
        'ebs.view.include.GridToolBar',
        'ebs.util.SysObjectUtil',
        'ebs.util.ModelFactory'
    ]

});
