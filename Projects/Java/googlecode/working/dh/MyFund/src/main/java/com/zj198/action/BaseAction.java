package com.zj198.action;

import com.opensymphony.xwork2.Action;

public abstract class BaseAction implements Action{
	
	protected String msg;
	
	public String getMsg() {
		return msg;
	}
	
}
