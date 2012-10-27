Ext.define('ebs.utils.SysParamsUtil',{
	singleton: true,
	sayHello:
		function() {
			console.log('Hello World');
		},
	getSysParams:
		function(listName) {
			params = window.sysParamList;
			results = new Array();
			m = 0;
			var i=0;
			length = params.length;
			for(i; i<length; i++) {
				param = params[i];
				if (param.listName == listName) {
					results[m] = param;
					m++;
				}
			}
			return results;
		},
	getSysParamsData:
		function(listName) {
			params = this.getSysParams(listName);
			console.log(params);
			results = new Array();
			var i=0;
			for (i; i<params.length; i++) {
				var param = params[i];
				var item = {
					key: param.listKey,
					//value: param.listName+'_'+param.listKey
					value: param.listLabel
				}
				results[i] = item;
			}
			return results;
		}
});
