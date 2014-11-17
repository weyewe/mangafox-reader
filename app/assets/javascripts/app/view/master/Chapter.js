Ext.define('AM.view.master.Chapter', {
    extend: 'AM.view.Worksheet',
    alias: 'widget.chapterProcess',
	 
		layout : {
			type : 'hbox',
			align : 'stretch'
		},
		header: false, 
		headerAsText : false,
		selectedParentId : null,
		
		items : [
		// list of group loan.. just the list.. no CRUD etc
			{
				xtype : 'mastercomicList',
				flex : 1
			},
			
			{
				xtype : 'chapterlist',
				flex : 2
			}, 
		]
});