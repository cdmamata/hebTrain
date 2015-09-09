Ext.onReady(function() {
	Ext.ns("Heb.funcfg");
	
	basicAction = "setting/functionConfig";
	
	/** ==================== combox ==================== **/
	Ext.define('functionCombModel', {
		extend : 'Ext.data.Model',
		fields : [
			{name : 'actionId', mapping : 'actionId',type : 'int'},
			{name : 'actionValue', mapping : 'actionValue', type : 'string'}
		]
	});
	
	/** function combox store **/
	var functionCombStore = Ext.create('Ext.data.Store', {
		model : 'functionCombModel',
		autoLoad: true,
		remoteSort: true,
		proxy: {
			type: 'ajax',
			url: basicAction + '_getActionCombx'
		},
		listeners: {
			load: function(store, records) {
				var firstOption = store.getAt(0);
				actionCombox.select(firstOption);
			}
		}
	});
	
	var actionCombox = Ext.create('Ext.form.ComboBox', {
		fieldLabel : 'action',
		labelWidth: 60,
		editable: false,
		allowBlank: false,
		blankText: 'action必选',
		store : functionCombStore,
		queryMode : 'local',
		displayField : 'actionValue',
		valueField : 'actionId',
		name: 'functionInfo.actionId'
	});
	
	
	/** ==================== 新增用户表单 ==================== **/
	/********** functionK唯一验证 **********/
	var functionKeyValidator = function(value, functionId){
		
		var flag = true;
		
		var parameters = {
			"functionInfo.k": value,
			"functionInfo.functionId": functionId
		}
		Ext.Ajax.request({
			url: basicAction + "_checkKUnique",
			method: "post",
			params: parameters,
			async: false,//必须为同步
			success: function(response, config){//message:true 验证成功，message:false 验证失败
				var resultJson = Ext.JSON.decode(response.responseText);
				flag = resultJson.message;
			}
		});
		return flag;
	}
	
	/** 用户表单默认提交参数 **/
	Heb.funcfg.functionFormSubmitConfig = {
		url : basicAction + '_insertFunction',
		success : function(form, action) {
			formSaveMask.hide();
			if(action.result.success == true){
				insertWin.close();
				
				functionStore.load();
				
				Heb.alert('保存成功', action.result.msg, 30);
			}else{
				Heb.alert('保存失败', action.result.msg, 30);
			}
		},
		failure : function(form, action) {
			formSaveMask.hide();
			Heb.alert('操作失败', "保存失败", 30);
		}
	};
	
	/** 新增/修改 表单 **/
	var insertFunctionForm = Ext.create('Ext.form.Panel', {
		bodyPadding : 5,
		width : 400,
		height: 200,
		bodyPadding: 20,
		layout : 'anchor',
		buttonAlign : 'center',
		defaultType : 'textfield',
		trackResetOnLoad: true,
		defaults: {
			anchor: '100%'
		},
		items : [
			actionCombox,
			{
				fieldLabel : '功能名称',
				labelWidth: 60,
				name : 'functionInfo.functionName',
				//inputType: 'password',
				allowBlank : false,
				blankText : '功能名称不能为空'
			},{
				fieldLabel : 'k',
				labelWidth: 60,
				name : 'functionInfo.k',
				allowBlank : false,
				blankText : "功能 k 不能为空",
				regex: /^[A-Za-z\d_]{1,10}$/,
				regexText: "1-10位字母数字或下划线",
				validateOnChange: false,  //失去焦点时才进行验证
				validator: function(value){
					var functionIdField = Ext.getCmp("functionIdHidden");
					//var sourceName = actionCombox.getValue();
					if(functionIdField != null){
						var functionId = functionIdField.getValue();
						
						if(value != ""){
							var result = functionKeyValidator(value, functionId);
							return result;
						}
					}
				}
			},{
				fieldLabel : '功能url',
				labelWidth: 60,
				name : 'functionInfo.functionUrl',
				allowBlank : false,
				blankText : 'url 不能为空'
			},{
				fieldLabel : 'index',
				labelWidth: 60,
				name : 'functionInfo.index',
				allowBlank : false,
				blankText : "index 不能为空",
				regex: /^[\d]+$/,
				regexText: "必须为数字"
			},{//functionId 隐藏域
				id: "functionIdHidden",
				//fieldLabel: "用户ID",
				hidden: true,
				name: "functionInfo.functionId"
			}
		],
		buttons : [{
			text : '保存',
			formBind : true, //only enabled once the form is valid
			disabled : true,
			handler : function() {
				formSaveMask.show();
			
				var form = this.up('form').getForm();
				if (form.isValid()) {
					form.submit(Heb.funcfg.functionFormSubmitConfig);
				}else{
					Heb.alert('警告', '输入有误！', 30);
				}
			}
		},{
			text : '取消',
			handler : function() {
				insertWin.close();
			}
		}]
	});
	
	/** ================= 插入新功能窗口 ============== **/
	var insertWin = Ext.create('Ext.window.Window', {
		title: '新增功能',
		closeAction : 'hide',//关闭时隐藏
		modal: true,
		y: 100,
		resizable : false,
		items: insertFunctionForm
	});
	
	/** 新增 **/
	var insertFunction = function(){
		insertWin.setTitle("新增功能");

		/** 设置url **/
		Heb.funcfg.functionFormSubmitConfig.url = basicAction + '_insertNewFunction';
		
		var actionId = functionCombStore.getAt(0).get('actionId');
		
		var valuesJson = {};
		valuesJson['functionInfo.actionId'] = actionId;
		valuesJson['functionInfo.functionName'] = '';
		valuesJson['functionInfo.k'] = '';
		valuesJson['functionInfo.functionUrl'] = 'page/example/functionExample.jsp';
		valuesJson['functionInfo.index'] = '10';
		valuesJson['functionInfo.functionId'] = '';
		
		insertFunctionForm.getForm().setValues(valuesJson);
		insertFunctionForm.getForm().reset();
		insertWin.show();
	}
	
	/** 修改 function **/
	var editFunction = function(){
		var selectRecord = functionGrid.getSelectionModel().getSelection();
		if(selectRecord.length == 0){
			Heb.alert('警告', "请选择要修改的行！", 30);
		}else if(selectRecord.length > 1){
			Heb.alert('警告', "只能选择一行！", 30);
		}else{
			var oneRecord = selectRecord[0];
			
			var actionId = oneRecord.get("actionId");
			var functionName = oneRecord.get("functionName");
			var k = oneRecord.get("k");
			var functionUrl = oneRecord.get("functionUrl");
			var index = oneRecord.get("index");
			var functionId = oneRecord.get("functionId");
			
			var valuesJson = {};
			
			valuesJson['functionInfo.actionId'] = actionId;
			valuesJson['functionInfo.functionName'] = functionName;
			valuesJson['functionInfo.k'] = k;
			valuesJson['functionInfo.functionUrl'] = functionUrl;
			valuesJson['functionInfo.index'] = index;
			valuesJson['functionInfo.functionId'] = functionId;
			
			insertWin.setTitle("功能修改");
		
			/** 设置url **/
			Heb.funcfg.functionFormSubmitConfig.url = basicAction + '_editFunctionInfo';
			
			insertFunctionForm.getForm().setValues(valuesJson);
			insertFunctionForm.getForm().reset();
			
			insertWin.show();
		}
	}
	
	/** 删除 function **/
	var deleteFunction = function(){
		var selectRecord = functionGrid.getSelectionModel().getSelection();
		if(selectRecord.length == 0){
			Heb.alert('警告', "请选择要修改的行！", 30);
		}else{
			Heb.confirm('警告','删除之后不可恢复，确定要删除吗？', 30, function(btn){
				if (btn == 'yes') {
					deleteMask.show();
					
					var functionIdArray = [];
					
					for(var i = 0; i<selectRecord.length; i++){
						var oneRecord = selectRecord[i];
						
						var functionId = oneRecord.get("functionId");
						
						functionIdArray.push(functionId);
					}
					
					var functionIdArrayStr = functionIdArray.join(",");
					
					var parameters = {};
					parameters["functionIdArrayStr"] = functionIdArrayStr;
					
					Ext.Ajax.request({
						url: basicAction + "_deleteFunctionInfo",
						method: "post",
						async : true,
						params: parameters,
						success: function(response, config){
							var resultJson = Ext.JSON.decode(response.responseText);
							
							if(resultJson.success == true){
								functionStore.load();
								
								Heb.alert('保存成功', resultJson.msg, 30);
							}else{
								Heb.alert('保存失败', resultJson.msg, 30);
							}
						},
						failure: function(){
							Heb.alert("失败", "请求失败", 30);
						},
						callback: function(options, success, response){
							deleteMask.hide();
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
		icon: Heb.icon.buildAdd,
		handler : function() {
			insertFunction();
		}
	},{
		xtype: 'button',
		text: '修改',
		icon: Heb.icon.buildEdit,
		handler : function() {
			editFunction();
		}
	},{
		xtype: 'button',
		text: '删除',
		icon: Heb.icon.buildDel,
		handler : function() {
			deleteFunction();
		}
	}];
	
	/** ========== 用户列 ========== **/
	var functionColumn = [
		{xtype: 'rownumberer'},
		{header: 'functionId', dataIndex: 'functionId', align: 'left', width: 100},
		{header: 'action', dataIndex: 'actionValue', align: 'left', width: 150},
		{header: '功能名称', dataIndex: 'functionName', align: 'left', width: 150},
		{header: '功能 url', dataIndex: 'functionUrl', align: 'left', width: 350},
		{header: 'k值', dataIndex: 'k', align: 'left', width: 100},
		{header: 'index', dataIndex: 'index', align: 'left', width: 100}
	];
	
	/** ========== store 需要使用的 model ========== **/
	Ext.define('functionModel', {
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
	
	/** ========== store ========== **/
	var functionStore = Ext.create('Ext.data.Store', {
		model : 'functionModel',
		autoLoad: true,
		proxy: {
			//simpleSortMode: true,
			type: 'ajax',
			url: basicAction + '_getFunctionList',
			reader: {
				type: 'json',
				root: 'items',
				totalProperty : 'total'
			}
		},
		listeners:{
			load: function(){
				//设置基本参数，防止刷新翻页时，参数丢失
				//Ext.apply(Heb.UserPurview.userPurviewStore.proxy.extraParams, Heb.UserPurview.userGridParameter);
			}
		}
	});
	
	var selModel = Ext.create('Ext.selection.CheckboxModel');
	
	/** ========== 功能配置表格 ========== **/
	var functionGrid = Ext.create('Ext.grid.Panel', {
		title : '功能配置',
		border : true,
		//height: 1000,
		//autoScroll : true,
		width : 1024,
		store : functionStore,
		tbar : functionTopButton,
		//bbar : pageBar,  //分页工具栏
		columns : functionColumn,
		selModel: selModel,//多选框
		stripeRows: true,  //斑马线
		renderTo: 'functionConfigDiv',
		viewConfig : {
			loadMask: true
		}
		//renderTo: Ext.getBody()
	});
	
	var deleteMask = new Ext.LoadMask(Ext.getBody(), {msg: "正在删除..."});
	
	var formSaveMask = new Ext.LoadMask(insertWin, {msg: "正在保存..."});
});