package com.ysq.hebtrain.setting.service;

import java.util.List;

import com.ysq.hebtrain.common.entity.FunctionInfo;

/**
 * 用户 功能 service
 * @author Administrator
 *
 */
public interface IFunctionConfigService {
	
	/**
	 * 查询所有功能
	 * @return
	 */
	List<FunctionInfo> getFunctionList() throws Exception;
	
	/**
	 * 查询所有 action
	 * @return
	 * @throws Exception
	 */
	List<FunctionInfo> getAllAction() throws Exception;
	
	/**
	 * 检查 k 是否唯一
	 * @param functionInfo
	 * @return
	 */
	String checkKUnique(FunctionInfo functionInfo);
	
	/**
	 * 保存新的 function
	 * @param functionInfo
	 * @return
	 */
	String insertNewFunction(FunctionInfo functionInfo);
	
	/**
	 * 修改function
	 * @param functionInfo
	 * @return
	 */
	String editFunctionInfo(FunctionInfo functionInfo);
	
	/**
	 * 删除function
	 * @param functionIdArrayStr
	 * @return
	 */
	String deleteFunctionInfo(String functionIdArrayStr) throws Exception;
}
