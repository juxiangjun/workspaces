package com.zj198.model;

import java.util.Date;

import com.zj198.util.Constants;
import com.zj198.util.StringUtil;

/**
 * UsrFinanceorg entity. @author MyEclipse Persistence Tools
 */

public class UsrFinanceorg implements java.io.Serializable {

	private static final long serialVersionUID = -3113719311666149796L;
	private Integer userid;
	private String orgname;
	private String licensecode;
	private String organizationcode;
	private String faxcode;
	private String legalperson;
	private Integer regprovinceid;
	private Integer regcityid;
	private Integer regdistrictid;
	private String regaddress;
	private String regpostcode;
	private Date registerdate;
	private Double registeredcapital;
	private Integer orgtypeid;
	private String bizscope;
	private Integer bizprovinceid;
	private Integer bizcityid;
	private Integer bizdistrictid;
	private String bizaddress;
	private String bizpostcode;
	private String linkname;
	private Short linkgender;
	private String linkemail;
	private String linktelephone;
	private String department;
	private String position;
	private String remarks;
	private Integer completerate;
	private String typeName;

	/** default constructor */
	public UsrFinanceorg() {
	}
//	/**保护审核字段*** @param usrFinanceorg*/       
//	public void setAuditFields(UsrFinanceorg usrFinanceorg) {
//		this.orgname = usrFinanceorg.orgname;                    //机构名称
//		this.licensecode = usrFinanceorg.licensecode;            //营业执照号码
//		this.organizationcode = usrFinanceorg.organizationcode;  //组织机构号码证
//		this.faxcode = usrFinanceorg.faxcode;                    //税务登记证
//		this.regprovinceid = usrFinanceorg.regprovinceid;        //注册地址省id
//		this.regcityid = usrFinanceorg.regcityid;                //注册地址城市id
//		this.regdistrictid = usrFinanceorg.regdistrictid;        //注册地址区县id
//		this.regaddress = usrFinanceorg.regaddress;              //注册地址详细地址
//		this.regpostcode = usrFinanceorg.regpostcode;            //注册地址邮政编码
//		this.registerdate = usrFinanceorg.registerdate;          //注册日期
//		this.legalperson = usrFinanceorg.legalperson;
//		this.registeredcapital = usrFinanceorg.registeredcapital;
//		this.orgtypeid = usrFinanceorg.orgtypeid;
//		this.bizscope = usrFinanceorg.bizscope;
//		this.bizprovinceid = usrFinanceorg.bizprovinceid;
//		this.bizcityid = usrFinanceorg.bizcityid;
//		this.bizdistrictid = usrFinanceorg.bizdistrictid;
//		this.bizaddress = usrFinanceorg.bizaddress;
//		this.bizpostcode = usrFinanceorg.bizpostcode;
//		this.linkname = usrFinanceorg.linkname;
//		this.linkgender = usrFinanceorg.linkgender;
//		this.linkemail = usrFinanceorg.linkemail;
//		this.linktelephone = usrFinanceorg.linktelephone;
//		this.department = usrFinanceorg.department;
//		this.position = usrFinanceorg.position;
//		this.remarks = usrFinanceorg.remarks;
//	}
	/**验证审核字段 // 返回字段以0#或1#开头   0#验证正确  1#验证失败*/
	public String validAuditFields(UsrFinanceorg usrFinanceorg) {
		String msg="1#";
		if(!StringUtil.validString(usrFinanceorg.orgname) || !StringUtil.validlength(usrFinanceorg.orgname, 30)){
			msg+="机构名称填写错误。";
			return msg;
		}
		if(!StringUtil.validLicCode(usrFinanceorg.licensecode) || !StringUtil.validlength(usrFinanceorg.licensecode, 15)){
			msg+="营业执照号码填写错误。";
			return msg;
		}
		if(!StringUtil.validOrganization(usrFinanceorg.organizationcode) || !StringUtil.validlength(usrFinanceorg.organizationcode, 10)){
			msg+="组织机构代码证号码填写错误。";
			return msg;
		}
		if(!StringUtil.validLicCode(usrFinanceorg.faxcode) || !StringUtil.validlength(usrFinanceorg.faxcode, 15)){
			msg+="税务登记证号码填写错误。";
			return msg;
		}
		if(!StringUtil.validAddress(usrFinanceorg.regaddress) || !StringUtil.validlength(usrFinanceorg.regaddress, 32)){
			msg+="注册详细地址填写错误。";
			return msg;
		}
		if(!StringUtil.validCode(usrFinanceorg.regpostcode)){
			msg+="注册地址邮政编码填写错误。";
			return msg;
		}
		if(!StringUtil.validRname(usrFinanceorg.legalperson)){
			msg+="法人姓名填写错误，只能为中文。";
			return msg;
		}
		if(!StringUtil.validDouble(usrFinanceorg.registeredcapital) || !StringUtil.validlengthD(usrFinanceorg.registeredcapital, 12)){
			msg+="注册资本填写错误,只能为整数字且不大于12个字符。";
			return msg;
		}
		if(!StringUtil.validlength(usrFinanceorg.bizscope, 250)){
			msg+="经营范围填写字符过长，200个字符以内。。";
			return msg;
		}
		if(!StringUtil.validAddress(usrFinanceorg.bizaddress) || !StringUtil.validlength(usrFinanceorg.bizaddress, 32)){
			msg+="经营详细地址填写错误。";
			return msg;
		}
		if(!StringUtil.validCode(usrFinanceorg.bizpostcode)){
			msg+="经营地址邮政编码填写错误。";
			return msg;
		}
		if(!StringUtil.validRname(usrFinanceorg.linkname)){
			msg+="联系人姓名填写错误，只能为中文。";
			return msg;
		}
		if(usrFinanceorg.linkgender!=null && usrFinanceorg.linkgender!=Constants.USER_GENDER_FEMALE && usrFinanceorg.linkgender!=Constants.USER_GENDER_MALE){
			msg+="请选择联系人性别。";
			return msg;
		}
		if(!StringUtil.validString(usrFinanceorg.department) || !StringUtil.validlength(usrFinanceorg.department, 8)){
			msg+="联系人所属部门填写错误。";
			return msg;
		}
		if(!StringUtil.validString(usrFinanceorg.position) || !StringUtil.validlength(usrFinanceorg.position, 8)){
			msg+="联系人职业填写错误。";
			return msg;
		}
		if(!StringUtil.validlength(usrFinanceorg.remarks, 250)){
			msg+="机构介绍填写字符过长，200个字符以内。";
			return msg;
		}
		if(!StringUtil.validEmail(usrFinanceorg.linkemail)){
			msg+="联系人邮箱填写错误。";
			return msg;
		}
		if(!StringUtil.validMobile(usrFinanceorg.linktelephone)){
			msg+="联系人电话填写错误。";
			return msg;
		}
		msg="0#";
		return msg;
	}
//	/**停用  */
//	/**非审核非必填字段 对审核字段的保护 在待审核状态下使用*/
//	public void setOthersFields(UsrFinanceorg usrFinanceorg){
//		
//	}
//	/**停用  */
//	/**验证非审核非必填字段 // 返回字段以0#或1#开头   0#验证正确  1#验证失败*/
//	public String validOthersFields(UsrFinanceorg usrFinanceorg){
//		String msg="1#";
//		
//		msg="0#";
//		return msg;
//	}
	// Property accessors
	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getOrgname() {
		return this.orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}

	public String getLicensecode() {
		return this.licensecode;
	}

	public void setLicensecode(String licensecode) {
		this.licensecode = licensecode;
	}

	public String getOrganizationcode() {
		return this.organizationcode;
	}

	public void setOrganizationcode(String organizationcode) {
		this.organizationcode = organizationcode;
	}

	public String getFaxcode() {
		return this.faxcode;
	}

	public void setFaxcode(String faxcode) {
		this.faxcode = faxcode;
	}

	public String getLegalperson() {
		return this.legalperson;
	}

	public void setLegalperson(String legalperson) {
		this.legalperson = legalperson;
	}

	public Integer getRegprovinceid() {
		return this.regprovinceid;
	}

	public void setRegprovinceid(Integer regprovinceid) {
		this.regprovinceid = regprovinceid;
	}

	public Integer getRegcityid() {
		return this.regcityid;
	}

	public void setRegcityid(Integer regcityid) {
		this.regcityid = regcityid;
	}

	public Integer getRegdistrictid() {
		return this.regdistrictid;
	}

	public void setRegdistrictid(Integer regdistrictid) {
		this.regdistrictid = regdistrictid;
	}

	public String getRegaddress() {
		return this.regaddress;
	}

	public void setRegaddress(String regaddress) {
		this.regaddress = regaddress;
	}

	public String getRegpostcode() {
		return this.regpostcode;
	}

	public void setRegpostcode(String regpostcode) {
		this.regpostcode = regpostcode;
	}

	public Date getRegisterdate() {
		return this.registerdate;
	}

	public void setRegisterdate(Date registerdate) {
		this.registerdate = registerdate;
	}

	public Double getRegisteredcapital() {
		return this.registeredcapital;
	}

	public void setRegisteredcapital(Double registeredcapital) {
		this.registeredcapital = registeredcapital;
	}

	public Integer getOrgtypeid() {
		return this.orgtypeid;
	}

	public void setOrgtypeid(Integer orgtypeid) {
		this.orgtypeid = orgtypeid;
	}

	public String getBizscope() {
		return this.bizscope;
	}

	public void setBizscope(String bizscope) {
		this.bizscope = bizscope;
	}

	public Integer getBizprovinceid() {
		return this.bizprovinceid;
	}

	public void setBizprovinceid(Integer bizprovinceid) {
		this.bizprovinceid = bizprovinceid;
	}

	public Integer getBizcityid() {
		return this.bizcityid;
	}

	public void setBizcityid(Integer bizcityid) {
		this.bizcityid = bizcityid;
	}

	public Integer getBizdistrictid() {
		return this.bizdistrictid;
	}

	public void setBizdistrictid(Integer bizdistrictid) {
		this.bizdistrictid = bizdistrictid;
	}

	public String getBizaddress() {
		return this.bizaddress;
	}

	public void setBizaddress(String bizaddress) {
		this.bizaddress = bizaddress;
	}

	public String getBizpostcode() {
		return this.bizpostcode;
	}

	public void setBizpostcode(String bizpostcode) {
		this.bizpostcode = bizpostcode;
	}

	public String getLinkname() {
		return this.linkname;
	}

	public void setLinkname(String linkname) {
		this.linkname = linkname;
	}

	public Short getLinkgender() {
		return this.linkgender;
	}

	public void setLinkgender(Short linkgender) {
		this.linkgender = linkgender;
	}

	public String getDepartment() {
		return this.department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getPosition() {
		return this.position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Integer getCompleterate() {
		return completerate;
	}

	public void setCompleterate(Integer completerate) {
		this.completerate = completerate;
	}

	public String getLinkemail() {
		return linkemail;
	}

	public void setLinkemail(String linkemail) {
		this.linkemail = linkemail;
	}

	public String getLinktelephone() {
		return linktelephone;
	}

	public void setLinktelephone(String linktelephone) {
		this.linktelephone = linktelephone;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

}