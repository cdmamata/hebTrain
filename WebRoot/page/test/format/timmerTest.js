var speed = 4;	//速度
//向下
function changePositionDown(dept){
	var imgUpId;
	var imgDownId;
	var tabId;
	var divHeight;
	var parDivId;
	if(dept == "keshi"){
		imgUp = "goUpImg1";
		imgDown = "goDownImg1";
		tabId = "keShiTab";
		parDivId = "parentDiv1";
	}else if(dept == "guikou"){
		imgUp = "goUpImg2";
		imgDown = "goDownImg2";
		tabId = "guiKouTab";
		parDivId = "parentDiv2";
	}
	var tab = document.getElementById(tabId);
	var top = tab.style.marginTop;
	top = top.substring(0,top.length-2);	//去掉px
	var h = Number(tab.offsetHeight) - Number(document.getElementById(parDivId).offsetHeight);
	if(0-(top)<h){
		if(0-(top - speed) >= h){
			top = -h;
		}else{
			top = top - speed;
		}
		tab.style.marginTop = top+"px";
		if(top<0){
			document.getElementById(imgUp).style.display = "inline";
		}
	}else{
		document.getElementById(imgDown).style.display = "none";
		timerStop();
	}
}
//向上
function changePositionUp(dept){
	var imgUpId;
	var imgDownId;
	var tabId;
	var divHeight;
	var parDivId;
	if(dept == "keshi"){
		imgUp = "goUpImg1";
		imgDown = "goDownImg1";
		tabId = "keShiTab";
		parDivId = "parentDiv1";
	}else if(dept == "guikou"){
		imgUp = "goUpImg2";
		imgDown = "goDownImg2";
		tabId = "guiKouTab";
		parDivId = "parentDiv2";
	}
	var tab = document.getElementById(tabId);
	var top = tab.style.marginTop;
	top = top.substring(0,top.length-2);	//去掉"px"
	var h = Number(tab.offsetHeight) - Number(document.getElementById(parDivId).offsetHeight);
	if(top<0){
		var result = Number(top) + Number(speed);
		if(result>=0){
			top = 0;
		}else{
			top = result;
		}
		tab.style.marginTop = top+"px";
		if((0-top)<=h){
			document.getElementById(imgDown).style.display = "inline";
		}
	}else{
		document.getElementById(imgUp).style.display = "none";
		timerStop();
	}
}
var timerId;	//计时器ID
//计时器开始
function timerStart(flag,dept){
	if(flag == "down"){
		timerId = setInterval(function(){
				changePositionDown(dept)
			},30);
	}else if(flag == "up"){
		timerId = setInterval(function(){
				changePositionUp(dept)
			},30);
	}
}
function timerStop(){
	speed = 4;	//速度恢复正常
	clearInterval(timerId);
}
//加速
function speedUp(){
	speed = 8;
}
//减速
function speedDown(){
	speed = 4;
}