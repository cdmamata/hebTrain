<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!-- 引入此包时，不需在单独引入 jquery -->
<jsp:include page="/page/common/util/jquery-loder.jsp" flush="true" />

<link rel="stylesheet" type="text/css" href="<%=path%>/js-lib/MetroJS/MetroJs.css" />
<script type="text/javascript" src="<%=path%>/js-lib/MetroJS/MetroJs.js"></script>

<!-- 
<link rel="stylesheet" type="text/css" href="<%=path%>/js-lib/MetroJS/MetroJs.min.css" />
<script type="text/javascript" src="<%=path%>/js-lib/MetroJS/MetroJs.min.js"></script>
-->

<script type="text/javascript">
	/** 获得mode随机模式 **/
	function getRandomMetroMode(){
		var modeArray = ["fade", "flip", "slide"];
		var number = randomInt(0, 2);
		
		var mode = modeArray[number];
		
		return mode;
	}
	
	/** 获得随机颜色 **/
	function getRandomColor(){
		var colorArray = [
			"amber",
			"blue",
			"brown",
			"cobalt",
			"crimson",
			"cyan",
			"emerald",
			"green",
			"indigo",
			"lime",
			"magenta",
			"mango",
			"mauve",
			"olive",
			"orange",
			"pink",
			"purple",
			"violet",
			"red",
			"sienna",
			"steel",
			"teal",
			"yellow"
		];
		
		var number = randomInt(0, 22);
		
		var color = colorArray[number];
		
		return color;
	}
	
	/**
	 * 创建 metro div
	 * @param {Object} divId
	 * @param {Object} dataJson
	 * @param {Object} frontText
	 * @param {Object} frontKey
	 * @param {Object} behindText
	 * @param {Object} behindKey
	 * @param {Object} createDomFun
	**/
	function creatMetro(divId, dataJson, createDomFun){
		var width = document.getElementById(divId).offsetWidth;
		
		document.getElementById(divId).style.width = width + "px";
		
		//剩余宽度
		var lastWidth = width - 40;
		
		//随机倍数
		var basicNumber = 10; 
		
		//单块最小宽度 150  最大宽度  300
		$.each(dataJson, function(i, oneItem){
			//剩余宽度  300 + 150  
			//宽度 范围 每个需要计算上边框
			//150    300    450    500    600
			//160    310    470    520    620
			var divWidth = 0;
			
			if(lastWidth < 150){
				//换行，重置剩余宽度
				lastWidth = width - 40;
				
				//直接随机宽度
				var ranOne = randomInt(0, 15);
				divWidth = 150 + ranOne * basicNumber;
				
				lastWidth = lastWidth - divWidth - basicNumber;
			}else if(lastWidth >= 150 && lastWidth <= 310){
				//沾满整行
				divWidth = lastWidth - basicNumber;
				
				//如正常，应该为0
				lastWidth = lastWidth - divWidth - basicNumber;
			}else if(lastWidth > 310 && lastWidth <= 470){
				var domLast = lastWidth - basicNumber * 2;
				
				var ranMax = parseInt((domLast - 300) / basicNumber);
				
				var ranOne = randomInt(0, ranMax);
				
				divWidth = 150 + ranOne * basicNumber;
				
				lastWidth = lastWidth - divWidth - basicNumber;
			}else{
				//剩余的宽度直接随机
				var ranOne = randomInt(0, 15);
				
				divWidth = 150 + ranOne * basicNumber;
				lastWidth = lastWidth - divWidth - basicNumber;
			}
			
			createDomFun(oneItem, divWidth);
		});
	}
	
	
</script>