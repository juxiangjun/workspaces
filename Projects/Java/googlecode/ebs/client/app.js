Ext.Loader.setConfig({enabled:true});

Ext.application({
    name: 'ebs',
    requires: ['Ext.data.JsonP', 'Ext.window.MessageBox'],  
    appFolder: 'app',
    //初始化环境变量  
    init:
        function() {
            var mainController = this.getController('MainController');
            mainController.initialize();
        },  
    //加载controllers
    controllers: [
        'ebs.controller.MainController'
    ],  
    //启动程序
    launch: function() {
        this.init();
    }   
});
