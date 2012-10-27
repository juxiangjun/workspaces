Ext.define('ebs.utils.StatusBarUtil', {
	singleton: true,
	updateStatusBarInfo:
		function(info) {
			var sb = Ext.getCmp('statusbar');
			sb.setStatus({
				iconCls: 'x-status-saved',
				text: info + Ext.Date.format(new Date(), 'g:i:s A')
			});
		},
	showStatusBarBusy:
		function() {
			var sb = Ext.getCmp('statusbar');
			sb.showBusy();
		},
	setStatusBarLoading:
		function(info) {

		}
})
