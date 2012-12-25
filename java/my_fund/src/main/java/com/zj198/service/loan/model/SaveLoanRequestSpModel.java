package com.zj198.service.loan.model;

import com.zj198.model.OrdLoanRequest;
import com.zj198.model.UsrCompany;
import com.zj198.model.UsrPerson;
import com.zj198.model.UsrUser;

public class SaveLoanRequestSpModel {
	private OrdLoanRequest loan;
	private String[]  loanObject;
	
	/**
	 * 申请用户状态
	 * 1：已登陆用户申请
	 * 2：未登陆用户快速申请
	 */
	private Integer userStatus;
	private UsrUser user;
	private UsrCompany company;
	private UsrPerson person;
	
	public OrdLoanRequest getLoan() {
		return loan;
	}
	public void setLoan(OrdLoanRequest loan) {
		this.loan = loan;
	}
	public Integer getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(Integer userStatus) {
		this.userStatus = userStatus;
	}
	public UsrUser getUser() {
		return user;
	}
	public void setUser(UsrUser user) {
		this.user = user;
	}
	public UsrCompany getCompany() {
		return company;
	}
	public void setCompany(UsrCompany company) {
		this.company = company;
	}
	public UsrPerson getPerson() {
		return person;
	}
	public void setPerson(UsrPerson person) {
		this.person = person;
	}
	public String[] getLoanObject() {
		return loanObject;
	}
	public void setLoanObject(String[] loanObject) {
		this.loanObject = loanObject;
	}
}
