Ext.define('ebs.utils.ModelFactory', { 
    singleton: true,
    define:
        function(modelName, tblName){
            var fields = ebs.utils.SysObjectUtil.getModelFields(tblName);
            Ext.define(modelName, {
                extend: 'Ext.data.Model',
                idgen: 'uuid',
                idProperty: 'id',
                fields: fields
            });
        }
});
