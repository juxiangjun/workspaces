
Ext.define('ebs.view.frame.Ebs', {
  extend: 'Ext.container.Viewport',
    
    config: {
		sessionId: ''
    },

    constructor: function(config) {
        this.callParent(arguments);
        this.initConfig(config);
    },

  	initComponent: function(){
        Ext.apply(this, {
            layout: 'border',
            padding: 0,
            items: 
            [
	            this.createNorthPanel(), 
	        	this.createWestPanel(), 
	            this.createMainPanel(), 
	            this.createEastPanel(),
				this.createSouthPanel()
	        ],
			bbar: {xtype: 'statusbar'}
        });
        this.callParent(arguments);
    },

	createNorthPanel: 
		function(){
			this.northPanel = Ext.create('ebs.view.frame.NorthPanel', {
				region: 'north',
				collapsible: false,
				width: 225,
				floatable: true,
				split: false,
				minWidth: 175
			});
			
			return this.northPanel;
	  	},
	createMainPanel: 
		function(){
	        this.mainPanel = Ext.create('ebs.view.frame.MainPanel', {
	            region: 'center',
				minWidth: 300
			});
	        return this.mainPanel;
	  	},
	createWestPanel: 
		function(){
	        this.westPanel = Ext.create('ebs.view.frame.WestPanel', {
	            region: 'west',
	            collapsible: true,
	            width: 225,
	            floatable: false,
	            split: true,
	            minWidth: 175
	        });
	        return this.westPanel;
	  	},
	createEastPanel: 
		function(){
	        this.eastPanel = Ext.create('ebs.view.frame.EastPanel', {
	            region: 'east',
	            collapsible: true,
	            width: 225,
	            floatable: true,
				collapsed: true,
	            split: true,
	            minWidth: 175
	        });
	        return this.eastPanel;
	  	},
	createSouthPanel: 
		function(){
	        this.southPanel = Ext.create('ebs.view.frame.SouthPanel', {
	            region: 'south',
	            floatable: true
	        });
	        return this.southPanel;
	  	}
});
