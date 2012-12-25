package com.zj198.model;

import java.util.Date;



/**
 * OrdLoanAllocation entity. @author MyEclipse Persistence Tools
 */

public class OrdLoanAllocation  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private Integer requestId;
     private Integer orgId;
     private Date createDt;
     private Integer createUserId;
     private Integer createUserType;
     private Integer orgCheckStatus;
     private String orgCheckMemo;
     private Date orgCheckDt;
     
     //no database fields
     private String orgName;
     private String logo;


    // Constructors

    /** default constructor */
    public OrdLoanAllocation() {
    }

	/** minimal constructor */
    public OrdLoanAllocation(Integer requestId, Integer orgId, Date createDt, Integer createUserId, Integer orgCheckStatus) {
        this.requestId = requestId;
        this.orgId = orgId;
        this.createDt = createDt;
        this.createUserId = createUserId;
        this.orgCheckStatus = orgCheckStatus;
    }
    
    /** full constructor */
    public OrdLoanAllocation(Integer requestId, Integer orgId, Date createDt, Integer createUserId, Integer createUserType, Integer orgCheckStatus, String orgCheckMemo, Date orgCheckDt) {
        this.requestId = requestId;
        this.orgId = orgId;
        this.createDt = createDt;
        this.createUserId = createUserId;
        this.createUserType = createUserType;
        this.orgCheckStatus = orgCheckStatus;
        this.orgCheckMemo = orgCheckMemo;
        this.orgCheckDt = orgCheckDt;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRequestId() {
        return this.requestId;
    }
    
    public void setRequestId(Integer requestId) {
        this.requestId = requestId;
    }

    public Integer getOrgId() {
        return this.orgId;
    }
    
    public void setOrgId(Integer orgId) {
        this.orgId = orgId;
    }

    public Date getCreateDt() {
        return this.createDt;
    }
    
    public void setCreateDt(Date createDt) {
        this.createDt = createDt;
    }

    public Integer getCreateUserId() {
        return this.createUserId;
    }
    
    public void setCreateUserId(Integer createUserId) {
        this.createUserId = createUserId;
    }

    public Integer getCreateUserType() {
        return this.createUserType;
    }
    
    public void setCreateUserType(Integer createUserType) {
        this.createUserType = createUserType;
    }

    public Integer getOrgCheckStatus() {
        return this.orgCheckStatus;
    }
    
    public void setOrgCheckStatus(Integer orgCheckStatus) {
        this.orgCheckStatus = orgCheckStatus;
    }

    public String getOrgCheckMemo() {
        return this.orgCheckMemo;
    }
    
    public void setOrgCheckMemo(String orgCheckMemo) {
        this.orgCheckMemo = orgCheckMemo;
    }

    public Date getOrgCheckDt() {
        return this.orgCheckDt;
    }
    
    public void setOrgCheckDt(Date orgCheckDt) {
        this.orgCheckDt = orgCheckDt;
    }

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}
   








}