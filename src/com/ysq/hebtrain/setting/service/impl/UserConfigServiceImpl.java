package com.ysq.hebtrain.setting.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.ysq.hebtrain.basic.impl.BasicServiceSupportImpl;
import com.ysq.hebtrain.common.entity.FunctionInfo;
import com.ysq.hebtrain.common.entity.LoginUser;
import com.ysq.hebtrain.common.entity.HebCustomer;
import com.ysq.hebtrain.common.entity.TreePanelNode;
import com.ysq.hebtrain.common.util.CommonUtil;
import com.ysq.hebtrain.setting.service.IUserConfigService;

@Service("userConfigService")
public class UserConfigServiceImpl extends BasicServiceSupportImpl implements IUserConfigService {
	Logger logger = CommonUtil.getLogger(this.getClass());
	
	String mapperName = "setting.userConfigMapper";
	
	/**
	 * 查询 客户树
	 * @param node
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getCustomerTree(String node){
		String nodeJson = null;
		try {
			List<TreePanelNode> customerNodeList = (List<TreePanelNode>)basicDao.findForList(mapperName + ".getCustomerTree", node);
			
			nodeJson = JSON.toJSONString(customerNodeList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return nodeJson;
	}
	
	/**
	 * 查询客户用户
	 * @param node
	 * @param start
	 * @param limit
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getCustomerUser(String node, int start, int limit){
		String result = null;
		//tcenter-1
		if(node != null){
			int cusId = Integer.parseInt(node);
			
			Map<String, Object> parameterMap = new HashMap<String, Object>();
			
			parameterMap.put("cusId", cusId);
			parameterMap.put("start", start);
			parameterMap.put("limit", limit);
			
			try {
				int total = (Integer)basicDao.findForObject(mapperName + ".getUserTotal", parameterMap);
				
				List<LoginUser> userList = (List<LoginUser>)basicDao.findForList(mapperName + ".findAllUser", parameterMap);
				
				result = CommonUtil.getGridPageJson(total, userList);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}
	
	/**
	 * 获得 combox 下拉 customer 数据
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getCustomerComb(){
		String resultJson = null;
		try {
			List<HebCustomer> userList = (List<HebCustomer>)basicDao.findForList(mapperName + ".getCustomerComb", null);
			resultJson = JSON.toJSONString(userList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultJson;
	}
	
	/**
	 * 检测用户名唯一
	 * @param loginUser
	 * @return
	 */
	public String checkLogingName(LoginUser loginUser){
		String resultJson = null;
		boolean flag = false;
		try {
			int userCount = (Integer)basicDao.findForObject(mapperName + ".checkUserName", loginUser);
			if(userCount <= 0){
				flag = true;
			}
			if(flag){
				resultJson = "{\"message\": true}";
			}else{
				resultJson = "{\"message\":\"用户名已存在\"}";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultJson;
	}
	
	/**
	 * 新增用户
	 * @return
	 */
	public String insertUser(LoginUser loginUser){
		String resultJson = null;
		boolean flag = false;
		String msg = "保存失败";
		try {
			basicDao.save(mapperName + ".insertUser", loginUser);
			
			flag = true;
			msg = "保存成功";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resultJson = CommonUtil.returnAjaxJson(flag, msg);
		return resultJson;
	}
	
	/**
	 * 修改用户
	 * @param loginUser
	 * @return
	 */
	public String editUser(LoginUser loginUser){
		String resultJson = null;
		boolean flag = false;
		String msg = "保存失败";
		try {
			basicDao.update(mapperName + ".editUser", loginUser);
			flag = true;
			msg = "保存成功";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resultJson = CommonUtil.returnAjaxJson(flag, msg);
		return resultJson;
	}
	
	/**
	 * 删除用户
	 * @param userIdArrayStr
	 * @return
	 */
	@Transactional
	public String deleteUser(String userIdArrayStr) throws Exception{
		String resultJson = null;
		
		//删功能
		basicDao.delete(mapperName + ".deleteUserAllFunction", userIdArrayStr);
		//删用户
		basicDao.delete(mapperName + ".deleteUser", userIdArrayStr);
		
		boolean flag = true;
		String msg = "删除成功";
		resultJson = CommonUtil.returnAjaxJson(flag, msg);
		
		return resultJson;
	}
	
	/**
	 * 查询用户权限
	 * @param loginUser
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getUserFunction(LoginUser loginUser){
		String resultJson = null;
		try {
			List<FunctionInfo> functionList = (List<FunctionInfo>)basicDao.findForList(mapperName + ".getUserFunction", loginUser);
			resultJson = CommonUtil.getGridPageJson(functionList.size(), functionList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultJson;
	}
	
	/**
	 * 获得用户不存在的权限
	 * @param loginUser
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getHaventFunction(LoginUser loginUser){
		String resultJson = null;
		try {
			List<FunctionInfo> navigateMenuList = (List<FunctionInfo>)basicDao.findForList(mapperName + ".getHaventFunction", loginUser);
			resultJson = CommonUtil.getGridPageJson(navigateMenuList.size(), navigateMenuList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultJson;
	}
	
	/**
	 * 新增用户权限
	 * @param functionInfoList
	 * @return
	 */
	public String addUserFunction(List<FunctionInfo> functionInfoList){
		String resultJson = null;
		boolean flag = false;
		String msg = "保存失败";
		
		int i = 0;
		
		for(FunctionInfo oneFunction : functionInfoList){
			try {
				basicDao.save(mapperName + ".addUserFunction", oneFunction);
				i++;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		flag = true;
		msg = "保存成功， 新增权限 " + i + " 条";
		resultJson = CommonUtil.returnAjaxJson(flag, msg);
		return resultJson;
	}
	
	/**
	 * 删除用户权限
	 * @param loginUser
	 * @param intIdArrayStr
	 * @return
	 */
	public String deleteUserFunction(LoginUser loginUser, String intIdArrayStr){
		String resultJson = null;
		boolean flag = false;
		String msg = "删除失败";
		
		int userId = loginUser.getUserId();
		
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		
		parameterMap.put("userId", userId);
		parameterMap.put("functionIdArrayStr", intIdArrayStr);
		
		try {
			basicDao.delete(mapperName + ".deleteUserFunction", parameterMap);
			
			flag = true;
			msg = "删除成功";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resultJson = CommonUtil.returnAjaxJson(flag, msg);
		return resultJson;
	}
}
