package com.ysq.hebtrain.common.entity;

/**
 * 表 nec_function_info
 * 
 * @author Administrator
 */
public class FunctionInfo {
	private int userId;
	private int actionId;
	private String actionValue;
	private String remarks;
	private int functionId;
	private String k;  //页面 key 参数
	private String functionName;
	private String functionUrl;
	private int index;
	private String actionUrl;   //拼接的actionUrl
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getActionId() {
		return actionId;
	}
	public void setActionId(int actionId) {
		this.actionId = actionId;
	}
	public String getActionValue() {
		return actionValue;
	}
	public void setActionValue(String actionValue) {
		this.actionValue = actionValue;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public int getFunctionId() {
		return functionId;
	}
	public void setFunctionId(int functionId) {
		this.functionId = functionId;
	}
	public String getK() {
		return k;
	}
	public void setK(String k) {
		this.k = k;
	}
	public String getFunctionName() {
		return functionName;
	}
	public void setFunctionName(String functionName) {
		this.functionName = functionName;
	}
	public String getFunctionUrl() {
		return functionUrl;
	}
	public void setFunctionUrl(String functionUrl) {
		this.functionUrl = functionUrl;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public String getActionUrl() {
		return actionUrl;
	}
	public void setActionUrl(String actionUrl) {
		this.actionUrl = actionUrl;
	}
}
