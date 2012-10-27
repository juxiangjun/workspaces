Ext.define('ebs.proxy.SysCountryProxy', {
	extend: 'ebs.proxy.AppProxy',
	alias: 'proxy.sysCountryProxy',
	pkg: 'system',
	action: 'SysCountry',
	getListName: 'getSysCountryList',
	initComponent:
		function() {
			this.callParent();
		}				
});
