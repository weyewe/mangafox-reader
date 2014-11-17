Ext.define('AM.model.Chapter', {
  	extend: 'Ext.data.Model',
  	fields: [
 

    	{ name: 'id', type: 'int' },
			{ name: 'comic_id', type: 'int' },
			{ name: 'comic_name', type: 'string' },
			
			{ name: 'chapter', type: 'string' },
    	{ name: 'volume', type: 'string' } ,
			{ name: 'initial_link', type: 'string' }  
			
			
  	],

	 


   
  	idProperty: 'id' ,proxy: {
			url: 'api/chapters',
			type: 'rest',
			format: 'json',

			reader: {
				root: 'chapters',
				successProperty: 'success',
				totalProperty : 'total'
			},

			writer: {
				getRecordData: function(record) {
					return { chapter : record.data };
				}
			}
		}
	
  
});
