package com.ysq.hebtrain.common.service.imple;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.ysq.hebtrain.basic.impl.BasicServiceSupportImpl;
import com.ysq.hebtrain.common.config.ConfigInfo;
import com.ysq.hebtrain.common.entity.FunctionInfo;
import com.ysq.hebtrain.common.entity.LoginUser;
import com.ysq.hebtrain.common.service.IUserLoginService;
import com.ysq.hebtrain.common.util.CommonUtil;

@Service("userLoginService")
public class UserLoginServiceImpl extends BasicServiceSupportImpl implements IUserLoginService {
	
	String mapperName = "common.userLoginMapper";
	
	/**
	 * 用户登录
	 * @param loginUser
	 * @return
	 */
	public LoginUser userLogin(LoginUser loginUser) throws Exception{
		LoginUser dbUser = (LoginUser)basicDao.findForObject(mapperName + ".userLogin", loginUser);
		
		if(dbUser != null){
			
			String sessionId = CommonUtil.getRequest().getSession().getId();
			
			dbUser.setSessionId(sessionId);
			
			try {
				List<FunctionInfo> functionList = getUserFunction(dbUser);
				for(FunctionInfo oneFunction : functionList){
					String actionValue = oneFunction.getActionValue();
					String k = oneFunction.getK();
					
					String actionUrl = actionValue + "?k=" + k;
					oneFunction.setActionUrl(actionUrl);
				}
				
				if(functionList != null){
					String functionJson = JSON.toJSONString(functionList);
					/** 前台菜单生成 **/
					dbUser.setFunctionJson(functionJson);
					
					if(!functionList.isEmpty()){
						FunctionInfo firstFunction = functionList.get(0);
						
						/** 初始化时 **/
						dbUser.setFirstFunction(firstFunction);
					}
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return dbUser;
	}
	
	/**
	 * 查询用户所有权限
	 * @param loginUser
	 */
	@SuppressWarnings("unchecked")
	public List<FunctionInfo> getUserFunction(LoginUser loginUser) throws Exception{
		List<FunctionInfo> actionList = (List<FunctionInfo>)basicDao.findForList(mapperName + ".getUserFunction", loginUser);
		return actionList;
	}
	
	/**
	 * 获得跳转页面地址
	 * @param sessionUser
	 * @param k
	 * @return
	 */
	public String getResponsePageUrl(LoginUser sessionUser, String actionValue, String k){
		String resultUrl = null;
		
		if(k == null){
			//默认跳转第一个页面
			FunctionInfo firstFunction = sessionUser.getFirstFunction();
			if(firstFunction != null){
				k = firstFunction.getK();
				actionValue = firstFunction.getActionValue();
			}
		}
		
		if(k != null){
			Map<String, Object> paraMap = new HashMap<String, Object>();
			
			paraMap.put("actionValue", actionValue);
			paraMap.put("k", k);
			
			if(sessionUser == null){
				if(ConfigInfo.actionValue.equals(actionValue)){
					return null;
				}
			}else{
				int userId = sessionUser.getUserId();
				paraMap.put("userId", userId);
			}
			
			try {
				if(ConfigInfo.actionValue.equals(actionValue)){//拦截，需要 userId 验证
					resultUrl = (String)basicDao.findForObject(mapperName + ".getFunUrl", paraMap);
				}else{//不需要 userId 验证
					resultUrl = (String)basicDao.findForObject(mapperName + ".getOpenFunUrl", paraMap);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			/** request 中保存 action k **/
			CommonUtil.setRequestAttribute("functionActionName", actionValue);
			CommonUtil.setRequestAttribute("functionActionKey", k);
		}
		return resultUrl;
	}
	
	/**
	 * 修改密码
	 * @param loginUser
	 * @return
	 */
	public String editPassword(LoginUser loginUser){
		String resultJson = null;
		boolean flag = false;
		String msg = "修改密码失败";
		
		//先查询密码是否正确
		try {
			LoginUser checkUser = (LoginUser)basicDao.findForObject(mapperName + ".checkOldPassword", loginUser);
			
			if(checkUser != null){
				loginUser.setUserId(checkUser.getUserId());
				//修改
				basicDao.update(mapperName + ".editPassword", loginUser);
				flag = true;
				msg = "修改密码成功！";
			}else{
				flag = false;
				msg = "用户名与原始密码不匹配！";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resultJson = CommonUtil.returnAjaxJson(flag, msg);
		return resultJson;
	}
	
	/** ============================================================ 以下方法弃用 ============================================================ **/
	
	/**
	 * 查询用户 功能
	 * @param loginUser
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<FunctionInfo> getUserFunction_bak(LoginUser loginUser) throws Exception{
		List<FunctionInfo> functionList = null;
		if(loginUser != null){
			//查询用户功能
			functionList = (List<FunctionInfo>) basicDao.findForList(mapperName + ".findUserFunction", loginUser);
		}
		return functionList;
	}
	
	/**
	 * 没有权限
	 * @param loginUser
	 * @return
	 */
	public FunctionInfo getNoPermission(LoginUser loginUser){
		FunctionInfo noPermission = new FunctionInfo();
		
		noPermission.setUserId(loginUser.getUserId());
		noPermission.setFunctionId(0);
		noPermission.setFunctionName("没有权限");
		noPermission.setFunctionUrl(ConfigInfo.noPermissionPage);
		noPermission.setIndex(1);
		
		return noPermission;
	}
	
	/**
	 * 用户登录
	 * @param loginUser
	 * @return
	 */
	public LoginUser userLogin_bak(LoginUser loginUser) throws Exception{
		LoginUser dbUser = (LoginUser)basicDao.findForObject(mapperName + ".userLogin", loginUser);
		
		if(dbUser != null){
			List<FunctionInfo> functionList = getUserFunction_bak(dbUser);
			
			if(functionList == null || functionList.isEmpty()){
				//没有权限
				functionList = new ArrayList<FunctionInfo>();
				
				FunctionInfo noPermission = getNoPermission(dbUser);
				functionList.add(noPermission);
			}
			
			String functionJson = JSON.toJSONString(functionList);
			
			dbUser.setFunctionJson(functionJson);
		}
		return dbUser;
	}
}
