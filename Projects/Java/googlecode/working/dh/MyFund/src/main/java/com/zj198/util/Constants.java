package com.zj198.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.zj198.model.vo.ValueSetModel;


public class Constants{
	//性别
	public static final short USER_GENDER_FEMALE = 0;
	public static final short USER_GENDER_MALE = 1;
	
	//用户状态
	public static final short USER_STATUS_AVAILABLE = 0;	//正常
	public static final short USER_STATUS_BLOCKED = 1;		//阻止登录
	//用户信息验证情况
	public static final short USER_ACTIVE_NONE = 0;			//无验证
	public static final short USER_ACTIVE_EMAIL = 1;		//email已验证
	public static final short USER_ACTIVE_MOBILE = 2;		//mobile已验证
//	public static final short USER_CERTIFY_ = 4;			//xxx已验证
	
	//用户审核状态
	public static final short USER_AUDITSTATUS_NONE = 1;	//未审核
	public static final short USER_AUDITSTATUS_DONE = 0;	//已审核
	
	//用户类型
	public static final short USER_TYPE_NULL = 0;			//*未设置类型*
	public static final short USER_TYPE_PERSON = 1;			//个人
	public static final short USER_TYPE_PRODUCT = 2;		//生产型企业
	public static final short USER_TYPE_TRADE = 3;			//贸易型企业
	public static final short USER_TYPE_PROTRAMIX = 4;		//工贸一体型企业
	public static final short USER_TYPE_SERVICE = 5;		//服务型企业
	public static final short USER_TYPE_BANK = 6;			//银行
	public static final short USER_TYPE_INSURANCE = 7;		//保险公司
	public static final short USER_TYPE_LOAN = 8;			//小额贷款公司
	public static final short USER_TYPE_HOCK = 9;			//典当公司
	public static final short USER_TYPE_GUARANTEE = 10;		//担保公司
	public static final short USER_TYPE_RENT = 11;			//融资租赁公司
	public static final short USER_TYPE_PRIORG = 12;		//民间机构
	public static final short USER_TYPE_ACCOUNT = 13;		//会计师事务所
	public static final short USER_TYPE_ASSESSMENT = 14;	//评估公司
	public static final short USER_TYPE_REGULATE = 15;		//第三方监管公司
	public static final short USER_TYPE_LAWFIRM = 16;		//律师事务所
	public static final short USER_TYPE_INVESTCONST = 17;	//投资咨询公司
	
	//用户类型组
	public static final int USERTYPE_GROUP_COMPANY = 1;		//企业
	public static final int USERTYPE_GROUP_BANK = 2;		//银行
	public static final int USERTYPE_GROUP_FINANCEORG = 3;	//金融机构
	public static final int USERTYPE_GROUP_SERVICEORG = 4;	//服务机构
	public static final int USERTYPE_GROUP_PERSONAL = 5;	//个人
	
	//有  无
	public static final int LOANREQUEST_HAVE =1;
	public static final int LOANREQUEST_NO_HAVE = 0;
	
	//基础字典数据分类group
	public static final int BASEDATA_GROUP_EDUCATION = 1;	//教育学历
	public static final int BASEDATA_GROUP_IMTOOL = 2;		//即时通讯工具
	public static final int BASEDATA_GROUP_MARRY = 3;		//婚姻状态
	public static final int BASEDATA_GROUP_FUNDTYPE = 4;	//基金类型
	
	public static final int BASEDATA_GROUP_PERSONCAREER = 5;	//个人职业
	public static final int BASEDATA_GROUP_COMPANYTYPE = 6;		//企业类型,机构类型
	public static final int BASEDATA_GROUP_COMPANYEMPLOYEE = 7;	//企业员工人数
	public static final int BASEDATA_GROUP_WORKYEARS = 8;		//行业年限
	public static final int BASEDATA_GROUP_SERVICEPRODUCT = 9;	//服务机构的服务产品
	
	public static final int BASEDATA_GROUP_LOANTYPE = 10;		//
	public static final int BASEDATA_GROUP_LOANPURPOSE = 14;			//企业贷款用途
//	public static final int BASEDATA_GROUP_MORTGAGE = 15;					//抵押物
	public static final int BASEDATA_GROUP_RUNNINGTYPE = 1;			//企业经营类型 用户类型表（DIC_USERTYPE：group）
	public static final int BASEDATA_GROUP_PERSONSPEND = 17;			//个人消费贷款用途
	public static final int BASEDATA_GROUP_COMPANYNATURE = 18;			//现单位性质
	public static final int BASEDATA_GROUP_WORKTIME = 19;			//工作时长
	public static final int BASEDATA_GROUP_SALARY = 20;			//税后月收入
	public static final int BASEDATA_GROUP_PUTSALARYTYPE = 21;			//发薪方式
	public static final int BASEDATA_GROUP_SALARYLIST = 22;			//银行流水
	public static final int BASEDATA_GROUP_PERSONRUNNING = 23;			//个人经营贷款用途
	public static final int BASEDATA_GROUP_ALLYEARSALES = 24;			//年营业额
	public static final int BASEDATA_GROUP_HOUSENATURN = 25;			//房屋性质
	public static final int BASEDATA_GROUP_REPAYMENTTYPE = 26;			//还款方式
	public static final int BASEDATA_GROUP_LOANAPPLYTYPE=27;	        //快速融资申请类型
	public static final int BASEDATA_GROUP_CHECKSTATUS=29;			//快速申请状态
	
	public static final int BASEDATA_GROUP_FINANCE_TYPE=32;//融资贷款类型32
	public static final int BASEDATA_GROUP_RATE_TYPE=33;//贷款利率类型33
	public static final int BASEDATA_GROUP_FINANCE_REPAYMENT_TYPE=34;//支持还款方式34
	public static final int BASEDATA_GROUP_MORTGAGE_TYPE=35;//抵押类型35
	public static final int BASEDATA_GROUP_FINANCE_SPECIAL=36;//贷款产品特色36
	public static final int BASEDATA_GROUP_DATA_PUT_WAY=37;//补充资料递交方式37
	
	public static Map<String, LinkedHashMap<String, String>> valueSet = getValueSet();
	
	public static Map<String, LinkedHashMap<String, String>> getValueSet(){
		Map<String, LinkedHashMap<String, String>> m = new HashMap<String, LinkedHashMap<String, String>>();
		LinkedHashMap<String, String> v1 = new LinkedHashMap<String, String> ();
		v1.put("1", "需要");
		v1.put("0", "不需要");
		m.put("ZJ101", v1);//101  需要 不需要
		LinkedHashMap<String, String> v2 = new LinkedHashMap<String, String> ();
		v2.put("1", "是");
		v2.put("0", "否");
		m.put("ZJ102", v2);//102  是 否
		LinkedHashMap<String, String> v3 = new LinkedHashMap<String, String> ();
		v3.put("1", "必须");
		v3.put("0", "非必须");
		m.put("ZJ103", v3);//103  必须 非必须
		//#{0:'不限', 10:'10万元以上', 20:'20万元以上', 30:'30万元以上'}
		LinkedHashMap<String, String> v4 = new LinkedHashMap<String, String> ();
		v4.put("0", "不限");
		v4.put("10", "10万元以上");
		v4.put("20", "20万元以上");
		v4.put("30", "30万元以上");
		m.put("ZJ104", v4);
		//#{0:'不限', 1:'1年', 2:'2年', 3:'3年', 4:'4年', 5:'5年及以上'}
		LinkedHashMap<String, String> v5 = new LinkedHashMap<String, String> ();
		v5.put("0", "不限");
		v5.put("1", "1年");
		v5.put("2", "2年");
		v5.put("3", "3年");
		v5.put("4", "4年");
		v5.put("5", "5年及以上");
		m.put("ZJ105", v5);
		//#{0:'不限', 1:'一年以上',  3:'三年以上', 5:'五年以上', 10:'十年以上', 20:'二十年以上'}
		LinkedHashMap<String, String> v6 = new LinkedHashMap<String, String> ();
		v6.put("0", "不限");
		v6.put("1", "一年以上");
		v6.put("3", "三年以上");
		v6.put("5", "五年以上");
		v6.put("10", "十年以上");
		v6.put("20", "二十年以上");
		m.put("ZJ106", v6);
		//#{0:'不限', 2000:'2000元以上', 5000:'5000元以上', 10000:'10000元以上'}
		LinkedHashMap<String, String> v7 = new LinkedHashMap<String, String> ();
		v7.put("0", "不限");
		v7.put("2000", "2000元以上");
		v7.put("5000", "5000元以上");
		v7.put("10000", "10000元以上");
		m.put("ZJ107", v7);
//		#{0:'不限', 1:'须打卡'}
		LinkedHashMap<String, String> v8 = new LinkedHashMap<String, String> ();
		v8.put("0", "不限");
		v8.put("1", "须打卡");
		m.put("ZJ108", v8);
//		#{0:'不限', 12:'一年以上', 36:'三年以年'}
		LinkedHashMap<String, String> v9 = new LinkedHashMap<String, String> ();
		v9.put("0", "不限");
		v9.put("12", "一年以上");
		v9.put("36", "三年以上");
		m.put("ZJ109", v9);
		return m;
	}
	

}