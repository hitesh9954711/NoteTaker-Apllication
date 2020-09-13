package com.helper;

public class message {
	
	private String cssClass;
	private String content;
	public message(String cssClass, String content) {
		super();
		this.cssClass = cssClass;
		this.content = content;
	}
	public message() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getCssClass() {
		return cssClass;
	}
	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	

}
