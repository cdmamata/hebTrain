package com.ysq.hebtrain.common.action.imple;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.ysq.hebtrain.basic.impl.BasicActionSupportImpl;
import com.ysq.hebtrain.common.action.IUserLoginAction;
import com.ysq.hebtrain.common.config.ConfigInfo;
import com.ysq.hebtrain.common.entity.LoginUser;
import com.ysq.hebtrain.common.service.IUserLoginService;
import com.ysq.hebtrain.common.util.CommonUtil;

/**
 * 登陆action
 * @author Administrator
 *
 */
@Controller("userLoginAction")
@Scope("prototype")
public class UserLoginAction extends BasicActionSupportImpl implements IUserLoginAction{
	Logger logger = CommonUtil.getLogger(UserLoginAction.class);
	private static final long serialVersionUID = 1L;

	private String noPermission = ConfigInfo.noPermissionPage; 
	
	@Resource(name = "userLoginService")
	protected IUserLoginService userLoginService;
	
	/**
	 * lucene 登陆
	 * @return
	 */
	public String login(){
		logger.debug("login ... ");
		LoginUser sessionUser = (LoginUser)CommonUtil.getSessionAttribute(ConfigInfo.SESSION_USER);
		
		if(sessionUser != null){//当前用户登录状态时，直接返回
			return SUCCESS;
		}else{
			if(loginUser != null){
				try {
					LoginUser checkLoginUser = userLoginService.userLogin(loginUser);
					
					if(checkLoginUser != null){//登陆成功
						CommonUtil.setSessionAttribute(ConfigInfo.SESSION_USER, checkLoginUser);
						return SUCCESS;
					}else{
						CommonUtil.setRequestAttribute("userName", loginUser.getUserName());
						CommonUtil.setRequestAttribute("loginErrorMsg", "用户名或密码错误！");
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					CommonUtil.setRequestAttribute("userName", loginUser.getUserName());
					CommonUtil.setRequestAttribute("loginErrorMsg", "服务器异常！");
				}
			}else{
				CommonUtil.setRequestAttribute("loginErrorMsg", "");
			}
		}
		return LOGIN;
	}
	
	/**
	 * 注销
	 * @return
	 */
	public String logout(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.removeAttribute(ConfigInfo.SESSION_USER);
		//LoggerUtil.logInfo("logout....");
		return LOGIN;
	}
	
	/**
	 * 修改密码
	 */
	public void editPassword(){
		logger.debug("editPassword...");
		
		String resultJson = userLoginService.editPassword(loginUser);
		CommonUtil.printAjaxResult(resultJson);
	}
	
	
	/**
	 * 非拦截的功能跳转
	 * @return
	 */
	public void opfun(){
		logger.debug("opfun ...");
		
		LoginUser sessionUser = (LoginUser)CommonUtil.getSessionAttribute(ConfigInfo.SESSION_USER);
		
		String pageUrl = userLoginService.getResponsePageUrl(sessionUser, ConfigInfo.opActionValue, k);
		if(pageUrl == null){
			pageUrl = noPermission;
		}
		try {
			HttpServletRequest request = CommonUtil.getRequest();
			HttpServletResponse response = CommonUtil.getResponse();
			request.getRequestDispatcher(pageUrl).forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 非拦截的功能跳转
	 * @return
	 */
	public void fun(){
		logger.debug("fun ...");
		
		LoginUser sessionUser = (LoginUser)CommonUtil.getSessionAttribute(ConfigInfo.SESSION_USER);
		
		String pageUrl = userLoginService.getResponsePageUrl(sessionUser, ConfigInfo.actionValue, k);
		
		if(pageUrl == null){
			pageUrl = noPermission;
		}
		try {
			HttpServletRequest request = CommonUtil.getRequest();
			HttpServletResponse response = CommonUtil.getResponse();
			request.getRequestDispatcher(pageUrl).forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	/**
	 * 拦截的功能跳转
	 * @return
	 */
	public String mainPage(){
		logger.debug("mainPage ...");
		
		return SUCCESS;
	}
}
