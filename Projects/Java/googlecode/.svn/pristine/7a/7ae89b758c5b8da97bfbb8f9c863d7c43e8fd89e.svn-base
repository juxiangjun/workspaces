
Ext.define("Post", {
        extend: 'Ext.data.Model',
        proxy: {
            type: 'jsonp',
            url : 'http://www.sencha.com/forum/topics-remote.php',
            reader: {
                type: 'json',
                root: 'topics',
                totalProperty: 'totalCount'
            }
        },

        fields: [
            {name: 'id', mapping: 'post_id'},
            {name: 'title', mapping: 'topic_title'},
            {name: 'topicId', mapping: 'topic_id'},
            {name: 'author', mapping: 'author'},
            {name: 'lastPost', mapping: 'post_time', type: 'date', dateFormat: 'timestamp'},
            {name: 'excerpt', mapping: 'post_text'}
        ]
});

Ext.define('ebs.view.frame.EastPanel', {
    extend: 'Ext.panel.Panel',
    	region: 'east',
    	alias: 'widget.eastPanel',
        collapsible: true,
        width: 125,
        floatable: false,
        split: true,
        minWidth: 75,
        title: 'Search the Ext Forums',
        width: 600,
        bodyPadding: 10,
        layout: 'anchor',
		initComponent: function() {
			
			
			ds = Ext.create('Ext.data.Store', {
		        pageSize: 10,
		        model: 'Post'
    		});

			Ext.apply(this, {
		        items: [
		        	{
		        		xtype: 'textfield',
		        		itemId: 'tfPostId'
		        	},
		        	{
		            xtype: 'combo',
		            store: ds,
		            displayField: 'title',
		            valueField: 'id',
		            typeAhead: false,
		            hideLabel: true,
		            hideTrigger:true,
		            itemId: 'cbTitle',
		            anchor: '100%',
		            minChars: 2,
		
		            listConfig: {
		                loadingText: 'Searching...',
		                emptyText: 'No matching posts found.',
		
		                // Custom rendering template for each item
		                getInnerTpl: function() {
		                    return '<a class="search-item" href="#">' +
		                        '<h3><span>{[Ext.Date.format(values.lastPost, "M j, Y")]}<br />by {author}</span>{title}</h3>' +
		                        '{excerpt}' +
		                    '</a>';
		                }
		            },
		            listeners: {        
				        select: {
				            //element: 'el', //bind to the underlying el property on the panel
				            scope: this,
				            fn: function(combo, record, index){
				            	
				            	var data = record[0].data;
				            	var tfPostId = this.down('#tfPostId');
				            	tfPostId.setRawValue(data.id);
				            	tfPostId.value = data.id;
				            	
				            	
				            }
				        }
				    },
		            pageSize: 10
		        }, {
		            xtype: 'component',
		            style: 'margin-top:10px',
		            html: 'Live search requires a minimum of 4 characters.'
		        }]
		       });

		   this.callParent();
		}
})
