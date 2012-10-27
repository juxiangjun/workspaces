Ext.define('ebs.model.OrgCompanyModel', {
	extend: 'Ext.data.Model',
	alias: 'model.orgCompanyModel',
	requires: ['ebs.proxy.OrgCompanyProxy'],
	fileds: ['id'],
	proxy:{
		type: 'orgCompanyProxy'
	}
});
