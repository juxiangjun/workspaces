Ext.define('ebs.view.frame.tab.BaseTabItem',{
    extend: 'Ext.panel.Panel',
	layout: 'fit',
	closable: true,
	bodyStyle: {
		background: '#FFFFFF'
	},
	mixins:{
		frameConstants: 'ebs.resources.FrameConstants',
	}
});
