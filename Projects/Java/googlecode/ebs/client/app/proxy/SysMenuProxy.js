Ext.define('ebs.proxy.SysMenuProxy', {
	extend: 'ebs.proxy.AppProxy',
	alias: 'proxy.sysMenuProxy',
	pkg: 'system',
	action: 'SysMenu',
	initComponent:
		function() {
			this.callParent();
		}
});
