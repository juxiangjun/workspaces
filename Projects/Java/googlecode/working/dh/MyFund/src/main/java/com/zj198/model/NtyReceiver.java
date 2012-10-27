package com.zj198.model;

/**
 * NtyReceiver entity. @author MyEclipse Persistence Tools
 */

public class NtyReceiver implements java.io.Serializable {

	private static final long serialVersionUID = -6864120338820983204L;
	private Long id;
	private Integer receiver;
	private String isReceiverDeleted;
	private Integer messageid;

	/** default constructor */
	public NtyReceiver() {
	}

	// Property accessors
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getReceiver() {
		return this.receiver;
	}

	public void setReceiver(Integer receiver) {
		this.receiver = receiver;
	}

	public String getIsReceiverDeleted() {
		return this.isReceiverDeleted;
	}

	public void setIsReceiverDeleted(String isReceiverDeleted) {
		this.isReceiverDeleted = isReceiverDeleted;
	}

	public Integer getMessageid() {
		return this.messageid;
	}

	public void setMessageid(Integer messageid) {
		this.messageid = messageid;
	}

}