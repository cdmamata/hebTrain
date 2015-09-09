package com.ysq.hebtrain.common.entity;

/**
 * session 中的登陆用户
 * @author Administrator
 *
 */
public class LoginUser {
	private int userId;
	private String userName;
	private String password;
	private String newPassword;//更改密码时用
	private int status;//用户 status
	private String functionJson; //用户的功能
	private int cusId;
	private String cusName;
	private String act;
	private String sessionId; //sessionId
	
	/** 用户第一个功能 */
	private FunctionInfo firstFunction;
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getFunctionJson() {
		return functionJson;
	}
	public void setFunctionJson(String functionJson) {
		this.functionJson = functionJson;
	}
	public int getCusId() {
		return cusId;
	}
	public void setCusId(int cusId) {
		this.cusId = cusId;
	}
	public String getCusName() {
		return cusName;
	}
	public void setCusName(String cusName) {
		this.cusName = cusName;
	}
	public String getAct() {
		return act;
	}
	public void setAct(String act) {
		this.act = act;
	}
	public FunctionInfo getFirstFunction() {
		return firstFunction;
	}
	public void setFirstFunction(FunctionInfo firstFunction) {
		this.firstFunction = firstFunction;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
}
