package com.ysq.hebtrain.setting.action.impl;

import java.util.List;

import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.ysq.hebtrain.basic.impl.BasicActionSupportImpl;
import com.ysq.hebtrain.common.entity.FunctionInfo;
import com.ysq.hebtrain.common.util.CommonUtil;
import com.ysq.hebtrain.setting.action.IFunctionConfigAction;
import com.ysq.hebtrain.setting.service.IFunctionConfigService;

/**
 * 登陆action
 * @author Administrator
 *
 */
@Controller("functionConfigAction")
@Scope("prototype")
public class FunctionConfigAction extends BasicActionSupportImpl implements IFunctionConfigAction{
	Logger logger = CommonUtil.getLogger(this.getClass());
	private static final long serialVersionUID = 1L;
	
	
	@Resource(name = "functionConfigService")
	protected IFunctionConfigService functionConfigService;
	
	/**
	 * 所有功能
	 */
	public void getFunctionList(){
		logger.debug("getFunctionList ... ");
		
		String jsonResult = "";
		
		try {
			List<FunctionInfo> functionList = functionConfigService.getFunctionList();
			
			jsonResult = CommonUtil.getGridPageJson(functionList.size(), functionList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		CommonUtil.printAjaxResult(jsonResult);
	}
	
	/**
	 * 所有action
	 */
	public void getActionCombx(){
		logger.debug("getActionCombx ... ");
		
		String jsonResult = "";
		
		try {
			List<FunctionInfo> actionList = functionConfigService.getAllAction();
			
			jsonResult = JSON.toJSONString(actionList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		CommonUtil.printAjaxResult(jsonResult);
	}
	
	/**
	 * 检查 k 是否唯一
	 */
	public void checkKUnique(){
		logger.debug("checkKUnique ... ");
		String resultJson = functionConfigService.checkKUnique(functionInfo);
		CommonUtil.printAjaxResult(resultJson);
	}
	
	/**
	 * 保存新的 function
	 */
	public void insertNewFunction(){
		logger.debug("insertNewUser...");
		String resultJson = functionConfigService.insertNewFunction(functionInfo);
		CommonUtil.printAjaxResult(resultJson);
	}
	
	/**
	 * 修改function
	 */
	public void editFunctionInfo(){
		logger.debug("editFunction ... ");
		
		String resultJson = functionConfigService.editFunctionInfo(functionInfo);
		CommonUtil.printAjaxResult(resultJson);
	}
	
	/**
	 * 删除function
	 */
	public void deleteFunctionInfo(){
		logger.debug("deleteUserInfo...");
		
		String functionIdArrayStr = CommonUtil.getRequestParameter("functionIdArrayStr");
		
		String resultJson = null;
		try {
			resultJson = functionConfigService.deleteFunctionInfo(functionIdArrayStr);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			resultJson = CommonUtil.returnAjaxJson(false, "删除失败");
			e.printStackTrace();
		}
		CommonUtil.printAjaxResult(resultJson);
	}
}
