package com.zj198.action.loan;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.action.loan.model.LoanOrgCountModel;
import com.zj198.model.DicCommon;
import com.zj198.model.DicIndustry;
import com.zj198.model.DicProvince;
import com.zj198.model.DicUsertype;
import com.zj198.model.OrdLoanRequest;
import com.zj198.model.UsrUser;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.loan.LoanRequestService;
import com.zj198.util.Constants;
import com.zj198.util.Pagination;

/**
 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-6-20 10:07:45
 * @modify: zeroleavebaoyang@gmail.com
 * @modifytime: 2012-6-28 13:21:23
 */
public class LoanRequestAction extends BaseAction {
    private String applyNum;

    private Map<String, List<DicCommon>> dataMap;

    private DictoryDataService dictoryDataService;

    private Integer industryId;

    private List<DicIndustry> industryList;// 行业

    private List<DicProvince> listProvince;// 所有省份

    private OrdLoanRequest loan;

    private String[] loanObjects;

    private LoanOrgCountModel loanOrgCountModel;// 贷款机构汇总

    private LoanRequestService loanRequestService;


    private Integer maxBound;

    private Integer minBound;

    private List<OrdLoanRequest> loans;

    private Integer pageNo;

    private Pagination pagination;

    private final int pageSize = 10;


    private List<DicUsertype> userTypeList;
    /**
     * 基准利率
     */
    private Double baseRate;

    private Short userType;
    
    private Date createdtFirst;
    private Date createdtSecond;
    private Double loanAmountOne;
    private Double loanAmountTwo;
    private Integer loanMonthOne;
    private Integer loanMonthTwo;

	/**
     * 企业快速申请融资第一步
     * 
     * @return
     */
    public String busiFirst() {
        dataMap = new HashMap<String, List<DicCommon>>();
        /**
         * 获取企业贷款用途字典
         */
        dataMap.put("loanpurpose", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_LOANPURPOSE));
        userTypeList = dictoryDataService.findUserTypeByGroup(Integer.valueOf(Constants.BASEDATA_GROUP_RUNNINGTYPE));
        return "busiFirst";
    }

    public String execute() {
        return null;
    }

//    public void validateLoanSecond() {
//        if (loan.getApplyType().intValue() == 136) {
//            if (loan.getLoanAmount() == null) {
//                addFieldError("loan.applyType", "请输入贷款金额！");
//            }
//        }
//    }
    /**
     * 
     * @Author zeroleavebaoyang@gmail.com
     * @Description 行业异步级联显示
     * @return
     */
    public String Industry() {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/xml; charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache"); // 取消浏览器缓存

        PrintWriter out;
        try {
            industryList = dictoryDataService.findIndustryByParentid(industryId);
            out = response.getWriter();
            out.println("<response>");
            for (DicIndustry ind : industryList) {
                out.println("<inds>" + ind.getId() + "</inds><inds>" + ind.getName() + "</inds>");
            }
            out.println("</response>");
            out.flush();
            out.close();
            return null;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String loanRequest() {
        if (loan != null && loan.getApplyType() != null) {
            if (loan.getApplyType().intValue() == 136) {
                return busiFirst();
            } else if (loan.getApplyType().intValue() == 137) {
                return percostFirst();
            } else if (loan.getApplyType().intValue() == 138) {
                return perrunFirst();
            } else if (loan.getApplyType().intValue() == 139) {
                return perhouseFirst();
            }
        }
        return busiFirst();
    }

    /**
     * 企业快速申请融资第二步 统计各种贷款机构的数量
     * 
     * @return
     */
    public String loanSecond() {
        /**
         * validate data
         */
        if (loan.getApplyType().intValue() == 136) {// 企业快速申请融资
            if (loan.getLoanAmount() == null || loan.getLoanMonth() == null || loan.getLastyearCost() == null
                    || loan.getLastyearDebt() == null || loan.getLastyearProfit() == null
                    || loan.getLastyearVolume() == null || loan.getHaveMortgage() == null) {
                msg = "请填写完所有必填项，再提交申请！";
                return busiFirst();
            }
        }
        if (loan.getApplyType().intValue() == 137) {// 个人综合消费快速申请
            if (loan.getLoanAmount() == null || loan.getLoanMonth() == null || loan.getHaveMortgage() == null
                    || loan.getCompanyType() == null || loan.getWorkTime() == null || loan.getSalaryLevel() == null
                    || loan.getPutSalaryType() == null || loan.getHaveHouse() == null || loan.getHostoryLoan() == null
                    || loan.getUserCreditCard() == null || loan.getBankSalaryList() == null) {
                msg = "请填写完所有必填项，再提交申请！";
                return percostFirst();
            }
        }
        if (loan.getApplyType().intValue() == 138) {// 个人经营快速申请
            if (loan.getLoanAmount() == null || loan.getLoanMonth() == null || loan.getHaveMortgage() == null
                    || loan.getRunningTrade() == null || loan.getExperience() == null
                    || loan.getAllyearVolume() == null || loan.getRunningArea() == null
                    || loan.getHostoryLoan() == null || loan.getUserCreditCard() == null
                    || loan.getBankSalaryList() == null) {
                msg = "请填写完所有必填项，再提交申请！";
                return perrunFirst();
            }
        }
        if (loan.getApplyType().intValue() == 139) {// 个人购房快速申请
            if (loan.getHouseNature() == null || loan.getLoanMonth() == null || loan.getRepaymentType() == null
                    || loan.getBirthday() == null || loan.getTeachLevel() == null || loan.getCompanyType() == null
                    || loan.getWorkTime() == null || loan.getSalaryLevel() == null || loan.getPutSalaryType() == null
                    || loan.getHaveHouse() == null || loan.getUserCreditCard() == null
                    || loan.getBankSalaryList() == null) {
                msg = "请填写完所有必填项，再提交申请！";
                return perhouseFirst();
            }
        }

        loanOrgCountModel = new LoanOrgCountModel();
        loanOrgCountModel.setBankNum(loanRequestService.countBankNum());
        loanOrgCountModel.setFinanceOrg(loanRequestService.countUserByType(Short.valueOf(Constants.USER_TYPE_RENT)));
        loanOrgCountModel.setInsuranceOrg(loanRequestService.countUserByType(Short
                .valueOf(Constants.USER_TYPE_INSURANCE)));
        loanOrgCountModel.setLittleLoan(loanRequestService.countUserByType(Short.valueOf(Constants.USER_TYPE_LOAN)));
        loanOrgCountModel.setPawnOrg(loanRequestService.countUserByType(Short.valueOf(Constants.USER_TYPE_HOCK)));
        loanOrgCountModel.setPopularOrg(loanRequestService.countUserByType(Short.valueOf(Constants.USER_TYPE_PRIORG)));
        loanOrgCountModel
                .setWarrantOrg(loanRequestService.countUserByType(Short.valueOf(Constants.USER_TYPE_GUARANTEE)));
        
        baseRate = loanRequestService.getBaseRate(loan.getLoanMonth());
        return "loanSecond";
    }

    /**
     * 企业快速申请融资第三步
     * 
     * @return
     */
    public String loanThird() {
        ActionContext context = ActionContext.getContext();
        if (context.getSession().get("_user") == null) {
            msg = "用户未登陆，不允许申请融资";
            return "loanThird";
        }
        UsrUser user = (UsrUser) context.getSession().get("_user");
        if (loan.getApplyType().intValue() == 136 && user.getType().intValue() == 1) {
            msg = "个人用户不允许申请企业融资！";
            return "loanThird";
        }
        loan.setUserId(user.getId());
        applyNum = loanRequestService.saveLoanRequest(loan, loanObjects, minBound, maxBound);
        return "loanThird";
    }

    /**
     * 个人综合消费快速申请融资第一步
     * 
     * @return
     */
    public String percostFirst() {
        dataMap = new HashMap<String, List<DicCommon>>();
        dataMap.put("loanpurpose", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_PERSONSPEND));
        dataMap.put("teachlevel", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_EDUCATION));
        dataMap.put("companynature", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_COMPANYNATURE));
        dataMap.put("worktime", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_WORKTIME));
        dataMap.put("salary", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_SALARY));
        dataMap.put("putsalarytype", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_PUTSALARYTYPE));
        dataMap.put("salarylist", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_SALARYLIST));

        return "percostFirst";
    }

    /**
     * 个人购房快速申请融资第一步
     * 
     * @return
     */
    public String perhouseFirst() {
        dataMap = new HashMap<String, List<DicCommon>>();
        dataMap.put("housenaturn", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_HOUSENATURN));
        dataMap.put("teachlevel", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_EDUCATION));
        dataMap.put("companynature", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_COMPANYNATURE));
        dataMap.put("worktime", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_WORKTIME));
        dataMap.put("salary", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_SALARY));
        dataMap.put("putsalarytype", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_PUTSALARYTYPE));
        dataMap.put("repaymenttype", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_REPAYMENTTYPE));
        return "perhouseFirst";
    }

    /**
     * 个人经营快速申请融资第一步
     * 
     * @return
     */
    public String perrunFirst() {
        dataMap = new HashMap<String, List<DicCommon>>();
        industryList = dictoryDataService.findIndustryByParentid(0);
        dataMap.put("loanpurpose", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_PERSONRUNNING));
        dataMap.put("allyearsales", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_ALLYEARSALES));
        dataMap.put("salarylist", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_SALARYLIST));
        return "perrunFirst";
    }
	//融资服务
	public String financingService(){
		return "financing";
	}
    
    
    /**
     * 
     * @Author zeroleavebaoyang@gmail.com
     * @Description 融资需求管理
     * @return
     */
    @SuppressWarnings("unchecked")
    public String loanManage() {
        ActionContext context = ActionContext.getContext();
        UsrUser user = (UsrUser) context.getSession().get("_user");
        if (user == null) {
            return "index";
        }
        this.userType = user.getType();
        pageNo = null == pageNo ? 1 : pageNo;
        if (userType != 6) {
            Map<String, Object> map = this.loanRequestService.getPagationList(
                    "from OrdLoanRequest as m where m.userId =:userId", user.getId(), pageSize, pageNo);
            this.pagination = (Pagination) map.get("pagination");
            this.loans = (List<OrdLoanRequest>) map.get("list");
        } else {
            dataMap = new HashMap<String, List<DicCommon>>();
            Map<String, Map<String, Object>> mapCondition = new HashMap<String, Map<String, Object>>();
			if (createdtFirst != null && !"".equals(createdtFirst) && createdtSecond != null && !"".equals(createdtSecond)){
				Map<String, Object> m = new LinkedHashMap<String, Object>();
				m.put("createdtFirst", createdtFirst);
				m.put("createdtSecond", createdtSecond);
				mapCondition.put("createdt", m);
			}
			if (loanAmountOne != null && !"".equals(loanAmountOne) && loanAmountTwo != null && !"".equals(loanAmountTwo)){
				Map<String, Object> m = new LinkedHashMap<String, Object>();
				m.put("loanAmountOne", loanAmountOne);
				m.put("loanAmountTwo", loanAmountTwo);
				mapCondition.put("loanAmount", m);
			}
			if (loanMonthOne != null && !"".equals(loanMonthOne) && loanMonthTwo != null && !"".equals(loanMonthTwo)){
				Map<String, Object> m = new LinkedHashMap<String, Object>();
				m.put("loanMonthOne", loanMonthOne);
				m.put("loanMonthTwo", loanMonthTwo);
				mapCondition.put("loanMonth", m);
			}
            dataMap.put("loanpurpose", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_PERSONSPEND));
            dataMap.put("loantype", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_LOANAPPLYTYPE));
            Map<String, Object> map = this.loanRequestService.getByObjCondition(loan, mapCondition, pageSize, pageNo);
            this.pagination = (Pagination) map.get("pagination");
            this.loans = (List<OrdLoanRequest>) map.get("list");
        }
        return "loanManage";
    }

    public String loanManageDetail() {
        this.loan = loanRequestService.getOrdDetailById(industryId);
        return "loanManageDetail";
    }

    public List<OrdLoanRequest> getLoans() {
        return loans;
    }

    public void setApplyNum(String applyNum) {
        this.applyNum = applyNum;
    }

    public void setDataMap(Map<String, List<DicCommon>> dataMap) {
        this.dataMap = dataMap;
    }

    public void setDictoryDataService(DictoryDataService dictoryDataService) {
        this.dictoryDataService = dictoryDataService;
    }

    public void setIndustryId(Integer industryId) {
        this.industryId = industryId;
    }

    public void setIndustryList(List<DicIndustry> industryList) {
        this.industryList = industryList;
    }

    public void setListProvince(List<DicProvince> listProvince) {
        this.listProvince = listProvince;
    }

    public void setLoan(OrdLoanRequest loan) {
        this.loan = loan;
    }

    public void setLoanObjects(String[] loanObjects) {
        this.loanObjects = loanObjects;
    }

    public void setLoanOrgCountModel(LoanOrgCountModel loanOrgCountModel) {
        this.loanOrgCountModel = loanOrgCountModel;
    }

    public void setLoanRequestService(LoanRequestService loanRequestService) {
        this.loanRequestService = loanRequestService;
    }



    public void setMaxBound(Integer maxBound) {
        this.maxBound = maxBound;
    }

    public void setMinBound(Integer minBound) {
        this.minBound = minBound;
    }

    public void setUserTypeList(List<DicUsertype> userTypeList) {
        this.userTypeList = userTypeList;
    }

    public String getApplyNum() {
        return applyNum;
    }

    public Map<String, List<DicCommon>> getDataMap() {
        return dataMap;
    }

    public Integer getIndustryId() {
        return industryId;
    }

    public List<DicIndustry> getIndustryList() {
        return industryList;
    }

    public List<DicProvince> getListProvince() {
        return listProvince;
    }

    public OrdLoanRequest getLoan() {
        return loan;
    }

    public String[] getLoanObjects() {
        return loanObjects;
    }

    public LoanOrgCountModel getLoanOrgCountModel() {
        return loanOrgCountModel;
    }

    public Integer getMaxBound() {
        return maxBound;
    }

    public Integer getMinBound() {
        return minBound;
    }

    public List<DicUsertype> getUserTypeList() {
        return userTypeList;
    }

	public Double getBaseRate() {
		return baseRate;
	}

	public void setBaseRate(Double baseRate) {
		this.baseRate = baseRate;
	}

    public Integer getPageNo() {
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    public Pagination getPagination() {
        return pagination;
    }

    public void setPagination(Pagination pagination) {
        this.pagination = pagination;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setLoans(List<OrdLoanRequest> loans) {
        this.loans = loans;
    }

    public void setUserType(Short userType) {
        this.userType = userType;
    }

    public Short getUserType() {
        return userType;
    }

    public Date getCreatedtFirst() {
		return createdtFirst;
	}

	public void setCreatedtFirst(Date createdtFirst) {
		this.createdtFirst = createdtFirst;
	}

	public Date getCreatedtSecond() {
		return createdtSecond;
	}

	public void setCreatedtSecond(Date createdtSecond) {
		this.createdtSecond = createdtSecond;
	}

	public Double getLoanAmountOne() {
		return loanAmountOne;
	}

	public void setLoanAmountOne(Double loanAmountOne) {
		this.loanAmountOne = loanAmountOne;
	}

	public Double getLoanAmountTwo() {
		return loanAmountTwo;
	}

	public void setLoanAmountTwo(Double loanAmountTwo) {
		this.loanAmountTwo = loanAmountTwo;
	}

	public Integer getLoanMonthOne() {
		return loanMonthOne;
	}

	public void setLoanMonthOne(Integer loanMonthOne) {
		this.loanMonthOne = loanMonthOne;
	}

	public Integer getLoanMonthTwo() {
		return loanMonthTwo;
	}

	public void setLoanMonthTwo(Integer loanMonthTwo) {
		this.loanMonthTwo = loanMonthTwo;
	}

	public LoanRequestService getLoanRequestService() {
		return loanRequestService;
	}




}
