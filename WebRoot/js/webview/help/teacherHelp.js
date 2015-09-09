/** 教师辅助 **/
baseAction = "webview/teacherHelp";
//changeFrameUrl();
upClass = "loginUpBar";
			
downClass = "loginDownBar";

loggerDomId = "teacherLoggerDiv";

/** 自动学习计时器 **/
learnTimmer = null;

/** 自动更新剩余时间 15分钟 **/
autoUpdateTime = 900;

/** 当前学习时间 **/
nowLearnTime = 0;

isTeacherLoggin = false;

/** 清除日志 **/
function clearLogger(){
	$("#teacherLoggerDiv").clearLogger();
}

/** 跳转 iframe **/
function changeFrameUrl(){
	var url = document.getElementById("addressText").value;
	document.getElementById("learnFrame").src = url;
}

function heideLogin(){//向上隐藏
	$("#teacherLoginDiv").slideUp();
	$("#loginBarDiv").attr("class", downClass);
	$("#loginBarDiv").attr("title", "显示");
}
function showLogin(){
	$("#teacherLoginDiv").slideDown();
	$("#loginBarDiv").attr("class", upClass);
	$("#loginBarDiv").attr("title", "隐藏");
}

/** 打印错误信息 **/
function getErrorMsg(resultJson){
	var errorMsg = "";
	var errorCode = resultJson["errorCode"];
	if(errorCode != null){
		errorMsg = "errorCode : " + errorCode + "  ";
	}
	errorMsg = errorMsg + resultJson["msg"];
	
	return errorMsg;
}

/** 打印日志信息 **/
function loggerMsg(level, msg){
	$("#" + loggerDomId).logger(level, msg);
}

/** 点击开始/暂停按钮 **/
function timmerBtnClick(){
	if(isTeacherLoggin){
		var btnValue = $("#timmerBtn").val();
		
		if(btnValue == "开始自动更新"){//暂停状态，点击开始
			//loggerMsg("info", "开始自动更新时间...");
			startLearnTimmer();
		}else{
			loggerMsg("info", "暂停自动更新时间...");
			stopLearnTimmer();
		}
	}else{
		alert("请登录！");
	}
}

/** 格式化秒数 **/
function formatSecond(secondNumber){
	var timeStr = Math.floor(secondNumber/60) + "分" + secondNumber%60 + "秒";
	return timeStr;
}

/** 提交更新时间 **/
function updateLearnTime(){
	if(isTeacherLoggin){
		//初始化时间
		stopLearnTimmer();
		autoUpdateTime = 900;
		nowLearnTime = 0;
		
		var onceTime = Math.floor(nowLearnTime/60);
		
		//如果时间小于10分钟，手动设置为10分钟
		if(onceTime < 10){
			onceTime = 10;
		}
		
		var parameter = {};
		parameter["onceTime"] = onceTime;
		
		$.ajax({
			url: baseAction + "_updateLearnTime",
			type: "post",
			data: parameter,
			complete: function(request, textStatus){
				//$('#learnPageDiv').unmask();
			},
			success: function(data, textStatus){
				var resultJson = $.parseJSON(data);
				
				if(resultJson.success == true){
					var responMsg = resultJson["responMsg"];
					var learningTime = resultJson["learningTime"];
					
					if(responMsg == "N"){
						loggerMsg("info", "验证码不正确！");
						
					}else if(responMsg == "error"){
						loggerMsg("info", "更新时间超出最大学习时间范围！");
						
					}else if(responMsg == "more"){
						loggerMsg("info", "不能打开多个窗口同时学习，请重新学习！");
						
					}else if(responMsg == "fast"){
						loggerMsg("info", "距离上次更新时间间隔小于10分钟，请重新学习！");
						
					}else{//成功
						//{"sum":82,"token":"1438247060768"}
						
						var responJson = $.parseJSON(responMsg);
						
						var sum = responJson["sum"];
						
						$("#sumLearnTimeText").val(sum + "分钟");
						
						var msg = resultJson["msg"] + "，累计学习时间：<span style=''color: green; font-weight: bold;'>" + sum + "分钟</span>";
						
						loggerMsg("info", msg);
						
						if(parseInt(sum) >= parseInt(learningTime)){
							loggerMsg("info", "已达到本课程的建议学习时间，可以进入下一课程！");
						}
					}
					startLearnTimmer();
				}else{
					var errorMsg = getErrorMsg(resultJson);
					loggerMsg("error", errorMsg);
					startLearnTimmer();
				}
			},
			error: function(data, textStatus){
				loggerMsg("error", "更新学习时间时未知异常");
			}
		});
	}else{
		alert("请登录！");
	}
}

/** 更改时间框 **/
function changeTimeText(){
	autoUpdateTime--;
	nowLearnTime++;
	
	var updateTimeStr = formatSecond(autoUpdateTime);
	var learnTimeStr = formatSecond(nowLearnTime);
	
	$("#autoUpdateTimeText").val(updateTimeStr);
	$("#nowLearnTimeText").val(learnTimeStr);
	
	if(autoUpdateTime <= 0){
		updateLearnTime();
	}
}

/** 开启定时器 **/
function startLearnTimmer(){
	$("#timmerBtn").val("暂停自动更新");
	
	learnTimmer = setInterval(function(){
		changeTimeText();
	},1000);

}
/** 暂停定时器 **/
function stopLearnTimmer(){
	$("#timmerBtn").val("开始自动更新");
	clearInterval(learnTimmer);
	learnTimmer = null;
}

/** 更改学习地址 **/
function updateLearnUrl(){
	if(isTeacherLoggin){
	
		var learnUrl = $("#addressText").val();
		
		changeFrameUrl();
		
		var parameter = {};
		parameter["teacherUser.learnUrl"] = learnUrl;
		
		$.ajax({
			url: baseAction + "_updateLearnUrl",
			type: "post",
			data: parameter,
			complete: function(request, textStatus){
				//$('#learnPageDiv').unmask();
			},
			success: function(data, textStatus){
				var resultJson = $.parseJSON(data);
				
				if(resultJson.success == true){
					var msg = resultJson["msg"];
					loggerMsg("info", msg);
					
					updateLearnTime();
				}else{
					var errorMsg = getErrorMsg(resultJson);
					loggerMsg("error", errorMsg);
				}
			},
			error: function(data, textStatus){
				loggerMsg("error", data);
			}
		});
	}else{
		alert("请登录！");
	}
	
}

/** 开始学习 **/
function getLearnUrl(){
	$('#learnPageDiv').mask("正在检索学习地址...");
	
	//获得学习地址
	$.ajax({
		url: baseAction + "_getLearnUrl",
		type: "post",
		//data: parameter,
		complete: function(request, textStatus){
			$('#learnPageDiv').unmask();
		},
		success: function(data, textStatus){
			var resultJson = $.parseJSON(data);
			
			if(resultJson.success == true){
				var learnUrl = resultJson["learnUrl"];
				var msg = resultJson["msg"] + " : " + learnUrl;
				loggerMsg("info", msg);
				
				$("#addressText").val(learnUrl);
				
				//更改url
				updateLearnUrl();
				
			}else{
				var errorMsg = getErrorMsg(resultJson);
				loggerMsg("error", errorMsg);
			}
		},
		error: function(data, textStatus){
			loggerMsg("error", data);
		}
	});
	
	
}

/** 登录 **/
function goLogin(){
	var userName = $("#userName").val();
	var password = $("#password").val();
	
	if(userName == "" || password == ""){
		$("#errorMsgDiv").text("用户名或密码不能为空！");
	}else{
		$("#errorMsgDiv").text("");
		
		var parameter = {};
		parameter["teacherUser.userName"] = userName;
		parameter["teacherUser.password"] = password;
		
		$('#teacherLoginDiv').mask("登录中...");
		
		$.ajax({
			url: baseAction + "_teacherLogin",
			type: "post",
			data: parameter,
			complete: function(request, textStatus){
				$('#teacherLoginDiv').unmask();
			},
			success: function(data, textStatus){
				
				var resultJson = $.parseJSON(data);
				
				if(resultJson.success == true){
					isTeacherLoggin = true;
					var loginUrl = "http://cas.teacher.com.cn/restLoginCheck?username=" + userName + "&password=" + password;
					$("#loginImg").attr("src", loginUrl);
					loggerMsg("info", resultJson["msg"]);
					
					heideLogin();
					
					//先获得学习url
					getLearnUrl();
					
				}else{
					loggerMsg("error", resultJson["msg"]);
				}
			},
			error: function(request, textStatus){
				//请求出错处理
				var resultJson = $.parseJSON(data);
				loggerErrorMsg(resultJson);
			}
		});
	}
}

//document.domain = 'teacher.com.cn';
$(document).ready(function(){
	$("#loginBarDiv").click(function(){
		var nowClass = $("#loginBarDiv").attr("class");
		
		if(nowClass == upClass){
			heideLogin();
		}else{//向下展开
			showLogin();
		}
	});
	
	var userName = $("#userName").val();
	if(userName != null && userName != ""){
		isTeacherLoggin = true;
		loggerMsg("info", "当前是登录状态");
		heideLogin();
		//startLearnTimmer();
		changeFrameUrl();
		updateLearnTime();
	}
	
});