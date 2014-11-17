Ext.define('AM.store.Chapters', {
	extend: 'Ext.data.Store',
	require : ['AM.model.Chapter'],
	model: 'AM.model.Chapter',
	// autoLoad: {start: 0, limit: this.pageSize},
	autoLoad : false, 
	autoSync: false,
	pageSize : 50, 
	
	sorters : [
		{
			property	: 'id',
			direction	: 'DESC'
		}
	], 
	listeners: {

	} 
});
