package com.ysq.hebtrain.basic.impl;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.opensymphony.xwork2.ActionSupport;
import com.ysq.hebtrain.basic.IBasicActionSupport;
import com.ysq.hebtrain.common.entity.FunctionInfo;
import com.ysq.hebtrain.common.entity.LoginUser;
import com.ysq.hebtrain.webview.entity.TeacherUser;

@Controller("basicActionSupport")
@Scope("prototype")
public class BasicActionSupportImpl extends ActionSupport implements IBasicActionSupport {
	static final long serialVersionUID = 1L;
	
	/** loginUser **/
	protected LoginUser loginUser;
	protected TeacherUser teacherUser;
	
	/** 功能跳转值 **/
	protected String k;
	
	/** 起止时间 **/
	protected String startTime;
	/** 起止时间 **/
	protected String endTime;
	
	/** 请求的数据类型 **/
	protected String dataType;
	
	/** 分页 **/
	protected int start;
	protected int limit;
	
	/** 功能类 **/
	protected FunctionInfo functionInfo;
	protected List<FunctionInfo> functionInfoList;

	/** 节点id **/
	protected String node;
	/** 用 "," 拼接的id 字符串 **/
	protected String intIdArrayStr;
	
	public LoginUser getLoginUser() {
		return loginUser;
	}
	public void setLoginUser(LoginUser loginUser) {
		this.loginUser = loginUser;
	}
	public TeacherUser getTeacherUser() {
		return teacherUser;
	}
	public void setTeacherUser(TeacherUser teacherUser) {
		this.teacherUser = teacherUser;
	}
	public String getK() {
		return k;
	}
	public void setK(String k) {
		this.k = k;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getDataType() {
		return dataType;
	}
	public void setDataType(String dataType) {
		this.dataType = dataType;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public FunctionInfo getFunctionInfo() {
		return functionInfo;
	}
	public void setFunctionInfo(FunctionInfo functionInfo) {
		this.functionInfo = functionInfo;
	}
	public List<FunctionInfo> getFunctionInfoList() {
		return functionInfoList;
	}
	public void setFunctionInfoList(List<FunctionInfo> functionInfoList) {
		this.functionInfoList = functionInfoList;
	}
	public String getNode() {
		return node;
	}
	public void setNode(String node) {
		this.node = node;
	}
	public String getIntIdArrayStr() {
		return intIdArrayStr;
	}
	public void setIntIdArrayStr(String intIdArrayStr) {
		this.intIdArrayStr = intIdArrayStr;
	}
}
