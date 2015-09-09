package com.ysq.hebtrain.webview.action.imple;

import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.ysq.hebtrain.basic.impl.BasicActionSupportImpl;
import com.ysq.hebtrain.common.util.CommonUtil;
import com.ysq.hebtrain.webview.action.ITeacherHelpAction;
import com.ysq.hebtrain.webview.service.ITeacherHelpService;

/**
 * 教师辅助
 * @author Administrator
 *
 */
@Controller("teacherHelpAction")
@Scope("prototype")
public class TeacherHelpAction extends BasicActionSupportImpl implements ITeacherHelpAction{
	Logger logger = CommonUtil.getLogger(TeacherHelpAction.class);
	private static final long serialVersionUID = 1L;

	@Resource(name = "teacherHelpService")
	protected ITeacherHelpService teacherHelpService;
	
	/**
	 * 远程培训系统登录
	 */
	public void teacherLogin(){
		logger.info("teacherLogin ... ");
		
		try {
			String result = teacherHelpService.teacherLogin(teacherUser);
			
			CommonUtil.printAjaxResult(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/*
		Connection.Response res = Jsoup.connect("http://www.example.com/login.php")
			.data("username", "myUsername", "password", "myPassword")
			.method(Method.POST)
			.execute();

Document doc = res.parse();
//这儿的SESSIONID需要根据要登录的目标网站设置的session Cookie名字而定
String sessionId = res.cookie("SESSIONID"); 
在上面的代码成功登录后，就可以利用登录的cookie来保持会话，抓取网页内容了

Document objectDoc = Jsoup.connect("http://www.example.com/otherPage")
    .cookie("SESSIONID", sessionId)
    .get();
		 * 
		 * 
		 */
		
	}
	
	/**
	 * 获得学习地址
	 */
	public void getLearnUrl(){
		logger.info("getLearnUrl ... ");
		
		try {
			String result = teacherHelpService.getLearnUrl();
			
			CommonUtil.printAjaxResult(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 更新学习地址
	 */
	public void updateLearnUrl(){
		logger.info("updateLearnUrl ... ");
		
		String result = teacherHelpService.updateLearnUrl(teacherUser);
		CommonUtil.printAjaxResult(result);
	}
	
	/**
	 * 更新学习时间
	 */
	public void updateLearnTime(){
		logger.info("updateLearnTime ... ");
		
		String onceTimeStr = CommonUtil.getRequestParameter("onceTime");
		
		
		String result = teacherHelpService.updateLearnTime(onceTimeStr);
		
		CommonUtil.printAjaxResult(result);
		
	}
	
	
}
