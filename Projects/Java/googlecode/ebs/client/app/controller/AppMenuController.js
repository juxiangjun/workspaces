Ext.define('ebs.controller.AppMenuController',{
	extend: 'ebs.controller.BaseController',
	alias: 'controller.appMenuController',
	init:
		function() {
			this.control({
				'appMenuTree':{
					itemdblclick: this.onMenuTreeDblClick
			 	}		
			});
		},
	onMenuTreeDblClick:
		function(view, record, item, index, e) {
			if (record.firstChild == null) {
				var sysMenu = record.raw.sysMenu;
				this.createTabItemByMainMenuId(sysMenu);
			}
		},
	getControllerByMenu: 
		function(menu) {
			var controller  = new Array();
			var temp = '';
			var result = '';
			var controllers = menu.controllers;
			if (!Ext.isEmpty(controllers))  {
				m = 0;
				for (i=0; i<controllers.length; i++) {
					temp = controllers[i];
					if (temp != ',') {
						result = result + temp;
					} else {
						controller[m] = result;
						m++;
						result = '';
					}
				}

				if (result.length>0) {
					controller[m] = result;
				}
			}
			return controller;
		},
	loadController: 
		function(controllers) {
			if (controllers != null && controllers.length>0) {
				for (i=0; i<controllers.length; i++){
					var controller = this.getController(controllers[i]);
					controller.init();
				}	
			}
		},
	createTabItemByMainMenuId:
		function(sysMenu){
			var view = Ext.getCmp('ti'+sysMenu.id);
			var mainPanel = Ext.getCmp('mainPanel');
			if (view == null) {
				var controllers = this.getControllerByMenu(sysMenu);
				this.loadController(controllers);
				var viewClassName = sysMenu.tabItem;
				if (!Ext.isEmpty(viewClassName)){
					view = Ext.create(viewClassName, {
						id: 'ti'+ sysMenu.id
					});
					mainPanel.add(view);
				}
			};
			mainPanel.setActiveTab(view);
	}
});
