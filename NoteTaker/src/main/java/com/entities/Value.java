package com.entities;

public class Value {

	private boolean c;
    private String title;
	public Value() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Value(boolean c,String title) {
		super();
		this.c = c;
		this.title=title;
	}
	

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public boolean isC() {
		return c;
	}

	public void setC(boolean c) {
		this.c = c;
	}
	
	
}
