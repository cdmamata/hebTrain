package com.ysq.hebtrain.webview.entity;

import java.util.Map;

public class TeacherUser {
	private int id;
	private String userName;
	private String password;
	private String name;
	private String code;
	private String jseSsionId;
	private Map<String, String> cookies;
	private String learnUrl;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getJseSsionId() {
		return jseSsionId;
	}
	public void setJseSsionId(String jseSsionId) {
		this.jseSsionId = jseSsionId;
	}
	public Map<String, String> getCookies() {
		return cookies;
	}
	public void setCookies(Map<String, String> cookies) {
		this.cookies = cookies;
	}
	public String getLearnUrl() {
		return learnUrl;
	}
	public void setLearnUrl(String learnUrl) {
		this.learnUrl = learnUrl;
	}
}
