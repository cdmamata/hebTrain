/**
 * 获得 body 的高度
 * @return {TypeName}
 */
function getBodyHeight(){
	var bodyHeight = document.body.scrollHeight;
	//var bodyHeight = document.documentElement.scrollHeight;
	return bodyHeight;
}
Ext.onReady(function(){
	Ext.ns("Heb");
	
	//空白背景图片
	Ext.BLANK_IMAGE_URL = "img/default/s.gif";
	
	/** 当前页面body宽度 **/
	var bodyWidth = document.body.scrollWidth;
	Heb.BodyWith = bodyWidth;
	
	/** body最小宽度 **/
	var miniWidth = 1024;
	
	/** 全局正文宽度指标 **/
	Heb.WidthQuota = bodyWidth/miniWidth;
	
	/** 重新设置 iframe 高度 **/
	Heb.setParentFrameHeight = function(customHeight){
		//当自定义高度时，停止定时器
		if(window.parent != window){
			window.parent.setFrameHeight(customHeight);
		}
	}
	
	/**
	 * 模拟的 alert 警告弹窗
	 * @param {String} title
	 * @param {String} msg
	 * @param {Number} y
	 */
	Heb.alert = function(title, msg, y){
		var alertWindow = Ext.create('Ext.window.Window', {
			title: title,
			maxWidth : 600,
			maxHeight : 500,
			minHeight : 110,
			minWidth : 250,
			autoShow : true,
			shrinkWrap : 3,
			border : false,
			bodyStyle: 'background: #E8E8E8;',
			modal: true,
			autoScroll : true,
			buttonAlign : 'center',
			y: y,
			html: msg,
			resizable : false,
			buttons: [{
				text: '确定',
				handler : function() {
					alertWindow.close();
				}
			}]
		});
	}
	
	/**
	 * 模拟的 confirm 确认警告弹窗
	 * @param {String} title
	 * @param {String} msg
	 * @param {Number} y
	 * @param {Function} callBack
	 */
	Heb.confirm = function(title, msg, y, callBack){
		var BTN_OK = "yes";
		var BTN_NO = "no";
		
		var htmlMsg = '<table><tr><td class="' + Ext.Msg.QUESTION + '" style="width: 32px; height: 32px;"></td><td style="font-size: 12px;">' + msg + '</td></tr></table>';
		
		var confirmWin = Ext.create('Ext.window.Window', {
			title: title,
			maxWidth : 600,
			maxHeight : 500,
			minHeight : 110,
			minWidth : 250,
			autoShow : true,
			shrinkWrap : 3,
			border : false,
			bodyStyle: 'background: #E8E8E8;',
			modal: true,
			autoScroll : true,
			buttonAlign : 'center',
			y: y,
			html: htmlMsg,
			resizable : false,
			buttons: [{
				text: '是',
				handler : function() {
					confirmWin.close();
					callBack(BTN_OK);
				}
			},{
				text: '否',
				handler : function() {
					confirmWin.close();
					callBack(BTN_NO);
				}
			}]
		});
	}
	
	/** 显示悬浮提示 **/
	Heb.showTips = function(value){
		//==>用tooltip浮窗,显示编码后单元格内的值
		//使用前先开启悬浮功能: Ext.QuickTips.init();
		var tips = 'data-qtip="' + Ext.String.htmlEncode(value) + '"';
		return tips;
	}
	
});

