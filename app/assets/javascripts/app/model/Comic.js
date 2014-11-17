Ext.define('AM.model.Comic', {
  	extend: 'Ext.data.Model',
  	fields: [
    	{ name: 'id', type: 'int' },
			{ name: 'name', type: 'string' },
			{ name: 'vanity_name', type: 'string' },
		 
  	],

	 


   
  	idProperty: 'id' ,proxy: {
			url: 'api/comics',
			type: 'rest',
			format: 'json',

			reader: {
				root: 'comics',
				successProperty: 'success',
				totalProperty : 'total'
			},

			writer: {
				getRecordData: function(record) {
					return { comic : record.data };
				}
			}
		}
	
  
});
