Ext.define('ebs.store.OrgCompanyStore',{
	extend: 'ebs.store.BaseStore',
	requires: ['ebs.proxy.OrgCompanyProxy'],
	alias: 'store.orgCompanyStore',
	autoLoad: false,
	model: 'ebs.model.OrgCompanyModel',
	proxy: {
		type: 'orgCompanyProxy'
	}
});
