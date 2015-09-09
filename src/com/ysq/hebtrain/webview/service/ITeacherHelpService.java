package com.ysq.hebtrain.webview.service;

import com.ysq.hebtrain.webview.entity.TeacherUser;


/**
 * 教师辅助
 * @author Administrator
 *
 */
public interface ITeacherHelpService {

	/**
	 * 登录
	 * @param teacherUser
	 * @return
	 */
	String teacherLogin(TeacherUser teacherUser) throws Exception;
	
	/**
	 * 获得当前课程 url
	 * @return
	 * @throws Exception
	 */
	String getLearnUrl();
	
	/**
	 * 更改learnUrl
	 * @return
	 */
	String updateLearnUrl(TeacherUser teacherUser);
	
	/**
	 * 更新学习时间
	 * @param onceTimeStr
	 * @return
	 */
	String updateLearnTime(String onceTimeStr);
}
