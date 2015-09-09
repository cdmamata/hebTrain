/** 跳转 iframe **/
function changeFrameUrl(){
	var url = document.getElementById("addressText").value;
	
	document.getElementById("mainFrame").src = url;
}

/** iframe对象 **/
function getIframeDocument(iframeId){
	var iframeEle = document.getElementById(iframeId);
	
	var ifrDoc = iframeEle.contentDocument || iframeEle.contentWindow.document;
	return ifrDoc;
};

/** 更改学习时间 **/
function updateStudyTime(){
	var iframeDoc = getIframeDocument("mainFrame");
	
	iframeDoc.testNumber = 900;
	
	var seedDiv = document.createElement('input');
	
	 seedDiv.id = "seedAllDiv";
	 
	iframeDoc.body.appendChild(seedDiv);
	
}

//document.domain = 'teacher.com.cn';
$(document).ready(function(){
	changeFrameUrl();
	
	
	
});