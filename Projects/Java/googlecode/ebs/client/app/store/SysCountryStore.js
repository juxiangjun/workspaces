Ext.define('ebs.store.SysCountryStore',{
	extend: 'ebs.store.BaseStore',
	requires: ['ebs.proxy.SysCountryProxy'],
	alias: 'store.sysCountryStore',
	autoLoad: true,
	model: 'ebs.model.SysCountryModel',
	proxy: {
		type: 'sysCountryProxy'
	},
	initComponent:
		function() {
			this.proxy.initComponent();
		}
});
