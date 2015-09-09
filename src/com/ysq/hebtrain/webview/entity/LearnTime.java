package com.ysq.hebtrain.webview.entity;

public class LearnTime {
	private int id;
	private int onceTime;
	private String inputvalcode;
	private int drawerId;
	private boolean validateType;
	private long token;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOnceTime() {
		return onceTime;
	}
	public void setOnceTime(int onceTime) {
		this.onceTime = onceTime;
	}
	public String getInputvalcode() {
		return inputvalcode;
	}
	public void setInputvalcode(String inputvalcode) {
		this.inputvalcode = inputvalcode;
	}
	public int getDrawerId() {
		return drawerId;
	}
	public void setDrawerId(int drawerId) {
		this.drawerId = drawerId;
	}
	public boolean isValidateType() {
		return validateType;
	}
	public void setValidateType(boolean validateType) {
		this.validateType = validateType;
	}
	public long getToken() {
		return token;
	}
	public void setToken(long token) {
		this.token = token;
	}
}
