Ext.onReady(function() {
	basicAction = "setting/userConfig";
	
	Heb.usercfg.userFunctionParameter = {};
	
	/** ========== 通用权限 model ========== **/
	Ext.define('userFunctionModel', {
		extend : 'Ext.data.Model',
		fields : [
			{name : 'functionId', mapping : 'functionId', type : 'int'},
			{name : 'k', mapping : 'k', type : 'string'},
			{name : 'functionName', mapping : 'functionName', type : 'string'},
			{name : 'functionUrl', mapping : 'functionUrl', type : 'string'},
			{name : 'index', mapping : 'index',type : 'int'},
			{name : 'actionId', mapping : 'actionId', type : 'int'},
			{name : 'actionValue', mapping : 'actionValue', type : 'string'}
		]
	});
	
	/** ======================================== 添加新功能列表 ======================================== **/
	
	var addFunction = function(){
		var selectRecord = functionAddGrid.getSelectionModel().getSelection();
		if(selectRecord.length == 0){
			Heb.alert('警告', "至少选择一行！", 30);
		}else{
			var funAddSave = {};
			//Heb.usercfg.userFunctionParameter
			var userId = Heb.usercfg.userFunctionParameter["loginUser.userId"];
			
			for(var i = 0; i<selectRecord.length; i++){
				var oneRecord = selectRecord[i];
				
				var functionId = oneRecord.get("functionId");
				
				funAddSave["functionInfoList[" + i + "].userId"] = userId;
				funAddSave["functionInfoList[" + i + "].functionId"] = functionId;
			}
			funAddMask.show();
			
			Ext.Ajax.request({
				url: basicAction + "_addUserFunction",
				method: "post",
				async : true,
				params: funAddSave,
				success: function(response, config){
					var resultJson = Ext.JSON.decode(response.responseText);
					
					if(resultJson.success == true){
						userFunctionStore.load();
						functionAddWin.hide();
						Heb.alert('保存成功', resultJson.msg, 30);
					}else{
						Heb.alert('保存失败', resultJson.msg, 30);
					}
				},
				failure: function(){
					Heb.alert("失败", "请求失败");
				},
				callback: function(options, success, response){
					funAddMask.hide();
				}
			});
		}
	}
	
	/** 按钮工具栏 **/
	var funAddTopButton = ["->",{
		xtype: 'button',
		text: '保存',
		icon: Heb.icon.btnYes,
		handler : function() {
			addFunction();
		}
	}]
	
	/** 添加功能 store **/
	var functionAddStore = Ext.create('Ext.data.Store', {
		model : 'userFunctionModel',
		proxy: {
			//simpleSortMode: true,
			type: 'ajax',
			url: basicAction + '_getHaventFunction',
			reader: {
				type: 'json',
				root: 'items'
			}
		},
		listeners:{
			load: function(store, records){
				var totalLength = records.length;
				
				var innerHtml = "没有数据";
				if(totalLength > 0){
					innerHtml = "共有 <span style='color: #0000FF'>" + totalLength + "</span> 条数据";
				}
				Ext.get("funAddBarDiv").setHTML(innerHtml);
			}
		}
	});
	
	/** 添加权限列 ========== **/
	var functionAddColumn = [
		{xtype: 'rownumberer'},
		{header: 'functionId', dataIndex: 'functionId', align: 'left', width: 100},
		{header: '功能名称', dataIndex: 'functionName', align: 'left', width: 150},
		{header: 'action', dataIndex: 'actionValue', align: 'left', width: 150},
		{header: '功能 url', dataIndex: 'functionUrl', align: 'left', width: 350},
		{header: 'k值', dataIndex: 'k', align: 'left', width: 100},
		{header: 'index', dataIndex: 'index', align: 'left', width: 100}
	]
	
	/** 底部工具栏 **/
	var funAddDisplayBar = [
		'->',
		{ xtype: 'tbtext', text: '<div id="funAddBarDiv" style="width: 200px; height: 18px; text-align: right;"></div>' }
	]
	
	/** 多选框 **/
	var funAddSelModel = Ext.create('Ext.selection.CheckboxModel');
	
	/** 未添加的权限列表 **/
	var functionAddGrid = Ext.create('Ext.grid.Panel', {
		border : true,
		width : 1024,
		store : functionAddStore,
		tbar : funAddTopButton,
		bbar : funAddDisplayBar,  //显示多少条
		columns : functionAddColumn,
		selModel: funAddSelModel,  //多选框
		stripeRows: true,  //斑马线
		viewConfig : {
			loadMask: true
		}
	});
	
	/** 插入新用户窗口 **/
	var functionAddWin = Ext.create('Ext.window.Window', {
		title: '请选择所要添加的权限',
		closeAction : 'hide',//关闭时隐藏
		modal: true,
		y: 100,
		resizable : false,
		items: functionAddGrid
	});
	
	/** ======================================== 用户权限列表 ======================================== **/
	
	/** 新增用户权限 **/
	var showAddWin = function(){
		functionAddWin.show();
		
		functionAddStore.load({params: Heb.usercfg.userFunctionParameter});
	}
	
	/** 删除用户权限 **/
	var deleteUserFunction = function(){
		var selectRecord = userFunctionGrid.getSelectionModel().getSelection();
		if(selectRecord.length == 0){
			Heb.alert('警告', "请选择要修改的行！", 30);
		}else{
			Heb.confirm('警告','删除之后不可恢复，确定要删除吗？', 30, function(btn){
				if (btn == 'yes') {
					funDeleteMask.show();
					var userId = Heb.usercfg.userFunctionParameter["loginUser.userId"];
					
					var functionIdArray = [];
					
					for(var i = 0;i<selectRecord.length;i++){
						var oneRecord = selectRecord[i];
						
						var menuId = oneRecord.get("functionId");
						
						functionIdArray.push(menuId);
					}
					
					var functionIdArrayStr = functionIdArray.join(",");
					
					var parameters = {};
					parameters["intIdArrayStr"] = functionIdArrayStr;
					parameters["loginUser.userId"] = userId;
					
					Ext.Ajax.request({
						url: basicAction + "_deleteUserFunction",
						method: "post",
						async : true,
						params: parameters,
						success: function(response, config){
							var resultJson = Ext.JSON.decode(response.responseText);
							
							if(resultJson.success == true){
								userFunctionStore.load();
								Heb.alert('删除成功', resultJson.msg, 30);
							}else{
								Heb.alert('删除失败', resultJson.msg, 30);
							}
						},
						failure: function(){
							Heb.alert("失败", "请求失败");
						},
						callback: function(options, success, response){
							funDeleteMask.hide();
						}
					});
				}
			});
		}
	}
	
	
	/** 按钮工具栏 **/
	var functionTopButton = [{
		xtype: 'button',
		text: '新增',
		icon: Heb.icon.iconAdd,
		handler : function() {
			showAddWin();
		}
	},{
		xtype: 'button',
		text: '删除',
		icon: Heb.icon.btnCancle,
		handler : function() {
			deleteUserFunction();
		}
	}];
	
	/** 用户权限列 **/
	var userFunctionColumn = [
		{xtype: 'rownumberer'},
		{header: 'functionId', dataIndex: 'functionId', align: 'left', width: 100},
		{header: '功能名称', dataIndex: 'functionName', align: 'left', width: 150},
		{header: 'action', dataIndex: 'actionValue', align: 'left', width: 150},
		{header: '功能 url', dataIndex: 'functionUrl', align: 'left', width: 350},
		{header: 'k值', dataIndex: 'k', align: 'left', width: 100},
		{header: 'index', dataIndex: 'index', align: 'left', width: 100}
	];
	
	/** store **/
	var userFunctionStore = Ext.create('Ext.data.Store', {
		model : 'userFunctionModel',
		proxy: {
			//simpleSortMode: true,
			type: 'ajax',
			url: basicAction + '_getUserFunction',
			reader: {
				type: 'json',
				root: 'items'
			}
		},
		listeners:{
			load: function(store, records){
				var totalLength = records.length;
				
				//设置基本参数，防止刷新翻页时，参数丢失
				Ext.apply(userFunctionStore.proxy.extraParams, Heb.usercfg.userFunctionParameter);
				
				var innerHtml = "没有数据";
				if(totalLength > 0){
					innerHtml = "共有 <span style='color: #0000FF'>" + totalLength + "</span> 条数据";
				}
				Ext.get("displayBarDiv").setHTML(innerHtml);
			}
		}
	});
	
	/** 底部工具栏 **/
	var displayBar = [
		'->',
		{ xtype: 'tbtext', text: '<div id="displayBarDiv" style="width: 200px; height: 18px; text-align: right;"></div>' }
	]
	
	/** 多选框 **/
	var functionSelModel = Ext.create('Ext.selection.CheckboxModel');
	
	/** 用户表格 **/
	var userFunctionGrid = Ext.create('Ext.grid.Panel', {
		border : true,
		width : 1024,
		height : 600,
		autoScroll : true,
		resizable : false,
		store : userFunctionStore,
		tbar : functionTopButton,
		bbar : displayBar,  //显示多少条
		columns : userFunctionColumn,
		selModel: functionSelModel,  //多选框
		stripeRows: true,  //斑马线
		viewConfig : {
			loadMask: true
		}
		//renderTo: Ext.getBody()
	});
	
	var userFunctionWin = Ext.create('Ext.window.Window', {
		title: '用户权限列表',
		closeAction : 'hide',//关闭时隐藏
		modal: true,
		y: 100,
		resizable : false,
		items: userFunctionGrid
	});
	
	/** ==================== 显示窗口 ==================== **/
	/** 显示用户权限列表 **/
	showUserFuction = function(userId, userName, name){
		var rcs = "<span style='color: red;'>";
		var rce = "</span>"
		var winTitle = "客户名称 : " + rcs + name + rce + " | 用户名 : " + rcs + userName + rce;
		
		userFunctionWin.setTitle("用户权限列表 —— " + winTitle);
		
		userFunctionWin.show();
		
		/** gridPanel 加载参数 **/
		Heb.usercfg.userFunctionParameter = {
			"loginUser.userId" : userId
		};
		userFunctionStore.load({params: Heb.usercfg.userFunctionParameter});
	}
	
	var funDeleteMask = new Ext.LoadMask(userFunctionWin, {msg: "正在删除..."});
	var funAddMask = new Ext.LoadMask(functionAddWin, {msg: "正在保存..."});
});