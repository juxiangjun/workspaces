Ext.define('ebs.view.frame.WestPanel', {
    extend: 'Ext.panel.Panel',
	requires: ['ebs.view.frame.AppMenuTree'],
    collapsible: true,
	alias: 'widget.westPanel',
	width: 225,
	floatable: true,
	split: true,
	title: '',
	bodyBorder: false,
	border: '0,0,0,0',
	minWidth: 175,
	margin: '0,0,0,0',
	items: {
		xtype: 'appMenuTree'
	},
	layout: {
		type: 'fit'
	} 
})
