Ext.define('ebs.proxy.BaseAjaxProxy', {
	extend: 'Ext.data.proxy.Ajax',
	alias: 'proxy.baseAjaxProxy',
	config: {
		pkg: '',
		action: '',
		getListName: ''
	},
	baseUrl: 'http://localhost:8080/ebs/gateway/',
	reader: {
		successProperty: 'success',
		type: 'json',
		root: 'items'		
	},
	initComponent:
		function() {
			var url = this.baseUrl+this.pkg+'/'+this.action+"/";
			Ext.apply(this, {
				url: url+'get',
				api: {
					read: url+'get?type='+this.getListName,
					update: url+'save',
					create: url+'new',
					destroy: url+'delete'
				}
			});
		}	
});
