package com.ysq.hebtrain.webview.service.imple;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jsoup.Jsoup;
import org.jsoup.Connection.Method;
import org.jsoup.Connection.Response;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ysq.hebtrain.basic.impl.BasicServiceSupportImpl;
import com.ysq.hebtrain.common.config.ConfigInfo;
import com.ysq.hebtrain.common.util.CommonUtil;
import com.ysq.hebtrain.common.util.ocr.ImageValidator;
import com.ysq.hebtrain.webview.entity.TeacherUser;
import com.ysq.hebtrain.webview.service.ITeacherHelpService;

/**
 * 教师辅助
 * @author Administrator
 *
 */
@Service("teacherHelpService")
public class TeacherHelpServiceImpl extends BasicServiceSupportImpl implements ITeacherHelpService {
	
	String mapperName = "webview.teacherHelpMapper";
	
	/**
	 * 登录
	 * code 1xxxx
	 * @param loginUser
	 * @return
	 */
	public String teacherLogin(TeacherUser teacherUser) throws Exception{
		String resultJson = null;
		boolean flag = false;
		String msg = "登录失败 : 未知";
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("username", teacherUser.getUserName());
		map.put("password", teacherUser.getPassword());
		
		String loginUrl = "http://cas.teacher.com.cn/restLoginCheck";
		
		Response response = Jsoup.connect(loginUrl)
			.data(map)
			.method(Method.POST)
			.timeout(60000)
			.execute();
		
		int statusCode = response.statusCode();
		
		if (statusCode >= 200) {
			//登录成功
			Document doc = response.parse();
			
			String result = doc.text();
			
			//{"code":"3","error":"密码不正确,请重新输入"}
			JSONObject loginJson = JSON.parseObject(result);
			
			String name = (String)loginJson.get("name");
			
			if(name != null){
				flag = true;
				msg = "登录成功 : " + name;
				
				System.out.println();
				
				int id = (Integer)loginJson.get("id");
				String code = (String)loginJson.get("code");
				
				Map<String, String> cookies = response.cookies();
				
				teacherUser.setId(id);
				teacherUser.setCode(code);
				teacherUser.setCookies(cookies);
				teacherUser.setName(name);
				
				CommonUtil.setSessionAttribute(ConfigInfo.TEACHER_SESSION_USER, teacherUser);
			}else{
				String errorMsg = (String)loginJson.get("error");
				
				flag = false;
				msg = " 登录失败 : " + errorMsg;
			}
		}
		
		resultJson = CommonUtil.returnAjaxJson(flag, msg);
		return resultJson;
	}
	
	/**
	 * 获得老师
	 * code 2xxxx
	 * @return
	 */
	public Map<String, String> getTeacherCookies(){
		TeacherUser teacher = (TeacherUser)CommonUtil.getSessionAttribute(ConfigInfo.TEACHER_SESSION_USER);
		
		if(teacher != null){
			Map<String, String> cookies = teacher.getCookies();
			return cookies;
		}else{
			return null;
		}
	}
	
	/**
	 * 更新学习时间
	 * @return
	 */
	public String getLearnUrl(){
		String learnUrl = null;
		String errorCode = null;
		boolean isSuccess = false;
		String msg = "获得学习地址异常";
		
		Map<String, String> cookies = getTeacherCookies();
		
		if(cookies == null){
			errorCode = "02101";
		}
		
		try {
			/** 入口地址 **/
			String enterUrl = "http://hb2015.px.teacher.com.cn/home/student/127";
			Response response = Jsoup.connect(enterUrl)
				.method(Method.POST)
				.cookies(cookies)
				.timeout(60000)
				.execute();
			
			int statusCode = response.statusCode();
			
			if (statusCode >= 200) {
				//登录成功
				Document enterDoc = response.parse();
				
				String result = enterDoc.html();
				String filePath = "D:/sourceFile/tmp/teacher1.txt";
				CommonUtil.writeTextToFile(filePath, result, false);
				
				String selector = "img[src~=(.+tb-sk\\.png$)]";
				
				Elements eleList = enterDoc.select(selector);
				
				if(eleList == null || eleList.isEmpty()){
					errorCode = "02901";
				}else{
					//跳转当前课程页面
					
					Element nowLesson = eleList.first().parent().parent();
					
					if(nowLesson == null){
						errorCode = "02902";
					}else{
						String lessonUrl = nowLesson.attr("abs:href");
						
						Response lessonResponse = Jsoup.connect(lessonUrl)
							.method(Method.POST)
							.cookies(cookies)
							.timeout(60000)
							.execute();
						
						int lessonStatus = response.statusCode();
						
						if (lessonStatus >= 200) {
							//登录成功
							Document lessonDoc = lessonResponse.parse();
							
							String lessonSelector = "[id=pjax_container] a[target=frm_course_learn]";
							
							Elements selLes = lessonDoc.select(lessonSelector);
							
							Element lessonEle = selLes.first();
							
							if(lessonEle == null){
								errorCode = "02903";
							}else{
								learnUrl = lessonEle.attr("abs:href");
								isSuccess = true;
								msg = "获得学习地址成功";
							}
						}
					}
				}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			errorCode = "02501";
			msg = "获得学习地址超时";
			e.printStackTrace();
		}
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("learnUrl", learnUrl);
		map.put("errorCode", errorCode);
		
		String result = CommonUtil.returnAjaxJson(isSuccess, msg, map);
		
		return result;
	}
	
	/**
	 * 更改learnUrl
	 * @return
	 */
	public String updateLearnUrl(TeacherUser teacherUser){
		String msg = "设置学习url失败";
		boolean isSuccess = false;
		String errorCode = null;
		
		TeacherUser sessionUser = (TeacherUser)CommonUtil.getSessionAttribute(ConfigInfo.TEACHER_SESSION_USER);
		
		if(sessionUser == null){
			msg = "用户未登录或登录超时";
			errorCode = "03101";
		}else{
			sessionUser.setLearnUrl(teacherUser.getLearnUrl());
			
			CommonUtil.setSessionAttribute(ConfigInfo.TEACHER_SESSION_USER, sessionUser);
			
			isSuccess = true;
			msg = "设置学习url成功";
		}
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("errorCode", errorCode);
		
		String result = CommonUtil.returnAjaxJson(isSuccess, msg, map);
		
		return result;
	}
	
	/**
	 * 从 json 中获得值
	 * @param text
	 * @param key
	 * @return
	 */
	public String getJsonValue(String text, String key){
		//data:{"id":1962551,"onceTime":obj.onceTime,"inputvalcode":inputvalcode1,"drawerId":1547,"validateType":validateType,"token":token}
		String result = null;
		int index = text.indexOf("\"" + key + "\"");
		
		if(index > 0){
			int startIndex = text.indexOf(":", index);
			
			int endIndex = text.indexOf(",", startIndex);
			
			result = text.substring(startIndex + 1, endIndex) + "  ".trim();
		}
		return result;
	}
	
	/**
	 * 获得验证码
	 * @return
	 * @throws Exception
	 */
	public String getValidateText() throws Exception{
		String token = new Date().getTime() + "";
		
		TeacherUser sessionUser = (TeacherUser)CommonUtil.getSessionAttribute(ConfigInfo.TEACHER_SESSION_USER);
		Map<String, String> cookies = sessionUser.getCookies();
		String imgName = sessionUser.getUserName() + "-" + token + ".jpg";
		
		String imgUrl = "http://hb2015.px.teacher.com.cn/validateCode?" + token;
		
		String ocrPath = CommonUtil.getBasicPath();
		
		ImageValidator validator = new ImageValidator(ocrPath);
		
		String imgPath = validator.downloadImage(imgUrl, imgName, cookies);
		
		File imgFile = new File(imgPath);
		
		String path = imgFile.getAbsolutePath();
		System.out.println(path);
		
		String text = validator.getAllOcr(imgPath);
		
		return text;
	}
	
	/**
	 * 更新学习时间
	 * @param onceTimeStr
	 * @return
	 */
	public String updateLearnTime(String onceTimeStr){
		String msg = "更新学习时间失败";
		boolean isSuccess = false;
		String errorCode = null;
		
		Map<String, String> responMap = new HashMap<String, String>();
		
		TeacherUser sessionUser = (TeacherUser)CommonUtil.getSessionAttribute(ConfigInfo.TEACHER_SESSION_USER);
		if(sessionUser == null){
			msg = "用户未登录或登录超时";
			errorCode = "04101";
		}else{
			Map<String, String> cookies = sessionUser.getCookies();
			String learnUrl = sessionUser.getLearnUrl();
			
			try {
				Response response = Jsoup.connect(learnUrl)
					.method(Method.POST)
					.cookies(cookies)
					.timeout(60000)
					.execute();
				
				int lessonStatus = response.statusCode();
				
				if (lessonStatus >= 200) {
					
					Document learnDoc = response.parse();
					
					String learnHtml = learnDoc.html();
					
					//data:{"id":1962551,"onceTime":obj.onceTime,"inputvalcode":inputvalcode1,"drawerId":1547,"validateType":validateType,"token":token}
					
					String dataRegex = "data\\s*:\\s*\\{.*drawerId.*\\}";
					
					Pattern patt = Pattern.compile(dataRegex);
					
					Matcher match = patt.matcher(learnHtml);
					
					if(match.find()){
						String dataLine= match.group();
						
						String learningTime = null;
						
						//获得 learningTime
						String timeRegex = "obj\\.learningTime\\s*=\\s*\\d+;?";
						
						Pattern timePatt = Pattern.compile(timeRegex);
						
						Matcher timeMatch = timePatt.matcher(learnHtml);
						
						if(timeMatch.find()){
							String timeText = timeMatch.group();
							
							String clearRegex = "\\d+";
							Pattern clearPatt = Pattern.compile(clearRegex);
							
							Matcher clearMatch = clearPatt.matcher(timeText);
							if(clearMatch.find()){
								learningTime = clearMatch.group();
							}
						}
						
						learnDoc = null;
						learnHtml = null;
						
						String id = getJsonValue(dataLine, "id");
						String drawerId = getJsonValue(dataLine, "drawerId");
						String validateType = "false";
						String token = new Date().getTime() + "";
						
						//String inputvalcode = getValidateText();
						
						Map<String, String> map = new HashMap<String, String>();
						
						map.put("id", id);
						map.put("onceTime", onceTimeStr);
						map.put("inputvalcode", "1111");
						map.put("drawerId", drawerId);
						map.put("validateType", validateType);//为 false 时 不需要验证码
						map.put("token", token);
						
						String updateUrl = "http://hb2015.px.teacher.com.cn/home/student/127/course/updateLearnTime";
						
						Response updateResponse = Jsoup.connect(updateUrl)
							.data(map)
							.method(Method.POST)
							.cookies(cookies)
							.timeout(60000)
							.execute();
						
						int updateStatus = updateResponse.statusCode();
						
						if (updateStatus >= 200) {
							//登录成功
							Document updateDoc = updateResponse.parse();
							
							String updateHtml = updateDoc.text();
							
							responMap.put("responMsg", updateHtml);
							responMap.put("learningTime", learningTime);
							
							isSuccess = true;
							msg = "更新学习时间成功";
							
							String filePath = "D:/sourceFile/tmp/teacher1.txt";
							CommonUtil.writeTextToFile(filePath, updateHtml, false);
							
							String result = CommonUtil.returnAjaxJson(isSuccess, msg, responMap);
							return result;
						}
						
					}else{
						isSuccess = false;
						msg = "解析页面异常";
						errorCode = "04801";
					}
				}
				
			} catch (IOException e) {
				errorCode = "04501";
				msg = e.toString();
				e.printStackTrace();
			} catch (Exception e){
				errorCode = "04502";
				msg = e.toString();
				e.printStackTrace();
			}
		}
		responMap.put("errorCode", errorCode);
		
		String result = CommonUtil.returnAjaxJson(isSuccess, msg, responMap);
		
		return result;
	}
}
