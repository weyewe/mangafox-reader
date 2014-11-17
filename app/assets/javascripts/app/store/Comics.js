Ext.define('AM.store.Comics', {
	extend: 'Ext.data.Store',
	require : ['AM.model.Comic'],
	model: 'AM.model.Comic',
	// autoLoad: {start: 0, limit: this.pageSize},
	autoLoad : false, 
	autoSync: false,
	pageSize : 30, 
	
	sorters : [
		{
			property	: 'id',
			direction	: 'DESC'
		}
	], 
	listeners: {

	} 
});
