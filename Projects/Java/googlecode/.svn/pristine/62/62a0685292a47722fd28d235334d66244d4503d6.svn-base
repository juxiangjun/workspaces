Ext.define('ebs.utils.SysObjectUtil', {
    singleton: true,
    getSysObjectPropertyList: 
        function(domainObjectName) {
            var list = window.sysObjectPropertyList;
            var result = new Array();
            var m = 0;
            var i = 0;
            for( i; i<sysObjectPropertyList.length; i++) {
                var record = list[i];
                if (record.sysObjectName == domainObjectName) {
                    result[m] = record;
                    m++;
                }
            }
            return result;
    },
    getModelFields:
        function(domainObjectName){
            var fields = new Array();
            var list = this.getSysObjectPropertyList(domainObjectName);
            var i=0;
            for (i; i< list.length; i++) {
                var record = list[i];
                fields[i] = record.fieldCode;
            }
            return fields;
        },
	getTableName:
		function(domainObjectName) {
			var list = window.sysObjectList;
			var result = "";
			for (var i=0; i<list.length; i++) {
				var sysObject = list[i];
				if (sysObject.code == domainObjectName) {
					result = sysObject.tableName;
					break;
				}
			}
			return result;
		}
});
