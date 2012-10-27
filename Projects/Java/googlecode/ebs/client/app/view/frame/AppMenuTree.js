Ext.define('ebs.view.frame.AppMenuTree', {
    extend: 'Ext.tree.Panel',
    alias: 'widget.appMenuTree',
    width: '100%',
    bodyBorder: false,
    border:0,
	initComponent:
		function(){
			var sysMenuList = window.sysMenuList;
			var root = this.getRoot(sysMenuList);
			this.addChildren(root, sysMenuList);
			Ext.apply(this, {
				root: root
			});
			this.callParent();
		},
	getRoot:
		function(sysMenuList) {
			var result = null;
			for (var i=0; i<sysMenuList.length; i++) {
				var sysMenu = sysMenuList[i];
				if (Ext.isEmpty(sysMenu.parentId)) {
					result = this.getNode(sysMenu);
					break;
				}
			}
			return result;
		},
	addChildren:
        function(root, sysMenuList) {
            var children = this.getNodes(root, sysMenuList);
            if (children.length>0) {
                 root.children = children;
                for (var i=0; i<children.length; i++) {
                    var child = children[i];
                    this.addChildren(child, sysMenuList);
                }
            } else {
                root.leaf = true;
            }
        },
	getNodes:
		function (parentNode, sysMenuList){
			var result = new Array();
            var m = 0;
            for (var i=0; i<sysMenuList.length; i++) {
                var sysMenu = sysMenuList[i];
                if (sysMenu.parentId == parentNode.id) { 
                    result[m] = this.getNode(sysMenu);
                    m++;
                }
            }
            return result;
		},
	getNode:
		function(sysMenu) {
			var node = 
                {
                    id: sysMenu.id,
                    text: sysMenu.name,
                    expanded: false,
                    sysMenu: sysMenu
                };
            return node;
		} 

 });
