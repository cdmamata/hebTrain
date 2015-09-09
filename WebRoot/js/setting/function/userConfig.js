Ext.onReady(function() {
	Ext.ns("Heb.usercfg");
	
	basicAction = "setting/userConfig";
	
	/** gridPanel 加载参数 **/
	Heb.usercfg.userGridParameter = {};
	
	/** 登录名合法验证 **/
	var loginNameValidator = function(value, userId){
		/********** 登录名唯一验证 **********/
		var flag = true;
		
		var parameters = {
			"loginUser.userName": value,
			"loginUser.userId": userId
		}
		Ext.Ajax.request({
			url: basicAction + "_checkUserName",
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
	
	/** ==================== customer combobox ==================== **/
	Ext.define('customerCombModel', {
		extend : 'Ext.data.Model',
		fields : [
			{name : 'cusId', mapping : 'cusId', type : 'int'},
			{name : 'cusName', mapping : 'cusName', type : 'string'}
		]
	});
	
	var customerCombStore = Ext.create('Ext.data.Store', {
		model : 'customerCombModel',
		autoLoad: true,
		proxy: {
			type: 'ajax',
			url: basicAction + '_getCustomerComb'
		},
		listeners: {
			load: function(store, records) {
				var firstOption = store.getAt(0);
				customerComb.select(firstOption);
			}
		}
	});
	
	/** 客户conbox **/
	var customerComb = Ext.create('Ext.form.ComboBox', {
		fieldLabel : '客户名称',
		labelWidth: 60,
		editable: false,
		allowBlank: false,
		blankText: '客户名称必选',
		store : customerCombStore,
		queryMode : 'local',
		displayField : 'cusName',
		valueField : 'cusId',
		name: 'loginUser.cusId'
	});
	
	/** ==================== 启用/禁用 combobox ==================== **/
	Ext.define('statusCombModel', {
		extend : 'Ext.data.Model',
		fields : [
			{name : 'status', mapping : 'status',type : 'int'},
			{name : 'name', mapping : 'name', type : 'string'}
		]
	});
	
	var statusCombStore = Ext.create('Ext.data.Store', {
		model : 'statusCombModel',
		data : [
			{"status" : 1, "name" : "启用"},
			{"status" : 0, "name" : "禁用"}
		]
	});
	
	/** status comboBox **/
	var statusComboBox = Ext.create('Ext.form.ComboBox', {
		fieldLabel : '状态',
		labelWidth: 60,
		editable: false,
		allowBlank: false,
		blankText: '状态必选',
		store : statusCombStore,
		queryMode : 'local',
		displayField : 'name',
		valueField : 'status',
		name: 'loginUser.status'
	});
	
	/** ==================== 表单 ==================== **/
	/** 客户表单默认提交参数 **/
	Heb.usercfg.userFormSubmitConfig = {
		url : basicAction + '_insertUser',
		success : function(form, action) {
			formSaveMask.hide();
			if(action.result.success == true){
				insertWin.close();
				
				var cusId = customerComb.getValue();
				
				Heb.usercfg.userGridParameter = {
					node : cusId
				};
				
				userPurviewStore.load({params: Heb.usercfg.userGridParameter});
				
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
	
	/** 新增用户表单 **/
	var insertUserForm = Ext.create('Ext.form.Panel', {
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
			customerComb,
		{
			fieldLabel : '登录名',
			labelWidth: 60,
			name : 'loginUser.userName',
			allowBlank : false,
			blankText : "登录名不能为空",
			regex: /^[A-Za-z\d_]{3,18}$/,
			regexText: "必须为 3-18 位字母数字或下划线",
			validateOnChange: false,  //失去焦点时才进行验证
			validator: function(value){
				if(value != ""){
					var userIdField = Ext.getCmp("userId");
					
					if(userIdField != null){
						var userId = userIdField.getValue();
						
						var result = loginNameValidator(value, userId);
						return result;
					}
				}
			}
		}, {
			id : 'showPasswordField',
			fieldLabel : '密&nbsp;&nbsp;&nbsp;码',
			labelWidth: 60,
			//name : 'loginUser.password',
			inputType: 'password',
			allowBlank : false,
			blankText : '密码不能为空',
			regex : /^[\w@#]{3,18}$/,
			regexText:"密码必须为字母数字@#_等字符"
		},{
			fieldLabel : '确认密码',
			labelWidth: 60,
			inputType: 'password',
			//name : 'confirmPassword',
			allowBlank : false,
			validator: function(value){
				var password = this.previousSibling().value;
				if(value != password){
					return '两次输入的密码不一致';
				}else{
					return true;
				}
			}
		},
			statusComboBox,
		{//userId 隐藏域
			id: "userId",
			//fieldLabel: "用户ID",
			hidden: true,
			name: "loginUser.userId"
		},{//password 隐藏域
			id: "encryptPasswordField",
			fieldLabel: "密码",
			hidden: false,
			name: "loginUser.password"
		}],
		buttons : [{
			text : '保存',
			formBind : true, //only enabled once the form is valid
			disabled : true,
			handler : function() {
				formSaveMask.show();
			
				var form = this.up('form').getForm();
				if (form.isValid()) {
					
					var password = Ext.getCmp("showPasswordField").getValue();
					//加密密码
					var encryptPassword = hex_sha1(password);
					
					Ext.getCmp("encryptPasswordField").setValue(encryptPassword);
					
					form.submit(Heb.usercfg.userFormSubmitConfig);
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
	
	/** 插入新用户窗口 **/
	var insertWin = Ext.create('Ext.window.Window', {
		title: '新增用户',
		closeAction : 'hide',//关闭时隐藏
		modal: true,
		y: 100,
		resizable : false,
		items: insertUserForm
	});
	
	/** 插入新用户 **/
	var insertUser = function(){
		insertWin.setTitle("新增用户");
		
		customerComb.setReadOnly(false);
		
		/** 设置url **/
		Heb.usercfg.userFormSubmitConfig.url = basicAction + '_insertUser';
		
		var cusId = customerCombStore.getAt(0).get('cusId');
		var status = statusCombStore.getAt(0).get('status');
		
		var valuesJson = {};
		valuesJson['loginUser.cusId'] = cusId;
		valuesJson['loginUser.userName'] = '';
		valuesJson['loginUser.password'] = '';
		valuesJson['loginUser.userId'] = '';
		valuesJson['loginUser.status'] = status;
		
		insertUserForm.getForm().setValues(valuesJson);
		insertUserForm.getForm().reset();
		insertWin.show();
	}
	
	/** 修改用户 **/
	var editUser = function(){
		var selectRecord = userPurviewGrid.getSelectionModel().getSelection();
		if(selectRecord.length == 0){
			Heb.alert('警告', "请选择要修改的行！", 30);
		}else if(selectRecord.length > 1){
			Heb.alert('警告', "只能选择一行！", 30);
		}else{
			var oneRecord = selectRecord[0];
			
			
			var cusId = oneRecord.get("cusId");
			var userName = oneRecord.get("userName");
			var userId = oneRecord.get("userId");
			var status = oneRecord.get("status");
			
			var valuesJson = {};
			valuesJson['loginUser.cusId'] = cusId;
			valuesJson['loginUser.userName'] = userName;
			valuesJson['loginUser.password'] = '';
			valuesJson['loginUser.userId'] = userId;
			valuesJson['loginUser.status'] = status;
			
			insertWin.setTitle("修改用户");
		
			/** 设置url **/
			Heb.usercfg.userFormSubmitConfig.url = basicAction + '_editUser';
			
			customerComb.setReadOnly(true);
	
			insertUserForm.getForm().setValues(valuesJson);
			insertUserForm.getForm().reset();
			
			insertWin.show();
		}
	}
	
	/** deleteUser **/
	var deleteUser = function(){
		var selectRecord = userPurviewGrid.getSelectionModel().getSelection();
		if(selectRecord.length == 0){
			Heb.alert('警告', "请选择要修改的行！", 30);
		}else{
			Heb.confirm('警告','删除之后不可恢复，确定要删除吗？', 30, function(btn){
				if (btn == 'yes') {
					var userIdArray = [];
					
					for(var i = 0;i<selectRecord.length;i++){
						var oneRecord = selectRecord[i];
						
						var userId = oneRecord.get("userId");
						
						userIdArray.push(userId);
					}
					
					var userIdArrayStr = userIdArray.join(",");
					
					var parameters = {};
					parameters["userIdArrayStr"] = userIdArrayStr;
					
					deleteMask.show();
		
					Ext.Ajax.request({
						url: basicAction + "_deleteUser",
						method: "post",
						async : true,
						params: parameters,
						success: function(response, config){
							var resultJson = Ext.JSON.decode(response.responseText);
							
							if(resultJson.success == true){
								userPurviewStore.load({params: Heb.usercfg.userGridParameter});
								
								Heb.alert('删除成功', resultJson.msg, 30);
							}else{
								Heb.alert('删除失败', resultJson.msg, 30);
							}
						},
						failure: function(){
							Ext.MessageBox.alert("失败", "请求失败");
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
	var panelTopButton = [{
		xtype: 'button',
		text: '新增',
		icon: Heb.icon.userAdd,
		handler : function() {
			insertUser();
		}
	},{
		xtype: 'button',
		text: '修改',
		icon: Heb.icon.userEdit,
		handler : function() {
			editUser();
		}
	},{
		xtype: 'button',
		text: '删除',
		icon: Heb.icon.userDelete,
		handler : function() {
			deleteUser();
		}
	}];
	
	/** ========== 用户列 ========== **/
	var userPurviewColumn = [
		{xtype: 'rownumberer'},
		{header : '用户id',dataIndex : 'userId',align: 'center',width : 80 * Heb.WidthQuota},
		{header : '登录名',dataIndex : 'userName',align: 'center',width : 80 * Heb.WidthQuota},
		{header : 'cusId',dataIndex : 'cusId',align: 'center',width : 80 * Heb.WidthQuota},
		{header : '客户名称',dataIndex : 'cusName',align: 'center',width : 80 * Heb.WidthQuota},
		{header : '客户标识',dataIndex : 'act',align: 'center',width : 80 * Heb.WidthQuota},
		{header : '状态', dataIndex : 'status', align: 'center', width : 100 * Heb.WidthQuota, renderer: function(value, cellmeta, record){
			var resultStatus = '<div style="color: red; font-weight: bolder;">禁用</div>';
			if(value == 1){
				resultStatus = '<div style="color: green; font-weight: bolder;">启用</div>';
			}
			return resultStatus;
		}},{header : '操作',align: 'center',width : 80 * Heb.WidthQuota, renderer : function(value, cellmeta, record){
			
			var userId = record.data["userId"];
			
			var userName = record.data["userName"];
			var cusName = record.data["cusName"];
			
			var buttonHtml = "<span class='extSpButton'>";
			buttonHtml = buttonHtml + "<a href='javascript:void(0)' onclick='showUserFuction(\"" + userId + "\", \"" + userName + "\", \"" + cusName + "\")'>查看权限</a></span>";
			return buttonHtml;
		}}
	]
	
	/** store 需要使用的 model **/
	Ext.define('userPurviewModel', {
		extend : 'Ext.data.Model',
		fields : [
			{name : 'userId',mapping : 'userId',type : 'int'},
			{name : 'userName',mapping : 'userName',type : 'string'},
			{name : 'status',mapping : 'status',type : 'int'},
			{name : 'cusId',mapping : 'cusId',type : 'int'},
			{name : 'cusName',mapping : 'cusName',type : 'string'},
			{name : 'act',mapping : 'act',type : 'string'}
		]
	});
	
	/** store **/
	var userPurviewStore = Ext.create('Ext.data.Store', {
		model : 'userPurviewModel',
		pageSize : 50,
		proxy: {
			//simpleSortMode: true,
			type: 'ajax',
			url: basicAction + '_getCustomerUser',
			reader: {
				type: 'json',
				root: 'items',
				totalProperty : 'total'
			}
		},
		listeners:{
			load: function(){
				//设置基本参数，防止刷新翻页时，参数丢失
				Ext.apply(userPurviewStore.proxy.extraParams, Heb.usercfg.userGridParameter);
			}
		}
	});
	
	/** ========== 分页工具栏 ========== **/
	var pageBar = Ext.create('Ext.toolbar.Paging', {
		store: userPurviewStore,
		displayInfo: true,
		displayMsg: '显示 {0} - {1} 条，共计 {2} 条',
		emptyMsg: "没有数据"
	});
	
	/** 多选框 **/
	var selModel = Ext.create('Ext.selection.CheckboxModel');
	
	/** 用户表格 **/
	var userPurviewGrid = Ext.create('Ext.grid.Panel', {
		title : '用户列表',
		border : false,
		//height: 1000,
		//autoScroll : true,
		width : Heb.BodyWith - 410,
		store : userPurviewStore,
		tbar : panelTopButton,
		bbar : pageBar,  //分页工具栏
		columns : userPurviewColumn,
		selModel: selModel,//多选框
		stripeRows: true,  //斑马线
		renderTo: 'userPurviewDiv',
		viewConfig : {
			loadMask: true
		}
		//renderTo: Ext.getBody()
	});
	
	/** ============================== customer 树 ============================== **/
	/** root node **/
	var customerTreeRoot = {id: "0", text: "所有客户", leaf: false };
	
	/**
	 * customer 树 stroe
	 * @param {Object} response
	 * @param {Object} config
	 */
	var customerTreestore = Ext.create('Ext.data.TreeStore', {
		proxy: {
			type: 'ajax',
			url: basicAction + '_getCustomerTree'
		},
		root : {
			expanded : true,
			children : customerTreeRoot
		}
	});
	
	/** customer 树 **/
	var customerTreePanel = Ext.create('Ext.tree.Panel', {
		title : '平台客户列表',
		border : false,
		animate: true,
		//height: 1000,
		//autoScroll : true,
		width : 400,
		store : customerTreestore,
		rootVisible : false,
		renderTo: 'customerTreeDiv',
		listeners : {
			afterrender: function(){
				var firstNode = this.getRootNode().getChildAt(0);
				this.getSelectionModel().select(firstNode)
				this.getRootNode().expand(true);
			},
			select : function(rowModel,record,index){
				var nodeId = record.raw.id;
				
				console.log(nodeId);
				
				/** gridPanel 加载参数 **/
				Heb.usercfg.userGridParameter = {
					node : nodeId
				};
				userPurviewStore.load({params: Heb.usercfg.userGridParameter});
			}
		}
	});
	
	var deleteMask = new Ext.LoadMask(Ext.getBody(), {msg: "正在删除..."});
	var formSaveMask = new Ext.LoadMask(insertWin, {msg: "正在保存..."});
});