package com.ysq.hebtrain.setting.action.impl;

import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.ysq.hebtrain.basic.impl.BasicActionSupportImpl;
import com.ysq.hebtrain.common.util.CommonUtil;
import com.ysq.hebtrain.setting.action.IUserConfigAction;
import com.ysq.hebtrain.setting.service.IUserConfigService;

/**
 * 登陆action
 * @author Administrator
 *
 */
@Controller("userConfigAction")
@Scope("prototype")
public class UserConfigAction extends BasicActionSupportImpl implements IUserConfigAction{
	Logger logger = CommonUtil.getLogger(this.getClass());
	private static final long serialVersionUID = 1L;

	
	@Resource(name = "userConfigService")
	protected IUserConfigService userConfigService;
	
	
	/**
	 * 查询客户树
	 */
	public void getCustomerTree(){
		logger.debug("getCustomerTree ... ");
		String customerNodeJson = userConfigService.getCustomerTree(node);
		CommonUtil.printAjaxResult(customerNodeJson);
	}
	
	/**
	 * 查询客户用户
	 */
	public void getCustomerUser(){
		logger.debug("getCustomerUser...");
		
		String jsonResult = userConfigService.getCustomerUser(node, start, limit);
		CommonUtil.printAjaxResult(jsonResult);
	}
	
	/**
	 * 获得客户combox
	 */
	public void getCustomerComb(){
		logger.debug("getCustomerComb...");
		String resultJson = userConfigService.getCustomerComb();
		CommonUtil.printAjaxResult(resultJson);
	}
	
	/**
	 * 检测用户名是否重复
	 */
	public void checkUserName(){
		logger.debug("checkUserName...");
		String resultJson = userConfigService.checkLogingName(loginUser);
		CommonUtil.printAjaxResult(resultJson);
	}
	/**
	 * 插入新的用户
	 */
	public void insertUser(){
		logger.debug("insertUser ...");
		String resultJson = userConfigService.insertUser(loginUser);
		CommonUtil.printAjaxResult(resultJson);
	}
	
	/**
	 * 修改用户
	 */
	public void editUser(){
		logger.debug("editUserInfo...");
		
		String resultJson = userConfigService.editUser(loginUser);
		CommonUtil.printAjaxResult(resultJson);
	}
	
	/**
	 * 删除用户
	 */
	public void deleteUser(){
		logger.debug("deleteUser ...");
		String userIdArrayStr = CommonUtil.getRequestParameter("userIdArrayStr");
		
		String resultJson = null;
		try {
			resultJson = userConfigService.deleteUser(userIdArrayStr);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			resultJson = CommonUtil.returnAjaxJson(false, "删除失败");
			e.printStackTrace();
		}
		CommonUtil.printAjaxResult(resultJson);
	}
	
	/** ============================== function 相关 ============================== **/
	/**
	 * 查询用户的权限
	 */
	public void getUserFunction(){
		logger.debug("getUserFunction ...");
		
		String jsonResult = userConfigService.getUserFunction(loginUser);
		CommonUtil.printAjaxResult(jsonResult);
	}
	
	/**
	 * 获得用户不存在的权限
	 */
	public void getHaventFunction(){
		logger.debug(" getHaventFunction ... ");
		
		String resultJson = userConfigService.getHaventFunction(loginUser);
		CommonUtil.printAjaxResult(resultJson);
	}
	
	/**
	 * 新增用户权限
	 */
	public void addUserFunction(){
		logger.debug("addUserFunction ...");
		
		String resultJson = userConfigService.addUserFunction(functionInfoList);
		CommonUtil.printAjaxResult(resultJson);
	}
	
	/**
	 * 删除用户权限
	 */
	public void deleteUserFunction(){
		logger.debug("deleteUserFunction ...");
		
		String resultJson = userConfigService.deleteUserFunction(loginUser, intIdArrayStr);
		CommonUtil.printAjaxResult(resultJson);
	}
}
