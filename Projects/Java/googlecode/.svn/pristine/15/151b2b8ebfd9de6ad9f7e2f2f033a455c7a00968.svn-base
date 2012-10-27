Ext.define('ebs.controller.MainController', {
    extend: 'ebs.controller.BaseController',
	baseUrl: 'http://localhost:8080/ebs/gateway/system/',
	loaded: 0,
	stop: false,
    alias: 'controller.mainController',
	views: ['ebs.view.frame.WestPanel'],
    init: 
		function() {
		},
	initialize:
		function() {
			Ext.MessageBox.show({
				title: 'Please wa it',
           		msg: 'Loading items...',
           		progressText: 'Initializing...',
           		width:500,
           		progress:true,
           		closable:false
			});
			this.loadSysMenuList();
			this.loadSysObjectList();
			this.loadSysObjectPropertyList();
			this.loadDefaultColumns();
			this.loadSysParamList();
		},
	check:
		function(success, msg) {
			var percentage = this.loaded / 5;
			if (success) {
				this.loaded = this.loaded + 1;
				Ext.MessageBox.updateProgress(percentage, msg); 
			} else {
				Ext.MessageBox.updateProgress(percentage, msg); 
			}

			if (this.loaded == 5){ 
				var controller = this.getController('AppMenuController');
				controller.init();
				controller = this.getController('SysCountryController');
				controller.init();
				Ext.create('ebs.view.frame.Ebs',{});
				Ext.MessageBox.hide();
			}
			
		},
	loadSysObjectList:
		function() {
			this.loadData('SysObject', 'getSysObjectList', 'sysObjectList');
		},
	loadSysObjectPropertyList:
		function() {
			this.loadData('SysObject', 'getSysObjectPropertyList', 'sysObjectPropertyList');
		},
	loadSysMenuList:
		function() {
			this.loadData('SysMenu', 'getSysMenuList', 'sysMenuList');
		},
	loadDefaultColumns:
		function() {
			this.loadData('SysObject', 'getDefaultColumns', 'defaultColumns');
		},
	loadSysParamList:
		function() {
			this.loadData('SysParam', 'getSysParamList', 'sysParamList');
		},
	loadData:
		function(action, method, name) {
			var url = this.baseUrl+action+'/get?type='+method;
			Ext.Ajax.request({
                url: url,
                scope: this,
                success: 
					function(response) {
						response = Ext.JSON.decode(response.responseText);
						if (response.success) {
							eval('window.'+name+' = response.items');
							this.check(true, response.msg);
						}
					},
				failure:
					function(response) {

					}
			});	
		}
});
