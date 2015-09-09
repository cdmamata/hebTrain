package com.ysq.hebtrain.setting.service.impl;

import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ysq.hebtrain.basic.impl.BasicServiceSupportImpl;
import com.ysq.hebtrain.common.entity.FunctionInfo;
import com.ysq.hebtrain.common.util.CommonUtil;
import com.ysq.hebtrain.setting.service.IFunctionConfigService;

@Service("functionConfigService")
public class FunctionConfigServiceImpl extends BasicServiceSupportImpl implements IFunctionConfigService {
	Logger logger = CommonUtil.getLogger(this.getClass());
	
	String mapperName = "setting.functionConfigMapper";
	
	/**
	 * 查询所有功能
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<FunctionInfo> getFunctionList() throws Exception{
		List<FunctionInfo> functionList = (List<FunctionInfo>)basicDao.findForList(mapperName + ".getAllFunction", null);
		
		return functionList;
	}
	
	/**
	 * 查询所有 action
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<FunctionInfo> getAllAction() throws Exception{
		List<FunctionInfo> functionList = (List<FunctionInfo>)basicDao.findForList(mapperName + ".getAllAction", null);
		
		return functionList;
	}
	
	/**
	 * 检查 k 是否唯一
	 * @param functionInfo
	 * @return
	 */
	public String checkKUnique(FunctionInfo functionInfo){
		String resultJson = null;
		boolean flag = false;
		try {
			int kCount = (Integer)basicDao.findForObject(mapperName + ".checkKUnique", functionInfo);
			if(kCount <= 0){
				flag = true;
			}
			if(flag){
				resultJson = "{\"message\": true}";
			}else{
				resultJson = "{\"message\": \"该值已存在\"}";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resultJson;
	}
	
	/**
	 * 保存新的 function
	 * @param functionInfo
	 * @return
	 */
	public String insertNewFunction(FunctionInfo functionInfo){
		String resultJson = null;
		boolean flag = false;
		String msg = "保存失败";
		try {
			basicDao.save(mapperName + ".insertNewFunction", functionInfo);
			
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
	 * 修改function
	 * @param functionInfo
	 * @return
	 */
	public String editFunctionInfo(FunctionInfo functionInfo){
		String resultJson = null;
		boolean flag = false;
		String msg = "保存失败";
		try {
			basicDao.update(mapperName + ".editFunctionInfo", functionInfo);
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
	 * 删除function
	 * @param functionIdArrayStr
	 * @return
	 */
	@Transactional
	public String deleteFunctionInfo(String functionIdArrayStr) throws Exception{
		//先删 nec_user_function
		basicDao.delete(mapperName + ".deleteUserFunctionId", functionIdArrayStr);
		//再删 nec_function_info
		basicDao.delete(mapperName + ".deleteFunctionInfo", functionIdArrayStr);
		
		boolean flag = true;
		String msg = "删除成功";
		String resultJson = CommonUtil.returnAjaxJson(flag, msg);
		return resultJson;
	}
}
