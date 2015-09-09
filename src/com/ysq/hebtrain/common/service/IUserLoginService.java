package com.ysq.hebtrain.common.service;

import java.util.List;
import com.ysq.hebtrain.common.entity.FunctionInfo;
import com.ysq.hebtrain.common.entity.LoginUser;

public interface IUserLoginService {

	/**
	 * 用户登录
	 * @param loginUser
	 * @return
	 */
	LoginUser userLogin(LoginUser loginUser) throws Exception;
	
	/**
	 * 查询用户 功能
	 * @param loginUser
	 * @return
	 * @throws Exception
	 */
	List<FunctionInfo> getUserFunction(LoginUser loginUser) throws Exception;
	
	/**
	 * 获得跳转页面地址
	 * @param sessionUser
	 * @param k
	 * @return
	 */
	String getResponsePageUrl(LoginUser sessionUser, String actionValue, String k);
	
	/**
	 * 修改密码
	 * @param loginUser
	 * @return
	 */
	String editPassword(LoginUser loginUser);
}
