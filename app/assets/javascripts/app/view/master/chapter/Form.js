Ext.define('AM.view.master.chapter.Form', {
  extend: 'Ext.window.Window',
  alias : 'widget.chapterform',

  title : 'Add / Edit Chapter',
  layout: 'fit',
	width	: 500,
  autoShow: true,  // does it need to be called?
	modal : true, 
// win.show() 
// if autoShow == true.. on instantiation, will automatically be called 
	
  initComponent: function() {
		var me = this; 
	  
		
		
    this.items = [{
      xtype: 'form',
			msgTarget	: 'side',
			border: false,
      bodyPadding: 10,
			fieldDefaults: {
          labelWidth: 165,
					anchor: '100%'
      },


      items: [
				{
	        xtype: 'hidden',
	        name : 'id',
	        fieldLabel: 'id'
	      },
				{
	        xtype: 'hidden',
	        name : 'comic_id',
	        fieldLabel: 'Comic ID'
	      },
				{
					xtype: 'displayfield',
					fieldLabel: 'Comic',
					name: 'comic_name' ,
					value : '10' 
				}   , 
				{
					xtype: 'textfield',
					name : 'volume',
					fieldLabel: 'Volume'
				},
				{
					xtype: 'textfield',
					name : 'chapter',
					fieldLabel: 'Chapter'
				},
				{
					xtype: 'textfield',
					name : 'initial_link',
					fieldLabel: 'Initial Link'
				},
				
				
				 
				
			]
    }];

    this.buttons = [{
      text: 'Save',
      action: 'save'
    }, {
      text: 'Cancel',
      scope: this,
      handler: this.close
    }];

    this.callParent(arguments);
 
  },
  
	setParentData: function( record ){
		this.down('form').getForm().findField('comic_name').setValue(record.get('name')); 
		this.down('form').getForm().findField('comic_id').setValue(record.get('id')); 
	},
});

