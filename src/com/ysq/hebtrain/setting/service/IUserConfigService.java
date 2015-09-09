package com.ysq.hebtrain.setting.service;

import java.util.List;

import com.ysq.hebtrain.common.entity.FunctionInfo;
import com.ysq.hebtrain.common.entity.LoginUser;


/**
 * 用户 功能 service
 * @author Administrator
 *
 */
public interface IUserConfigService {
	
	/**
	 * 查询 客户树
	 * @param node
	 * @return
	 */
	String getCustomerTree(String node);
	
	/**
	 * 查询客户用户
	 * @param node
	 * @param start
	 * @param limit
	 * @return
	 */
	String getCustomerUser(String node, int start, int limit);
	
	/**
	 * 查询客户combox
	 * @return
	 */
	String getCustomerComb();
	
	/**
	 * 检测用户名唯一
	 * @param loginUser
	 * @return
	 */
	String checkLogingName(LoginUser loginUser);
	
	/**
	 * 新增用户
	 * @return
	 */
	String insertUser(LoginUser loginUser);
	
	/**
	 * 修改用户
	 * @param loginUser
	 * @return
	 */
	String editUser(LoginUser loginUser);
	
	/**
	 * 删除用户
	 * @param userIdArrayStr
	 * @return
	 */
	String deleteUser(String userIdArrayStr) throws Exception;
	
	/**
	 * 查询用户权限
	 * @param loginUser
	 * @return
	 */
	String getUserFunction(LoginUser loginUser);
	
	/**
	 * 获得用户不存在的权限
	 * @param loginUser
	 * @return
	 */
	String getHaventFunction(LoginUser loginUser);
	
	/**
	 * 新增用户权限
	 * @param functionInfoList
	 * @return
	 */
	String addUserFunction(List<FunctionInfo> functionInfoList);
	
	/**
	 * 删除用户权限
	 * @param loginUser
	 * @param intIdArrayStr
	 * @return
	 */
	String deleteUserFunction(LoginUser loginUser, String intIdArrayStr);
}
