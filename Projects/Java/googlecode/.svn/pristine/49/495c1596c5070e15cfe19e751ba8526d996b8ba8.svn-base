Ext.define('ebs.utils.DataRenderUtil', { 
	singleton: true,
	requires: ['ebs.utils.SysParamsUtil'],
	getRender:
		function(listName){
			var changeValue = function(val) {
                var result = val; 
				var paramsValue = ebs.utils.SysParamsUtil.getSysParamsData(listName); 
				for (var i=0; i<paramsValue.length; i++) {
					console.log(paramsValue[i].key+"-"+val);
					if (paramsValue[i].key == val) { 
						result = paramsValue[i].value; 
					} 
				}
             	return result; 
             } 
			return changeValue;
		}
});
