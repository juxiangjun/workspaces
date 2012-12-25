package com.zj198.service.loan.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.fund.model.FundIntention;
import com.zj198.action.loan.model.FinanceApplySpModel;
import com.zj198.dao.DicCommonDAO;
import com.zj198.dao.OrdCheckLogDAO;
import com.zj198.dao.OrdFaAttachListDAO;
import com.zj198.dao.OrdFinanceApplyAttachDAO;
import com.zj198.dao.OrdFinanceApplyDAO;
import com.zj198.dao.PrdExtendsPropertyDAO;
import com.zj198.dao.PrdExtendsValueDAO;
import com.zj198.dao.PrdFinanceDAO;
import com.zj198.dao.PrdPropertyDicDAO;
import com.zj198.dao.UsrCompanyDAO;
import com.zj198.dao.UsrUserDAO;
import com.zj198.model.AdmUser;
import com.zj198.model.NtyMessageQueue;
import com.zj198.model.OrdApplyUsrCompany;
import com.zj198.model.OrdCheckLog;
import com.zj198.model.OrdCheckRecordApply;
import com.zj198.model.OrdFaAttachList;
import com.zj198.model.OrdFee;
import com.zj198.model.OrdFinanceAppLoan;
import com.zj198.model.OrdFinanceApply;
import com.zj198.model.OrdFinanceApplyAttach;
import com.zj198.model.PrdExtendsProperty;
import com.zj198.model.PrdExtendsValue;
import com.zj198.model.PrdFinance;
import com.zj198.model.PrdFinanceDatafile;
import com.zj198.model.PrdPropertyDic;
import com.zj198.model.UsrCompany;
import com.zj198.model.UsrPerson;
import com.zj198.model.UsrUser;
import com.zj198.model.vo.FinanceApplyAttachModel;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.common.NotifyQueueService;
import com.zj198.service.loan.FinanceApplyService;
import com.zj198.service.loan.OrdCheckRecordApplyService;
import com.zj198.service.loan.OrdFinanceAppLoanService;
import com.zj198.service.loan.OrdLogService;
import com.zj198.service.loan.model.FindFinanceApplySpModel;
import com.zj198.service.loan.model.SaveAttachListSpModel;
import com.zj198.service.message.NtyMessageService;
import com.zj198.service.message.model.SendMobileMspSpModel;
import com.zj198.service.message.model.SendWebMsgSpModel;
import com.zj198.service.partner.OrdFeeService;
import com.zj198.service.user.ProfileService;
import com.zj198.util.Constants;
import com.zj198.util.DateUtil;
import com.zj198.util.FreemarkerUtil;
import com.zj198.util.OrderNOCreator;
import com.zj198.util.Pager;
import com.zj198.util.PropertiesUtil;
import com.zj198.util.UploadUtil;

/**
 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 15:09:58
 */
public class FinanceApplyServiceImpl implements FinanceApplyService {
	private PrdFinanceDAO prdFinanceDAO;
	private OrdFinanceApplyDAO ordFinanceApplyDAO;
	private OrdFinanceApplyAttachDAO ordFinanceApplyAttachDAO;
	private OrdFaAttachListDAO ordFaAttachListDAO;
	private OrdCheckLogDAO ordCheckLogDAO;
	private UsrCompanyDAO usrCompanyDAO;
	private DicCommonDAO dicCommonDAO;
	private PrdExtendsPropertyDAO prdExtendsPropertyDAO;
	private PrdPropertyDicDAO prdPropertyDicDAO;
	private PrdExtendsValueDAO prdExtendsValueDAO;
	private UsrUserDAO usrUserDAO;
	private ProfileService profileService;
	private NtyMessageService ntyMessageService;
	private OrdLogService ordLogService;
	private DictoryDataService dictoryDataService;
	private OrdCheckRecordApplyService ordCheckRecordApplyService;
	private OrdFeeService ordFeeService;
	private OrdFinanceAppLoanService ordFinanceAppLoanService;

	public void setOrdFinanceAppLoanService(
			OrdFinanceAppLoanService ordFinanceAppLoanService) {
		this.ordFinanceAppLoanService = ordFinanceAppLoanService;
	}

	public void setOrdFeeService(OrdFeeService ordFeeService) {
		this.ordFeeService = ordFeeService;
	}

	public void setOrdCheckRecordApplyService(OrdCheckRecordApplyService ordCheckRecordApplyService) {
		this.ordCheckRecordApplyService = ordCheckRecordApplyService;
	}

	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}

	/**
	 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 15:09:58
	 * @param
	 * @return
	 */
	public Pager findUserApply(int currentPage, int pageCount,Integer userId) {
		return this.ordFinanceApplyDAO.findUserApply(currentPage, pageCount, userId);
	}

	public Pager orgFindFinanceApply(FinanceApplySpModel spModel) {
		return this.ordFinanceApplyDAO.orgFindFinanceApply(spModel);
	}

	public String saveAttach(File upload, String uploadFileName, String uploadContentType, Integer attachId, String path, Integer userId, Integer attachType, Integer applyId) {
		String result = "";
		String newFileName = UploadUtil.upload(upload, uploadFileName, "loan", Constants.UPLOAD_PRIVACY_PRIVATE);
		if (attachType.intValue() == 1) {
			OrdFinanceApply apply = ordFinanceApplyDAO.get(applyId);
			apply.setAgreeFileUpload(newFileName);
			apply.setAgreeUploadTime(new Date());
			apply.setAgreeUploadWay(0);//线上上传
			apply.setAgreeStatus(Constants.ORD_ATTACH_UPLOADED);
			ordFinanceApplyDAO.update(apply);
		} else {
			OrdFaAttachList fa = new OrdFaAttachList();
			fa.setAttachId(attachId);
			fa.setFileName(newFileName);
			fa.setOldFileName(uploadFileName);
			fa.setCreatedt(new Date());
			fa.setCreateUserId(userId);
			fa.setUploadPath(path);
			fa.setIsDeleted(0);
			ordFaAttachListDAO.save(fa);
			OrdFinanceApplyAttach attach = ordFinanceApplyAttachDAO.get(attachId);
			// 如果是被资金方或者资金网退回的资料，再次重新上传状态应该变为“修改待确认”
//			if (attach.getUploadStatus() == 215) {
//				attach.setUploadStatus(Constants.ORD_ATTACH_WAIT_SUB);
//			} else {
//				attach.setUploadStatus(Constants.ORD_ATTACH_UPLOADED);
//			}
			attach.setUploadStatus(Constants.ORD_ATTACH_UPLOADED);
			attach.setUploadWay(0);//线上
			ordFinanceApplyAttachDAO.saveOrUpdate(attach);
		}
		return result;
	}

	public List<OrdFaAttachList> findAttachList(Integer attachId) {
		return ordFaAttachListDAO.findAttachList(attachId);
	}

	public void savefinanceAttach(OrdFinanceApplyAttach attach) {
		OrdFinanceApplyAttach oaa = ordFinanceApplyAttachDAO.get(attach.getId());
		oaa.setUploadStatus(attach.getUploadStatus());
		ordFinanceApplyAttachDAO.update(oaa);
	}

	/**
	 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 15:09:58
	 * @param
	 * @return
	 */
	public String saveFinanceApply(OrdFinanceApply apply, Integer productId, UsrUser user, FinanceApplySpModel spModel) {
		PrdFinance product = prdFinanceDAO.get(productId);
		apply.setFinanceId(productId);
		apply.setApplyType(product.getFinanceType());
		apply.setApplyStatus(Constants.ORD_ZJW_CHECKING);// 待审核
		apply.setCreatedt(new Date());
		apply.setUserId(user.getId());
		apply.setIsdeleted(Integer.valueOf(0));
		apply.setAgreeStatus(Constants.ORD_ATTACH_NO_UPLOAD);//协议未上传
		if (user.getUserTypeGroup().intValue() == 1) {
			UsrCompany company = usrCompanyDAO.get(user.getId());
			if (company != null) {
				apply.setApplyUserName(company.getCompanyname());
			}
		} else {
			apply.setApplyUserName(user.getRealname());
		}
		ordFinanceApplyDAO.save(apply);

		String applyNum = OrderNOCreator.rapidFinanceApplyOrderNO(apply.getId().intValue());// 申请编号
		apply.setApplyNum(applyNum);
		ordFinanceApplyDAO.update(apply);
		ordLogService.saveLogByStatus(Constants.ORD_CHECK_LOG_USERANDORG, null, apply, user.getRealname());

		Set<PrdFinanceDatafile> dfs = product.getDataFiles();
		for (PrdFinanceDatafile df : dfs) {
			OrdFinanceApplyAttach ofaa = new OrdFinanceApplyAttach();
			ofaa.setApplyId(apply.getId());
			ofaa.setDatalistId(df.getDatafileId());
			ofaa.setFinanceDataId(df.getId());
			ofaa.setUploadStatus(Integer.valueOf(212));// 未递交
			ofaa.setIsdeleted(Integer.valueOf(0));
			ofaa.setSupplyWay(product.getUploadWay());
			ofaa.setAttachType(Integer.valueOf(0));
			ordFinanceApplyAttachDAO.save(ofaa);
		}
		String title = "融资产品申请 - 中国资金网: " + applyNum + dictoryDataService.getValueNameById(Constants.ORD_ZJW_CHECKING);
		// 发送消息给客服
		String serviceBody = ntyMessageService.getServiceBody(apply, PropertiesUtil.getByKey(Constants.ORD_INSIDE_NEWAPPLY), user, product, Constants.TEMPLATE_ZJ198);
		ntyMessageService.sendEmailMsg(ntyMessageService.getEmailModel(title, Constants.NTYMESSAGEQUEUE_INSIDE, PropertiesUtil.getByKey(Constants.EMAIL_ZJ198), serviceBody));
		// 发送消息给客户
		String customerBody = ntyMessageService.getCustomerBody(apply, PropertiesUtil.getByKey(Constants.ORD_REMIND_ZJ_CUSTOMER), user, product, Constants.TEMPLATE_CUSTOMER);
		ntyMessageService.sendEmailMsg(ntyMessageService.getEmailModel(title, Constants.NTYMESSAGEQUEUE_OUTSIDE, user.getEmail(), customerBody));
		ntyMessageService.sendWebMsg(new SendWebMsgSpModel(user.getId(), 0, title,PropertiesUtil.getByKey(Constants.ORD_REMIND_ZJ_UPLOADCHECK)));
		
		/**
		 * 保存扩展属性
		 */
		this.saveExtendsParamater(apply.getId(), productId, spModel.getParamap());
		return applyNum;
	}

	private void saveExtendsParamater(Integer applyId, Integer productId, Map<?, ?> param) {
		List<PrdExtendsProperty> extendsPropertyList = prdExtendsPropertyDAO.getFinancePropertys(productId);

		if (extendsPropertyList != null && extendsPropertyList.size() > 0) {
			String valueName = "epValue";
			for (PrdExtendsProperty p : extendsPropertyList) {
				String[] values = (String[]) param.get(valueName + p.getId());
				PrdExtendsValue value = new PrdExtendsValue();
				value.setExtendsType(p.getExtendsType());
				value.setRowId(applyId);
				value.setPropertyId(p.getId());
				value.setFieldCode(p.getFieldCode());
				value.setFieldName(p.getFieldName());
				value.setCreateDt(new Date());
				value.setFieldType(p.getFieldType());
				if (p.getFieldType() == 1 || p.getFieldType() == 2) {
					if (values.length > 0) {
						value.setEntityValue(values[0]);
					}
				} else {
					if (values.length > 0) {
						String vstr = "";
						for (String v : values) {
							vstr += v + ",";
						}
						if (vstr.length() > 0) {
							vstr = vstr.substring(0, vstr.length() - 1);
							value.setDicValue(vstr);
							List<PrdPropertyDic> diclist = prdPropertyDicDAO.findPropertyDic(p.getId(), vstr);
							String vcn = "";
							for (PrdPropertyDic dic : diclist) {
								vcn += dic.getDicName() + ",";
							}
							vcn = vcn.substring(0, vcn.length() - 1);
							value.setEntityValue(vcn);
						}
					}
				}
				prdExtendsValueDAO.save(value);
			}
		}
	}

	public void updateFinanceApply(OrdFinanceApply apply, UsrUser user, FinanceApplySpModel spModel) {
		OrdFinanceApply applyDetail = this.ordFinanceApplyDAO.get(apply.getId());
		applyDetail.setLoanPurpose(apply.getLoanPurpose());
		applyDetail.setLoanPurposeOther(apply.getLoanPurposeOther());
		applyDetail.setLoanAmount(apply.getLoanAmount());
		applyDetail.setLoanMonth(apply.getLoanMonth());
		applyDetail.setHaveMortgage(apply.getHaveMortgage());
		
		if (applyDetail.getApplyType().intValue() == Constants.ORD_TYPE_COMPANY) {
			applyDetail.setLastyearSaleVolume(apply.getLastyearSaleVolume());
			applyDetail.setLastyearCost(apply.getLastyearCost());
			applyDetail.setLastyearProfit(apply.getLastyearProfit());
			applyDetail.setReceivable(apply.getReceivable());
			applyDetail.setStockSum(apply.getStockSum());
			applyDetail.setAssetSum(apply.getAssetSum());
			applyDetail.setDebtSum(apply.getDebtSum());
		} else {
			applyDetail.setRunningTrade(apply.getRunningTrade());
			applyDetail.setRunningTradeChild(apply.getRunningTradeChild());
			applyDetail.setExperience(apply.getExperience());
			applyDetail.setAllyearVolume(apply.getAllyearVolume());
			applyDetail.setRunningArea(apply.getRunningArea());
			applyDetail.setHostoryLoan(apply.getHostoryLoan());
			applyDetail.setUseCreditcard(apply.getUseCreditcard());
			applyDetail.setBankSalaryList(apply.getBankSalaryList());
			if(apply.getBankSalaryList()==null||apply.getBankSalaryList().intValue()==0){
				applyDetail.setSixmonthBanklist(null);
			}else{
				applyDetail.setSixmonthBanklist(apply.getSixmonthBanklist());
			}
			
			applyDetail.setMortgageType(apply.getMortgageType());
			applyDetail.setMortgageWorth(apply.getMortgageWorth());
			applyDetail.setBreakRepay(apply.getBreakRepay());
			if(apply.getBreakRepay()==null||apply.getBreakRepay().intValue()==0){
				applyDetail.setBreakNum(null);
			}else{
				applyDetail.setBreakNum(apply.getBreakNum());
			}
		}
		ordFinanceApplyDAO.update(applyDetail);

		/**
		 * 保存扩展属性
		 */
		this.updateExtendsParamater(apply.getId(), spModel.getParamap());
	}

	private void updateExtendsParamater(Integer applyId, Map<?, ?> param) {
		List<PrdExtendsValue> values = prdExtendsValueDAO.getFinanceApplyExtendsValue(applyId);
		String valueName = "epValue";
		for (PrdExtendsValue value : values) {
			String[] str = (String[]) param.get(valueName + value.getPropertyId());
			if (value.getFieldType().intValue() == Constants.EXTENDS_PROPERTY_TYPE_TEXT || value.getFieldType() == Constants.EXTENDS_PROPERTY_TYPE_TEXTAREA) {
				if (str.length > 0) {
					value.setEntityValue(str[0]);
				}
			} else {
				if (str.length > 0) {
					String vstr = "";
					for (String v : str) {
						vstr += v + ",";
					}
					if (vstr.length() > 0) {
						vstr = vstr.substring(0, vstr.length() - 1);
						value.setDicValue(vstr);
						List<PrdPropertyDic> diclist = prdPropertyDicDAO.findPropertyDic(value.getPropertyId(), vstr);
						String vcn = "";
						for (PrdPropertyDic dic : diclist) {
							vcn += dic.getDicName() + ",";
						}
						vcn = vcn.substring(0, vcn.length() - 1);
						value.setEntityValue(vcn);
					}
				}
			}
			prdExtendsValueDAO.update(value);
		}
	}

	public List<FinanceApplyAttachModel> findApplyAttach(Integer applyId) {
		List<FinanceApplyAttachModel> attachList = ordFinanceApplyAttachDAO.findApplyAttach(applyId);
		attachList.addAll(ordFinanceApplyAttachDAO.findApplyAttachSupply(applyId));
		for(FinanceApplyAttachModel f:attachList){
			if(f.getUploadWay() != null && f.getUploadWay() == 0){//提交方式：线上
				f.setAttachCount(ordFaAttachListDAO.countAttachList(f.getId()));
			}
			if(f.getHaveMemo() != null && f.getHaveMemo() == 1){
				f.setOtherMemo(f.getOtherMemo().replaceAll("\r\n", "<br/>"));
			}
		}
		return attachList;
	}

	public OrdFaAttachList getOrdFaAttachList(Integer id) {
		return ordFaAttachListDAO.get(id);
	}

	public OrdFinanceApplyAttach getOrdFinanceApplyAttach(Integer id) {
		return ordFinanceApplyAttachDAO.get(id);
	}

	/**
	 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 15:09:58
	 * @param
	 * @return
	 */
	public void searchDateFile() {
	}

	/**
	 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 15:09:58
	 * @param
	 * @return
	 */
	public void updateFinanceAttach() {
	}

	/**
	 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 15:09:58
	 * @param
	 * @return
	 */
	public Pager findFinanceApply(FinanceApplySpModel spModel) {
		return this.ordFinanceApplyDAO.findFinanceApply(spModel);
	}

	/**
	 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 15:09:58
	 * @param
	 * @return
	 */
	public OrdFinanceApply getFinanceApply(Integer appId) {
		return ordFinanceApplyDAO.get(appId);
	}

	/**
	 * 融资申请审核
	 */
	public void saveApplyStatus(OrdFinanceApply apply, OrdCheckLog check) {
		OrdFinanceApply ofa = ordFinanceApplyDAO.get(apply.getId());
		ofa.setApplyStatus(apply.getApplyStatus());
		if (apply.getAgreeNum() != null && apply.getAgreeNum().trim().length() > 0) {
			ofa.setAgreeNum(apply.getAgreeNum());
		}
		ordFinanceApplyDAO.saveOrUpdate(ofa);

		if (check == null) {
			check = new OrdCheckLog();
		}
		check.setOrdId(apply.getId());
		check.setCheckStatus(apply.getApplyStatus());
		check.setCreatedt(new Date());
		if (check.getCheckView() == null || check.getCheckView().trim().equals("")) {
			check.setCheckView(dicCommonDAO.get(apply.getApplyStatus()).getName());
		}
		check.setOrdType(Constants.ORD_CHECK_TYPE_APPLY);
		ordCheckLogDAO.save(check);
	}

	//
	// /**
	// * 发送邮件
	// *
	// * @param apply 申请单
	// * @param check 审核单
	// */
	// private void sendCheckEmail(OrdFinanceApply apply, OrdCheckLog check) {
	// try {
	// Map<String, Object> pm = new HashMap<String, Object>();
	// UsrUser user = usrUserDAO.get(apply.getUserId());
	// int groupid = profileService.getGroupidByUserType(user.getType());
	// if (groupid == Constants.USERTYPE_GROUP_COMPANY) {
	// UsrCompany usrCompany = (UsrCompany)
	// profileService.getProfiles(user.getId());
	// pm.put("userName", usrCompany.getCompanyname());
	// } else if (groupid == Constants.USERTYPE_GROUP_PERSONAL) {
	// pm.put("userName", user.getRealname());
	// }
	// SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	// String applyTime = sdf.format(apply.getCreatedt());
	// pm.put("applyTime", applyTime);// 申请时间
	// // apply.getApplyStatus();//申请状态
	// String checkInfo = "";
	// if (apply.getApplyStatus() == 180) {
	// checkInfo = "通过资金网预审";
	// } else if (apply.getApplyStatus() == 188) {
	// checkInfo = "未通过资金网预审";
	// } else if (apply.getApplyStatus() == 182) {
	// checkInfo = "资金方已接受申请";
	// } else if (apply.getApplyStatus() == 187) {
	// checkInfo = "未能被资金方受理";
	// } else if (apply.getApplyStatus() == 183) {
	// checkInfo = "需补充资料";
	// } else if (apply.getApplyStatus() == 185) {
	// checkInfo = "通过资金方审核";
	// } else if (apply.getApplyStatus() == 186) {
	// checkInfo = "资金方已放款";
	// }
	// pm.put("applyNum", apply.getApplyNum());
	// pm.put("checkInfo", checkInfo);
	// String body = FreemarkerUtil.getContent("financeApplyCheck.htm", pm,
	// false, null, null);
	// NtyMessageQueue j = new NtyMessageQueue();
	// j.setTitle("融资申请 " + checkInfo + "- 中国资金网");
	// j.setContent(body);
	// j.setReceiver(user.getEmail());
	// j.setType(Constants.NTYMESSAGEQUEUE_TYPE_EMAIL);
	// notifyQueueService.addNewMessage(j);
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// }

	public void saveNewAttach(OrdFinanceApplyAttach attach) {
		attach.setAttachType(Integer.valueOf(1));
		attach.setUploadStatus(Integer.valueOf(212));
		attach.setSupplyCreatedt(new Date());
		attach.setIsdeleted(Integer.valueOf(0));
		ordFinanceApplyAttachDAO.save(attach);
		OrdFinanceApply apply = ordFinanceApplyDAO.get(attach.getApplyId());
		apply.setApplyStatus(Constants.ORD_ORG_WAIT_UPLOAD);
		ordFinanceApplyDAO.saveOrUpdate(apply);
	}

	public void saveAttachList(SaveAttachListSpModel spModel) {
		for (int i = 0; i < spModel.getSupplyName().length; i++) {
			OrdFinanceApplyAttach attach = new OrdFinanceApplyAttach();
			attach.setApplyId(spModel.getApplyId());
			attach.setSupplyName(spModel.getSupplyName()[i]);
//			attach.setSupplyMemo(spModel.getSupplyMemo()[i]);
			attach.setSupplyWay(spModel.getSupplyWay()[i]);
			attach.setAttachType(Constants.ORD_ATTACH_TYPE_ADDED);// 补充资料
			attach.setUploadStatus(Constants.ORD_ATTACH_NO_UPLOAD);// 未上传
			attach.setSupplyCreatedt(new Date());
			attach.setIsdeleted(0);
			ordFinanceApplyAttachDAO.save(attach);
		}
		OrdFinanceApply apply = ordFinanceApplyDAO.get(spModel.getApplyId());
		apply.setApplyStatus(Constants.ORD_ORG_WAIT_UPLOAD);
		ordFinanceApplyDAO.saveOrUpdate(apply);
		UsrUser user = usrUserDAO.get(apply.getUserId());
		UsrUser sessionUsr = (UsrUser) ActionContext.getContext().getSession().get("_user");
		String customerBody = null;
		String title = "融资产品申请 - 中国资金网: " + apply.getApplyNum() + dictoryDataService.getValueNameById(Constants.ORD_ORG_WAIT_UPLOAD);
		PrdFinance product = prdFinanceDAO.get(apply.getFinanceId());
		String loanName3 = dictoryDataService.getCompanyNameByUserId(product.getUserId());
		customerBody = ntyMessageService.getCustomerBody(apply, String.format(PropertiesUtil.getByKey(Constants.ORD_REMIND_ORG_WAITUPLOAD),loanName3), user, product, Constants.TEMPLATE_CUSTOMER);
		ntyMessageService.sendEmailMsg(ntyMessageService.getEmailModel(title, Constants.NTYMESSAGEQUEUE_OUTSIDE, user.getEmail(), customerBody));
		//发送站点消息给用户
		if(sessionUsr!=null){
			ntyMessageService.sendWebMsg(new SendWebMsgSpModel(user.getId(), sessionUsr.getId(), title, String.format(PropertiesUtil.getByKey(Constants.ORD_REMIND_ORG_WAITUPLOAD),loanName3)));
		}
		// 发短信给用户
		if(user.getActivetype().intValue()==2||user.getActivetype().intValue()==3){
			ntyMessageService.sendMobileMsg(new SendMobileMspSpModel(title, String.format(PropertiesUtil.getByKey(Constants.ORD_REMIND_ORG_WAITUPLOAD),loanName3), user.getMobile()));
		}
	}

	public List<OrdFinanceApply> findFinanceApply(FindFinanceApplySpModel spModel) {
		UsrUser user = spModel.getUser();
		List<OrdFinanceApply> applyList = null;
		if (user.getUserTypeGroup().intValue() == 2 || user.getUserTypeGroup().intValue() == 3) {// 银行或其它贷款机构
			applyList = ordFinanceApplyDAO.findApplyByOrg(user.getId(), spModel.getShowNumber());
		} else if (user.getUserTypeGroup().intValue() == 1 || user.getUserTypeGroup().intValue() == 5) {// 个人与企业
			applyList = ordFinanceApplyDAO.findApplyByUserId(user.getId(), spModel.getShowNumber());
		}
		return applyList;
	}

	public List<OrdCheckLog> findApplyCheck(Integer applyId) {
		return ordCheckLogDAO.findApplyCheck(applyId);
	}

	public List<PrdExtendsValue> getFinanceApplyExtendsValue(Integer applyId) {
		return prdExtendsValueDAO.getFinanceApplyExtendsValue(applyId);
	}

	public void saveFundIntention(FundIntention fi) {
		try {
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("userName", fi.getUserName());
			if (fi.getGender() != null) {
				if (fi.getGender() == 1) {
					m.put("gender", "先生");
				} else {
					m.put("gender", "女士");
				}
			}
			m.put("mobile", fi.getMobile());
			m.put("email", fi.getEmail());
			if (fi.getServiceTime() != null) {
				if (fi.getServiceTime() == 1) {
					m.put("serviceTime", "双休日白天");
				} else if (fi.getServiceTime() == 2) {
					m.put("serviceTime", "工作日上午");
				} else if (fi.getServiceTime() == 3) {
					m.put("serviceTime", "工作日中午");
				} else if (fi.getServiceTime() == 4) {
					m.put("serviceTime", "工作日晚间");
				}
			}
			switch (fi.getJtype()) {
			case 1:
				m.put("financeName", "圣迈鑫源投资基金低风险高收益计划");
				break;
			case 2:
				m.put("financeName", "中铁信托集合资金信托计划");
				break;
			case 3:
				m.put("financeName", "中融-中天城投基础设施1号财产权投资集合资金信托计划");
				break;
			default:
				m.put("financeName", "");
				break;
			}
			m.put("serviceContent", fi.getServiceContent());
			String body = FreemarkerUtil.getContent("fundIntentionTemplate.htm", m, false, null, null);
			NtyMessageQueue j = new NtyMessageQueue();
			j.setTitle("基金预约 - 中国资金网");
			j.setContent(body);
			j.setReceiver(Constants.LOAN_EMAIL);
			j.setType(Constants.NTYMESSAGEQUEUE_TYPE_EMAIL);
			notifyQueueService.addNewMessage(j);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public OrdFinanceApply countAttachApply(OrdFinanceApply apply) {
		List<FinanceApplyAttachModel> attachList = this.findApplyAttach(apply.getId());

		int uploadNum = attachList.size();
		int needNum = 0;
		for (FinanceApplyAttachModel m : attachList) {
			if (m.getUploadStatus().intValue() == 1) {
				needNum++;
			}
		}
		apply.setUploadAttachNum(uploadNum);
		apply.setNeedAttachNum(needNum);

		return apply;
	}

	// setter and getter
	public void setPrdFinanceDAO(PrdFinanceDAO prdFinanceDAO) {
		this.prdFinanceDAO = prdFinanceDAO;
	}

	public void setOrdLogService(OrdLogService ordLogService) {
		this.ordLogService = ordLogService;
	}

	public void setOrdFinanceApplyDAO(OrdFinanceApplyDAO ordFinanceApplyDAO) {
		this.ordFinanceApplyDAO = ordFinanceApplyDAO;
	}

	public void setOrdFinanceApplyAttachDAO(OrdFinanceApplyAttachDAO ordFinanceApplyAttachDAO) {
		this.ordFinanceApplyAttachDAO = ordFinanceApplyAttachDAO;
	}

	public void setOrdFaAttachListDAO(OrdFaAttachListDAO ordFaAttachListDAO) {
		this.ordFaAttachListDAO = ordFaAttachListDAO;
	}

	public void setUsrCompanyDAO(UsrCompanyDAO usrCompanyDAO) {
		this.usrCompanyDAO = usrCompanyDAO;
	}

	public OrdFinanceApply findById(Integer id) {
		return ordFinanceApplyDAO.findById(id);
	}

	private NotifyQueueService notifyQueueService;

	public void setNotifyQueueService(NotifyQueueService notifyQueueService) {
		this.notifyQueueService = notifyQueueService;
	}

	public void setDicCommonDAO(DicCommonDAO dicCommonDAO) {
		this.dicCommonDAO = dicCommonDAO;
	}

	public void setNtyMessageService(NtyMessageService ntyMessageService) {
		this.ntyMessageService = ntyMessageService;
	}

	public void setPrdExtendsPropertyDAO(PrdExtendsPropertyDAO prdExtendsPropertyDAO) {
		this.prdExtendsPropertyDAO = prdExtendsPropertyDAO;
	}

	public void setPrdPropertyDicDAO(PrdPropertyDicDAO prdPropertyDicDAO) {
		this.prdPropertyDicDAO = prdPropertyDicDAO;
	}

	public void setPrdExtendsValueDAO(PrdExtendsValueDAO prdExtendsValueDAO) {
		this.prdExtendsValueDAO = prdExtendsValueDAO;
	}

	public List<OrdCheckLog> findApplyCheck(Integer applyId, Integer num) {
		return ordCheckLogDAO.findApplyCheck(applyId, num);
	}

	public void setUsrUserDAO(UsrUserDAO usrUserDAO) {
		this.usrUserDAO = usrUserDAO;
	}

	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}

	public void deleteAttach(Integer[] ids) {
		ordFinanceApplyAttachDAO.deleteAttach(ids);
	}

	public void setOrdCheckLogDAO(OrdCheckLogDAO ordCheckLogDAO) {
		this.ordCheckLogDAO = ordCheckLogDAO;
	}

	/********************************************* 第二期 订单相关操作 *************************************************************/

	public void updateChuShen(OrdFinanceApply apply, OrdCheckLog log, String left, String right, String realName) {
		OrdFinanceApply ofa = ordFinanceApplyDAO.get(apply.getId());
		ofa.setBaseCheckStatus(left + right);
		ordFinanceApplyDAO.saveOrUpdate(ofa);
		ordLogService.saveLogByStatus(Constants.ORD_CHECK_LOG_ZJW, log == null ? null : log.getCheckView(), ofa, realName);
	}
	
	public void updateChuShen(Integer cp, OrdFinanceApply apply, OrdCheckLog log, String left, String right, String realName) {
		OrdFinanceApply ofa = ordFinanceApplyDAO.get(apply.getId());
		ofa.setBaseCheckStatus(left + right);
		ordFinanceApplyDAO.saveOrUpdate(ofa);
		ordLogService.saveLogByStatus(cp, Constants.ORD_CHECK_LOG_ZJW, log == null ? null : log.getCheckView(), ofa, realName);
	}
	
	public void saveOrUpdateRecordApply(OrdFinanceApply apply, Map<Integer, Integer> m, Integer tp){
		if(m != null){
			Iterator<Integer> ir = m.keySet().iterator();
			while (ir.hasNext()) {
				Integer n = ir.next();
				OrdCheckRecordApply re = ordCheckRecordApplyService.getByAppIdAndId(apply.getId(), n);
				if(re != null){
					re.setCheckStatus(m.get(n));
					ordCheckRecordApplyService.saveOrUpdateRecordAly(re);
				}else{
					re = new OrdCheckRecordApply();
					re.setApplyId(apply.getId());
					re.setCrId(n);
					re.setCrType(tp);
					re.setCheckStatus(m.get(n));
					re.setCreateDt(new Date());
					ordCheckRecordApplyService.saveOrUpdateRecordAly(re);
				}
			}
		}
	}

	public void updateTuiHui(OrdFinanceApply apply, OrdCheckLog log, String left, String right, String realName, Integer status) {
		OrdFinanceApply ofa = ordFinanceApplyDAO.get(apply.getId());
		ofa.setBaseCheckStatus(left + right);
		ofa.setApplyStatus(status);
		ordFinanceApplyDAO.saveOrUpdate(ofa);
		UsrUser user = usrUserDAO.get(ofa.getUserId());
		PrdFinance product = prdFinanceDAO.get(ofa.getFinanceId());
		ordLogService.saveLogByStatus(Constants.ORD_CHECK_LOG_USER, log == null ? null : log.getCheckView(), ofa, realName);
		String title = "融资产品申请 - 中国资金网: " + ofa.getApplyNum() + dictoryDataService.getValueNameById(status);
		String customerBody = ntyMessageService.getCustomerBody(ofa, PropertiesUtil.getByKey(Constants.ORD_REMIND_ZJ_NEEDUPDATE), user, product, Constants.TEMPLATE_CUSTOMER);
		ntyMessageService.sendEmailMsg(ntyMessageService.getEmailModel(title, Constants.NTYMESSAGEQUEUE_OUTSIDE, user.getEmail(), customerBody));
		ntyMessageService.sendMobileMsg(new SendMobileMspSpModel(title,PropertiesUtil.getByKey(Constants.ORD_REMIND_ZJ_NEEDUPDATE), user.getMobile()));
		//发送站点消息给用户
		AdmUser admin = (AdmUser) ActionContext.getContext().getSession().get("_admin");
		if(admin!=null){
			ntyMessageService.sendWebMsg(new SendWebMsgSpModel(user.getId(), admin.getId(), title,PropertiesUtil.getByKey(Constants.ORD_REMIND_ZJ_NEEDUPDATE)));
		}
	}

	public void updateOrdStatus(OrdFinanceApply apply, OrdCheckLog log, String realName, Integer status) {
		OrdFinanceApply ofa = ordFinanceApplyDAO.get(apply.getId());
		Integer oldState = ofa.getApplyStatus();
		String waitTJ = null;
		if(oldState==Constants.ORD_ZJW_UPLOAD_CHECK && status==Constants.ORD_ZJW_WAIT_UPLOAD){
			waitTJ = PropertiesUtil.getByKey(Constants.ORD_REMIND_ZJ_BACKUPLOAD);
		}
		ofa.setApplyStatus(status);
		if (Constants.ORD_ZJW_WAIT_UPLOAD == status) {
			ofa.setBaseCheckStatus(Constants.ORD_CHECK_LOG_USERANDORG);
		}
		if(StringUtils.isNotBlank(apply.getAgreeNum())){
			ofa.setAgreeNum(apply.getAgreeNum());
		}
		if(apply.getZjserviceRate()!=null){
			ofa.setZjserviceRate(apply.getZjserviceRate());
		}
		ordFinanceApplyDAO.saveOrUpdate(ofa);
		
		// 发送email
		PrdFinance product = prdFinanceDAO.get(ofa.getFinanceId());
		UsrUser user = usrUserDAO.get(ofa.getUserId());
		AdmUser admin = (AdmUser) ActionContext.getContext().getSession().get("_admin");
		UsrUser sessionUsr = (UsrUser) ActionContext.getContext().getSession().get("_user");
		String serviceBody = null;
		String customerBody = null;
		String logType = Constants.ORD_CHECK_LOG_USERANDORG;
		String title = "融资产品申请 - 中国资金网: " + ofa.getApplyNum() + dictoryDataService.getValueNameById(status);
		switch (status.intValue()) {
		case Constants.ORD_ZJW_WAIT_UPLOAD:// 初审通过，状态变为：“待提交材料”
			customerBody = ntyMessageService.getCustomerBody(ofa,waitTJ==null?PropertiesUtil.getByKey(Constants.ORD_REMIND_ZJ_BASEOK):waitTJ, user, product, Constants.TEMPLATE_CUSTOMER);
			ntyMessageService.sendEmailMsg(ntyMessageService.getEmailModel(title, Constants.NTYMESSAGEQUEUE_OUTSIDE, user.getEmail(), customerBody));
			// 发短信给用户
			if(user.getActivetype().intValue()==2||user.getActivetype().intValue()==3){
				ntyMessageService.sendMobileMsg(new SendMobileMspSpModel(title,waitTJ==null?PropertiesUtil.getByKey(Constants.ORD_REMIND_ZJ_BASEOK):waitTJ, user.getMobile()));
			}
			//发送站点消息给用户
			if(admin!=null){
				ntyMessageService.sendWebMsg(new SendWebMsgSpModel(user.getId(), admin.getId(), title,waitTJ==null?PropertiesUtil.getByKey(Constants.ORD_REMIND_ZJ_BASEOK):waitTJ));
			}
			logType = Constants.ORD_CHECK_LOG_USER;
			break;
		case Constants.ORD_ZJW_WAIT_UPDATE:// 初审退回修改，状态变为：”待用户修改“
			customerBody = ntyMessageService.getCustomerBody(ofa, PropertiesUtil.getByKey(Constants.ORD_REMIND_ZJ_NEEDUPDATE), user, product, Constants.TEMPLATE_CUSTOMER);
			ntyMessageService.sendEmailMsg(ntyMessageService.getEmailModel(title, Constants.NTYMESSAGEQUEUE_OUTSIDE, user.getEmail(), customerBody));
			// 发短信给用户
			if(user.getActivetype().intValue()==2||user.getActivetype().intValue()==3){
				ntyMessageService.sendMobileMsg(new SendMobileMspSpModel(title,PropertiesUtil.getByKey(Constants.ORD_REMIND_ZJ_NEEDUPDATE), user.getMobile()));
			}
			//发送站点消息给用户
			if(admin!=null){
				ntyMessageService.sendWebMsg(new SendWebMsgSpModel(user.getId(), admin.getId(), title,PropertiesUtil.getByKey(Constants.ORD_REMIND_ZJ_NEEDUPDATE)));
			}
			logType = Constants.ORD_CHECK_LOG_USER;
			break;
		case Constants.ORD_ZJW_UPLOAD_CHECK:// 资金网初审通过，状态变为：”资金网审核中“
			serviceBody = ntyMessageService.getServiceBody(ofa, PropertiesUtil.getByKey(Constants.ORD_INSIDE_FILEUPLOAD), user, product, Constants.TEMPLATE_ZJ198);
			ntyMessageService.sendEmailMsg(ntyMessageService.getEmailModel(title, Constants.NTYMESSAGEQUEUE_INSIDE, PropertiesUtil.getByKey(Constants.EMAIL_ZJ198), serviceBody));
			customerBody = ntyMessageService.getCustomerBody(ofa, PropertiesUtil.getByKey(Constants.ORD_REMIND_ZJ_UPLOADCHECK), user, product, Constants.TEMPLATE_CUSTOMER);
			ntyMessageService.sendEmailMsg(ntyMessageService.getEmailModel(title, Constants.NTYMESSAGEQUEUE_OUTSIDE, user.getEmail(), customerBody));
			//发送站点消息给用户
			if(admin!=null){
				ntyMessageService.sendWebMsg(new SendWebMsgSpModel(user.getId(), admin.getId(), title,PropertiesUtil.getByKey(Constants.ORD_REMIND_ZJ_UPLOADCHECK)));
			}
			logType = Constants.ORD_CHECK_LOG_USER;
			break;
		case Constants.ORD_ZJW_CHECKPASS:// 资金网审核通过
			customerBody = ntyMessageService.getCustomerBody(ofa, PropertiesUtil.getByKey(Constants.ORD_REMIND_ZJ_OK), user, product, Constants.TEMPLATE_CUSTOMER);
			ntyMessageService.sendEmailMsg(ntyMessageService.getEmailModel(title, Constants.NTYMESSAGEQUEUE_OUTSIDE, user.getEmail(), customerBody));
			//发送站点消息给用户
			if(admin!=null){
				ntyMessageService.sendWebMsg(new SendWebMsgSpModel(user.getId(), admin.getId(), title,PropertiesUtil.getByKey(Constants.ORD_REMIND_ZJ_OK)));
			}
			logType = Constants.ORD_CHECK_LOG_USER;
			break;
		case Constants.ORD_ORG_WAIT_CHECK:// 提交资料给资金方
			String loanName = dictoryDataService.getCompanyNameByUserId(product.getUserId());
			UsrUser u = usrUserDAO.get(product.getUserId());
			customerBody =  ntyMessageService.getCustomerBody(ofa, String.format(PropertiesUtil.getByKey(Constants.ORD_REMIND_ORG_WAIT), loanName), user, product, Constants.TEMPLATE_CUSTOMER);
			ntyMessageService.sendEmailMsg(ntyMessageService.getEmailModel(title, Constants.NTYMESSAGEQUEUE_OUTSIDE, user.getEmail(), customerBody));
			// 发短信给资金方
			if(user.getActivetype().intValue()==2||user.getActivetype().intValue()==3){			
				ntyMessageService.sendMobileMsg(new SendMobileMspSpModel(title,String.format(PropertiesUtil.getByKey(Constants.ORD_REMIND_ORG_WAIT), loanName), u.getMobile()));
			}
			//发送站点消息给用户
			if(admin!=null){
				ntyMessageService.sendWebMsg(new SendWebMsgSpModel(user.getId(), admin.getId(), title, String.format(PropertiesUtil.getByKey(Constants.ORD_REMIND_ORG_WAIT), loanName)));
			}
			break;
		case Constants.ORD_ORG_CHECKING:// 资金方接收到申请
			String loanName3 = dictoryDataService.getCompanyNameByUserId(product.getUserId());
			serviceBody = ntyMessageService.getServiceBody(ofa, String.format(PropertiesUtil.getByKey(Constants.ORD_REMIND_ORG_CHECKING),loanName3), user, product, Constants.TEMPLATE_ZJ198);
			ntyMessageService.sendEmailMsg(ntyMessageService.getEmailModel(title, Constants.NTYMESSAGEQUEUE_INSIDE, PropertiesUtil.getByKey(Constants.EMAIL_ZJ198), serviceBody));
			customerBody = ntyMessageService.getCustomerBody(ofa, String.format(PropertiesUtil.getByKey(Constants.ORD_REMIND_ORG_CHECKING),loanName3), user, product, Constants.TEMPLATE_CUSTOMER);
			ntyMessageService.sendEmailMsg(ntyMessageService.getEmailModel(title, Constants.NTYMESSAGEQUEUE_OUTSIDE, user.getEmail(), customerBody));
			//发送站点消息给用户
			if(sessionUsr!=null){
				ntyMessageService.sendWebMsg(new SendWebMsgSpModel(user.getId(), sessionUsr.getId(), title, String.format(PropertiesUtil.getByKey(Constants.ORD_REMIND_ORG_CHECKING),loanName3)));
			}
			break;
		case Constants.ORD_ORG_WAIT_UPLOAD:// 资金方要求客户补充材料
			String loanName4 = dictoryDataService.getCompanyNameByUserId(product.getUserId());
			customerBody = ntyMessageService.getCustomerBody(ofa, String.format(PropertiesUtil.getByKey(Constants.ORD_REMIND_ORG_WAITUPLOAD),loanName4), user, product, Constants.TEMPLATE_CUSTOMER);
			ntyMessageService.sendEmailMsg(ntyMessageService.getEmailModel(title, Constants.NTYMESSAGEQUEUE_OUTSIDE, user.getEmail(), customerBody));
			// 发短信给用户
			if(user.getActivetype().intValue()==2||user.getActivetype().intValue()==3){
				ntyMessageService.sendMobileMsg(new SendMobileMspSpModel(title,String.format(PropertiesUtil.getByKey(Constants.ORD_REMIND_ORG_WAITUPLOAD),loanName4), user.getMobile()));
			}
			//发送站点消息给用户
			if(sessionUsr!=null){
				ntyMessageService.sendWebMsg(new SendWebMsgSpModel(user.getId(), sessionUsr.getId(), title, String.format(PropertiesUtil.getByKey(Constants.ORD_REMIND_ORG_WAITUPLOAD),loanName4)));
			}
			break;
		case Constants.ORD_ORG_WAIT_MONEY:// 资金方审核通过
			String loanName2 = dictoryDataService.getCompanyNameByUserId(product.getUserId());
			customerBody = ntyMessageService.getCustomerBody(ofa, String.format(PropertiesUtil.getByKey(Constants.ORD_REMIND_ORG_OK), loanName2, loanName2), user, product, Constants.TEMPLATE_CUSTOMER);
			ntyMessageService.sendEmailMsg(ntyMessageService.getEmailModel(title, Constants.NTYMESSAGEQUEUE_OUTSIDE, user.getEmail(), customerBody));
			//发送站点消息给用户
			if(sessionUsr!=null){
				ntyMessageService.sendWebMsg(new SendWebMsgSpModel(user.getId(), sessionUsr.getId(), title, String.format(PropertiesUtil.getByKey(Constants.ORD_REMIND_ORG_OK), loanName2, loanName2)));
			}
			break;
		case Constants.ORD_ORG_PUT_MONEY:// 资金方已经放款ORD_REMIND_ORG_PUTMONEY
			//生成一条融资服务费记录
			if(user.getReferenceId()!=null){
				OrdFinanceAppLoan ofal = ordFinanceAppLoanService.findByAppId(ofa.getId());
				if(ofal != null){
					ordFeeService.saveOrdFee(new OrdFee(351, ofa.getId(), (ofa
							.getZjserviceRate() * ofal.getLoanAmount()*10000), 1,
							null, new Date(), 1));
				}
			}
			String loanName1 = dictoryDataService.getCompanyNameByUserId(product.getUserId());
			customerBody = ntyMessageService.getCustomerBody(ofa, String.format(PropertiesUtil.getByKey(Constants.ORD_REMIND_ORG_PUTMONEY), loanName1), user, product, Constants.TEMPLATE_CUSTOMER);
			ntyMessageService.sendEmailMsg(ntyMessageService.getEmailModel(title, Constants.NTYMESSAGEQUEUE_OUTSIDE, user.getEmail(), customerBody));
			// 发短信给用户
			if(user.getActivetype().intValue()==2||user.getActivetype().intValue()==3){
				ntyMessageService.sendMobileMsg(new SendMobileMspSpModel(title, String.format(PropertiesUtil.getByKey(Constants.ORD_REMIND_ORG_PUTMONEY), loanName1), user.getMobile()));
			}
			//发送站点消息给用户
			if(sessionUsr!=null){
				ntyMessageService.sendWebMsg(new SendWebMsgSpModel(user.getId(), sessionUsr.getId(), title, String.format(PropertiesUtil.getByKey(Constants.ORD_REMIND_ORG_PUTMONEY), loanName1)));
			}
			break;
		case Constants.ORD_ZJW_CHECK_FAILURE:// 资金网预审没有通过
			customerBody = ntyMessageService.getCustomerBody(ofa, PropertiesUtil.getByKey(Constants.ORD_REMIND_ZJ_FAILURE), user, product, Constants.TEMPLATE_CUSTOMER);
			ntyMessageService.sendEmailMsg(ntyMessageService.getEmailModel(title, Constants.NTYMESSAGEQUEUE_OUTSIDE, user.getEmail(), customerBody));
			//发送站点消息给用户
			if(admin!=null){
				ntyMessageService.sendWebMsg(new SendWebMsgSpModel(user.getId(), admin.getId(), title,PropertiesUtil.getByKey(Constants.ORD_REMIND_ZJ_FAILURE)));
			}
			break;
		case Constants.ORD_ORG_CHECK_FAILURE:// 资金方审核未通过
			String loanName7 = dictoryDataService.getCompanyNameByUserId(product.getUserId());
			customerBody = ntyMessageService.getCustomerBody(ofa, String.format(PropertiesUtil.getByKey(Constants.ORD_REMIND_ORG_FAILURE), loanName7), user, product, Constants.TEMPLATE_CUSTOMER);
			ntyMessageService.sendEmailMsg(ntyMessageService.getEmailModel(title, Constants.NTYMESSAGEQUEUE_OUTSIDE, user.getEmail(), customerBody));
			//发送站点消息给用户
			if(sessionUsr!=null){
				ntyMessageService.sendWebMsg(new SendWebMsgSpModel(user.getId(), sessionUsr.getId(), title, String.format(PropertiesUtil.getByKey(Constants.ORD_REMIND_ORG_FAILURE), loanName7)));
			}
			break;
		}
		//保存日志
		ordLogService.saveLogByStatus(logType, log == null ? null : log.getCheckView(), ofa, realName);
	}

	public void updateFinalCheck(OrdFinanceApply apply, OrdCheckLog log, String realName, Integer status) {
		OrdFinanceApply ofa = ordFinanceApplyDAO.get(apply.getId());
		ofa.setApplyStatus(status);
		ordFinanceApplyDAO.saveOrUpdate(ofa);
		ordLogService.saveLogByStatus(Constants.ORD_CHECK_LOG_USERANDORG, log == null ? null : log.getCheckView(), ofa, realName);
		// 发送email,客户提交材料后，状态变为：”资金网审核中“
		PrdFinance product = prdFinanceDAO.get(ofa.getFinanceId());
		UsrUser user = usrUserDAO.get(ofa.getUserId());
		String serviceBody = null;
		String customerBody = null;
		String title = "融资产品申请 - 中国资金网: " + ofa.getApplyNum() + dictoryDataService.getValueNameById(status);
		serviceBody = ntyMessageService.getServiceBody(ofa, PropertiesUtil.getByKey(Constants.ORD_INSIDE_FILEUPLOAD), user, product, Constants.TEMPLATE_ZJ198);
		ntyMessageService.sendEmailMsg(ntyMessageService.getEmailModel(title, Constants.NTYMESSAGEQUEUE_INSIDE, PropertiesUtil.getByKey(Constants.EMAIL_ZJ198), serviceBody));
		customerBody = ntyMessageService.getCustomerBody(ofa, PropertiesUtil.getByKey(Constants.ORD_REMIND_ZJ_UPLOADCHECK), user, product, Constants.TEMPLATE_CUSTOMER);
		ntyMessageService.sendEmailMsg(ntyMessageService.getEmailModel(title, Constants.NTYMESSAGEQUEUE_OUTSIDE, user.getEmail(), customerBody));
	}

	public void updateAppInfo(OrdFinanceApply apply, OrdCheckLog log, String left, String right, String realName) {
		OrdFinanceApply ofa = ordFinanceApplyDAO.get(apply.getId());
		if ("2".equals(left)) {
			left = "0";
		}
		if ("2".equals(right)) {
			right = "0";
		}
		ofa.setBaseCheckStatus(left + right);
		ofa.setApplyStatus(Constants.ORD_ZJW_CHECKING);
		ordFinanceApplyDAO.saveOrUpdate(ofa);
		String updateInfo = PropertiesUtil.getByKey(Constants.ORD_REMIND_ZJ_UPDATE);
		ordLogService.saveLogByStatus(Constants.ORD_CHECK_LOG_USERANDORG, log == null ? updateInfo : log.getCheckView(), ofa, realName);
		// 发送email,退回修改资料后提交，发送email给客服和客户
		PrdFinance product = prdFinanceDAO.get(ofa.getFinanceId());
		UsrUser user = usrUserDAO.get(ofa.getUserId());
		String serviceBody = null;
		String customerBody = null;
		String title = "融资产品申请 - 中国资金网: " + ofa.getApplyNum() + dictoryDataService.getValueNameById(Constants.ORD_ZJW_CHECKING);
		serviceBody = ntyMessageService.getServiceBody(ofa, PropertiesUtil.getByKey(Constants.ORD_INSIDE_UPDATE), user, product, Constants.TEMPLATE_ZJ198);
		ntyMessageService.sendEmailMsg(ntyMessageService.getEmailModel(title, Constants.NTYMESSAGEQUEUE_INSIDE, PropertiesUtil.getByKey(Constants.EMAIL_ZJ198), serviceBody));
		customerBody = ntyMessageService.getCustomerBody(ofa, updateInfo, user, product, Constants.TEMPLATE_CUSTOMER);
		ntyMessageService.sendEmailMsg(ntyMessageService.getEmailModel(title, Constants.NTYMESSAGEQUEUE_OUTSIDE, user.getEmail(), customerBody));
	}

	public void updateCheckStatus(OrdFinanceApply apply, OrdCheckLog log, String realname, Integer status) {
		OrdFinanceApply ofa = ordFinanceApplyDAO.get(apply.getId());
		ofa.setApplyStatus(status);
		ordFinanceApplyDAO.saveOrUpdate(ofa);
		ordLogService.saveLogByStatus(Constants.ORD_CHECK_LOG_USERANDORG, log == null ? null : log.getCheckView(), ofa, realname);
	}

	public void updateMaterialStatus(Integer[] ids, String postid, Integer status) {
		if (ids != null && ids.length > 0) {
			for (int j = 0; j < ids.length; j++) {
				OrdFinanceApplyAttach f = ordFinanceApplyAttachDAO.get(ids[j]);
				// 如果是线下提交就需要填写快递单号
				if (StringUtils.isNotBlank(postid)) {
					f.setPostid(postid);
				}
				if (f.getUploadStatus().intValue() == Constants.ORD_ATTACH_CHECK_FAILURE) {
					f.setUploadStatus(Constants.ORD_ATTACH_WAIT_SUB);
				} else {
					f.setUploadStatus(status);
				}
				ordFinanceApplyAttachDAO.update(f);
			}
		}
	}
	public OrdFinanceApplyAttach updateOfflineAttach(OrdFinanceApplyAttach attach, Integer status){
		OrdFinanceApplyAttach f = ordFinanceApplyAttachDAO.get(attach.getId());
		f.setPostid(attach.getPostid());
		f.setAttachMemo(attach.getAttachMemo());
//		if (f.getUploadStatus().intValue() == Constants.ORD_ATTACH_CHECK_FAILURE) {
//			f.setUploadStatus(Constants.ORD_ATTACH_WAIT_SUB);
//		} else {
//			f.setUploadStatus(status);
//		}
		f.setUploadStatus(status);
		f.setUploadWay(1);//线下
		ordFinanceApplyAttachDAO.update(f);
		return f;
	}
	public OrdFinanceApply updateOffLineAgree(OrdFinanceApplyAttach attach,OrdFinanceApply apply, Integer status){
		OrdFinanceApply a = ordFinanceApplyDAO.get(apply.getId());
		a.setAgreeMemo(attach.getAttachMemo());
		a.setAgreeFileUpload(attach.getPostid());
		a.setAgreeUploadTime(new Date());
		a.setAgreeUploadWay(1);
		a.setAgreeStatus(status);
		ordFinanceApplyDAO.update(a);
		return a;
	}
	public OrdFinanceApply updateOffLineAgreeCheck(OrdFinanceApply apply, Integer status){
		OrdFinanceApply a = ordFinanceApplyDAO.get(apply.getId());
		a.setAgreeStatus(status);
		ordFinanceApplyDAO.update(a);
		return a;
	}

	public void deleteAttachListById(Integer id) {
		OrdFaAttachList fl = ordFaAttachListDAO.get(id);
		fl.setIsDeleted(1);
		ordFaAttachListDAO.update(fl);
		
		Integer countAtt = ordFaAttachListDAO.countAttachList(fl.getAttachId());
		if(countAtt == 0){
			OrdFinanceApplyAttach att = ordFinanceApplyAttachDAO.get(fl.getAttachId());
			att.setUploadStatus(Constants.ORD_ATTACH_NO_UPLOAD);
			ordFinanceApplyAttachDAO.update(att);
		}
		
	}

	public String generatePdf(OrdFinanceApply apply, PrdFinance product, OrdApplyUsrCompany ordCompany, String loanOrgName, String addressForward) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/HH");
		String path = "/upload/pdf/" + sdf.format(new Date());
		String realpath = ServletActionContext.getServletContext().getRealPath(path);
		File j = new File(realpath);
		if (!j.exists()) {
			j.mkdirs();
		}
		String tffUrl = ServletActionContext.getServletContext().getRealPath("/WEB-INF/classes") + "/SIMYOU.TTF";
		String filename = UUID.randomUUID().toString() + ".pdf";
		String realFileName = realpath + "/" + filename;
		String downPath = path + "/" + filename;
		Document document = new Document();
		try {
			PdfWriter.getInstance(document, new FileOutputStream(realFileName)).setInitialLeading(10);
			document.open();
			BaseFont bfChinese = BaseFont.createFont(tffUrl, BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
			Font f10 = new Font(bfChinese, 8, Font.NORMAL);
			Font f12 = new Font(bfChinese, 12, Font.BOLD);

			Paragraph p = new Paragraph("融资申请订单", f12);
			p.setAlignment(Element.ALIGN_CENTER);
			p.setLeading(10);
			document.add(p);
			SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			document.add(Chunk.NEWLINE);
			PdfPTable table0 = new PdfPTable(4);
			PdfPCell c = new PdfPCell();
			c.setFixedHeight(15f);
			c.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
			table0.setWidthPercentage(100);
			c.setPhrase(new Paragraph("订单号:", f10));
			table0.addCell(c);
			c.setPhrase(new Paragraph(apply.getApplyNum(), f10));
			table0.addCell(c);
			c.setPhrase(new Paragraph("订单提交日期:", f10));
			table0.addCell(c);
			c.setPhrase(new Paragraph(apply.getCreatedt()==null?"暂无":fm.format(apply.getCreatedt()), f10));
			table0.addCell(c);
			document.add(table0);
			// 申请信息
			if (apply != null) {
				Paragraph p1 = new Paragraph("申请信息:", f10);
				p1.setLeading(15);
				p1.setSpacingAfter(10);
				document.add(p1);
				PdfPTable table1 = new PdfPTable(8);
				PdfPCell cell = new PdfPCell();
				cell.setFixedHeight(15f);
				cell.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
				table1.setWidthPercentage(100);
				cell.setPhrase(new Paragraph("融资用途:", f10));
				table1.addCell(cell);
				cell.setPhrase(new Paragraph(dictoryDataService.getValueNameById(Integer.parseInt(apply.getLoanPurpose()))+(apply.getLoanPurposeOther()==null?"":apply.getLoanPurposeOther()), f10));
				table1.addCell(cell);
				cell.setPhrase(new Paragraph("金额:", f10));
				table1.addCell(cell);
				cell.setPhrase(new Paragraph(apply.getLoanAmount() + "万元", f10));
				table1.addCell(cell);
				cell.setPhrase(new Paragraph("期限:", f10));
				table1.addCell(cell);
				cell.setPhrase(new Paragraph(apply.getLoanMonth() + "个月", f10));
				table1.addCell(cell);
				cell.setPhrase(new Paragraph("是否有抵押物:", f10));
				table1.addCell(cell);
				cell.setPhrase(new Paragraph(apply.getHaveMortgage() == 1 ? "有" : "无", f10));
				table1.addCell(cell);
				cell.setPhrase(new Paragraph("抵押物类型：", f10));
				table1.addCell(cell);
				if(apply.getHaveMortgage()!=1){
					cell.setPhrase(new Paragraph("无", f10));
				}else{
					cell.setPhrase(new Paragraph((apply.getMortgageType()==null?"无":dictoryDataService.getValueNameById(apply.getMortgageType())), f10));
				}
				table1.addCell(cell);
				cell.setPhrase(new Paragraph("抵押物估值：", f10));
				table1.addCell(cell);
				if(apply.getHaveMortgage()!=1){
					cell.setPhrase(new Paragraph("无", f10));
				}else{
					cell.setPhrase(new Paragraph((apply.getMortgageWorth()==null?"无":(apply.getMortgageWorth().toString() + "万元")), f10));
				}
				table1.addCell(cell);
				cell.setPhrase(new Paragraph("申请产品:", f10));
				table1.addCell(cell);
				cell.setPhrase(new Paragraph(product.getFinanceName(), f10));
				table1.addCell(cell);
				cell.setPhrase(new Paragraph("融资渠道:", f10));
				table1.addCell(cell);
				cell.setPhrase(new Paragraph(loanOrgName, f10));
				table1.addCell(cell);
				document.add(table1);
			}

			// 联系人信息
			if (ordCompany != null) {
				Paragraph p1 = new Paragraph("联系人信息:", f10);
				p1.setLeading(15);
				p1.setSpacingAfter(10);
				document.add(p1);
				PdfPTable table2 = new PdfPTable(6);
				PdfPCell cell = new PdfPCell();
				cell.setFixedHeight(15f);
				cell.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
				table2.setWidthPercentage(100);
				cell.setPhrase(new Paragraph("姓名:", f10));
				table2.addCell(cell);
				cell.setPhrase(new Paragraph(ordCompany.getLinkname(), f10));
				table2.addCell(cell);
				cell.setPhrase(new Paragraph("邮箱:", f10));
				table2.addCell(cell);
				cell.setPhrase(new Paragraph(ordCompany.getLinkemail(), f10));
				table2.addCell(cell);
				cell.setPhrase(new Paragraph("电话:", f10));
				table2.addCell(cell);
				cell.setPhrase(new Paragraph(ordCompany.getLinktelephone(), f10));
				table2.addCell(cell);
				document.add(table2);
			}

			// 企业信息
			if (ordCompany != null) {
				Paragraph p1 = new Paragraph("企业信息:", f10);
				p1.setLeading(15);
				p1.setSpacingAfter(10);
				document.add(p1);
				PdfPTable table3 = new PdfPTable(2);
				PdfPCell cell = new PdfPCell();
				cell.setFixedHeight(15f);
				cell.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
				table3.setWidthPercentage(100);
				cell.setPhrase(new Paragraph("企业名称:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(ordCompany.getCompanyname(), f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("营业执照号码:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(ordCompany.getLicensecode(), f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("组织机构代码证号码:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(ordCompany.getOrganizationcode(), f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("税务登记证号码:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(ordCompany.getFaxcode(), f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("开户许可证号码:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(ordCompany.getBankpermitcode(), f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("贷款卡号:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(ordCompany.getLoancard(), f10));
				table3.addCell(cell);/*
				cell.setPhrase(new Paragraph("注册地址:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(dictoryDataService.getPCDNameByIds(ordCompany.getRegprovinceid(), ordCompany.getRegcityid(), ordCompany.getRegdistrictid())+ordCompany.getRegaddress(), f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("邮编:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(ordCompany.getRegpostcode(), f10));
				table3.addCell(cell);*/
				cell.setPhrase(new Paragraph("企业类型:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(dictoryDataService.getValueNameById(ordCompany.getEnterprisetypeid()), f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("员工人数:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(dictoryDataService.getValueNameById(ordCompany.getEmployeesid()), f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("经营范围:", f10));
				table3.addCell(cell);
				String area = ordCompany.getBizscope();
				area = area.replaceAll("<p>", "");
				area = area.replaceAll("</p>", "");
				area = area.replaceAll("<br />", ";");
				cell.setPhrase(new Paragraph(area, f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("企业经营地址:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(dictoryDataService.getPCDNameByIds(ordCompany.getBizprovinceid(), ordCompany.getBizcityid(), ordCompany.getBizdistrictid())+ordCompany.getBizaddress(), f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("邮编:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(ordCompany.getBizpostcode(), f10));
				table3.addCell(cell);
				document.add(table3);
			}

			// 法人信息
			if (ordCompany != null) {
				Paragraph p1 = new Paragraph("企业信息:", f10);
				p1.setLeading(15);
				p1.setSpacingAfter(10);
				document.add(p1);
				PdfPTable table3 = new PdfPTable(2);
				PdfPCell cell = new PdfPCell();
				cell.setFixedHeight(15f);
				cell.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
				table3.setWidthPercentage(100);
				cell.setPhrase(new Paragraph("法定代表人:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(ordCompany.getLegalperson(), f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("学历:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(dictoryDataService.getValueNameById(ordCompany.getLpeducation()), f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("婚姻状况:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(dictoryDataService.getValueNameById(ordCompany.getLpmarry()), f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("从事所属行业年限:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(dictoryDataService.getValueNameById(ordCompany.getLpindustryyears()), f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("身份证号码:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(ordCompany.getLpcid(), f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("手机:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(ordCompany.getLpmobile(), f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("家庭电话:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(ordCompany.getLphometel(), f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("常住地址:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(dictoryDataService.getPCDNameByIds(ordCompany.getLpliveprovinceid(), ordCompany.getLplivecityid(), ordCompany.getLplivedistrictid()) + ordCompany.getLpliveaddress(), f10));
			/*	table3.addCell(cell);
				cell.setPhrase(new Paragraph("邮编:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(ordCompany.getLplivepostcode(), f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("户籍所在地:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(addressForward, f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("邮编:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(ordCompany.getLphkpostcode(), f10));
				table3.addCell(cell);*/
				document.add(table3);
			}

			// 企业经营信息
			if (ordCompany != null) {
				Paragraph p1 = new Paragraph("企业经营信息:", f10);
				p1.setLeading(15);
				p1.setSpacingAfter(10);
				document.add(p1);
				PdfPTable table3 = new PdfPTable(2);
				PdfPCell cell = new PdfPCell();
				cell.setFixedHeight(15f);
				cell.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
				table3.setWidthPercentage(100);
				cell.setPhrase(new Paragraph("企业" + DateUtil.getStringByLastYear(new Date()) + "年销售额约为:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(apply.getLastyearSaleVolume().toString() + "万元", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("企业" + DateUtil.getStringByLastYear(new Date()) + "年经营成本约为:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(apply.getLastyearCost().toString() + "万元", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("企业" + DateUtil.getStringByLastYear(new Date()) + "年净利润率约为:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(apply.getLastyearProfit().toString() + "万元", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("截止到" + DateUtil.getStringByYearMonth(new Date()) + "，企业应收账款约为:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(apply.getReceivable().toString() + "万元", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("截止到" + DateUtil.getStringByYearMonth(new Date()) + "，企业总库存约为:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(apply.getStockSum().toString() + "万元", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("截止到" + DateUtil.getStringByYearMonth(new Date()) + "，企业总资产约为:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(apply.getAssetSum().toString() + "万元", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("截止到" + DateUtil.getStringByYearMonth(new Date()) + "，企业总负债约为:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(apply.getDebtSum().toString() + "万元", f10));
				table3.addCell(cell);
				document.add(table3);
			}

			document.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("导出pdf时候出现异常：" + e.getMessage());
		}
		return downPath;
	}

	public String generatePersonPdf(OrdFinanceApply apply, PrdFinance product, String loanOrgName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/HH");
		String path = "/upload/pdf/" + sdf.format(new Date());
		String realpath = ServletActionContext.getServletContext().getRealPath(path);
		File j = new File(realpath);
		if (!j.exists()) {
			j.mkdirs();
		}
		String tffUrl = ServletActionContext.getServletContext().getRealPath("/WEB-INF/classes") + "/SIMYOU.TTF";
		String filename = UUID.randomUUID().toString() + ".pdf";
		String realFileName = realpath + "/" + filename;
		String downPath = path + "/" + filename;
		Document document = new Document();
		try {
			PdfWriter.getInstance(document, new FileOutputStream(realFileName));
			document.open();
			BaseFont bfChinese = BaseFont.createFont(tffUrl, BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
			Font f10 = new Font(bfChinese, 8, Font.NORMAL);
			Font f12 = new Font(bfChinese, 12, Font.BOLD);

			Paragraph p = new Paragraph("融资申请订单", f12);
			p.setAlignment(Element.ALIGN_CENTER);
			document.add(p);
			SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			document.add(Chunk.NEWLINE);
			PdfPTable table0 = new PdfPTable(4);
			PdfPCell c = new PdfPCell();
			table0.setWidthPercentage(100);
			c.setFixedHeight(15f);
			c.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
			c.setPhrase(new Paragraph("订单号:", f10));
			table0.addCell(c);
			c.setPhrase(new Paragraph(apply.getApplyNum(), f10));
			table0.addCell(c);
			c.setPhrase(new Paragraph("订单提交日期:", f10));
			table0.addCell(c);
			c.setPhrase(new Paragraph(apply.getCreatedt()==null?"暂无":fm.format(apply.getCreatedt()), f10));
			table0.addCell(c);
			document.add(table0);
			// 申请信息
			if (apply != null) {
				Paragraph p1 =new Paragraph("申请信息:", f10);
				p1.setLeading(15);
				p1.setSpacingAfter(10);
				document.add(p1);
				PdfPTable table1 = new PdfPTable(8);
				PdfPCell cell = new PdfPCell();
				cell.setFixedHeight(15f);
				cell.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
				table1.setWidthPercentage(100);
				cell.setPhrase(new Paragraph("融资用途:", f10));
				table1.addCell(cell);
				cell.setPhrase(new Paragraph(dictoryDataService.getValueNameById(Integer.parseInt(apply.getLoanPurpose()))+(apply.getLoanPurposeOther()==null?"":apply.getLoanPurposeOther()), f10));
				table1.addCell(cell);
				cell.setPhrase(new Paragraph("金额:", f10));
				table1.addCell(cell);
				cell.setPhrase(new Paragraph(apply.getLoanAmount() + "万元", f10));
				table1.addCell(cell);
				cell.setPhrase(new Paragraph("期限:", f10));
				table1.addCell(cell);
				cell.setPhrase(new Paragraph(apply.getLoanMonth() + "个月", f10));
				table1.addCell(cell);
				cell.setPhrase(new Paragraph("是否有抵押物:", f10));
				table1.addCell(cell);
				cell.setPhrase(new Paragraph(apply.getHaveMortgage() == 1 ? "有" : "无", f10));
				table1.addCell(cell);
				cell.setPhrase(new Paragraph("抵押物类型：", f10));
				table1.addCell(cell);
				if(apply.getHaveMortgage()!=1){
					cell.setPhrase(new Paragraph("无", f10));
				}else{
					cell.setPhrase(new Paragraph((apply.getMortgageType()==null?"无":dictoryDataService.getValueNameById(apply.getMortgageType())), f10));
				}
				table1.addCell(cell);
				cell.setPhrase(new Paragraph("抵押物估值：", f10));
				table1.addCell(cell);
				if(apply.getHaveMortgage()!=1){
					cell.setPhrase(new Paragraph("无", f10));
				}else{
					cell.setPhrase(new Paragraph((apply.getMortgageWorth()==null?"无":(apply.getMortgageWorth().toString() + "万元")), f10));
				}
				table1.addCell(cell);
				cell.setPhrase(new Paragraph("银行名称:", f10));
				table1.addCell(cell);
				cell.setPhrase(new Paragraph(loanOrgName, f10));
				table1.addCell(cell);
				cell.setPhrase(new Paragraph("产品名称:", f10));
				table1.addCell(cell);
				cell.setPhrase(new Paragraph(product.getFinanceName(), f10));
				table1.addCell(cell);
				document.add(table1);
			}
			UsrPerson usrPerson = (UsrPerson) profileService.getProfiles(apply.getUserId());
			UsrUser u = usrUserDAO.get(apply.getUserId());
			// 申请方信息
			if (usrPerson != null && u != null) {
				String hj = dictoryDataService.getPCDNameByIds(usrPerson.getProvinceid(), usrPerson.getCityid(), usrPerson.getDistrictid());
				Paragraph p1 = new Paragraph("申请方信息:", f10);
				p1.setLeading(15);
				p1.setSpacingAfter(10);
				document.add(p1);
				PdfPTable table3 = new PdfPTable(2);
				PdfPCell cell = new PdfPCell();
				cell.setFixedHeight(15f);
				cell.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
				table3.setWidthPercentage(100);
				cell.setPhrase(new Paragraph("姓名：", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(u.getRealname() + (u.getGender() == 1 ? "先生" : "女士"), f10));
				table3.addCell(cell);/*
				fm = new SimpleDateFormat("yyyy-MM-dd");
				cell.setPhrase(new Paragraph("出生年月:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(usrPerson.getBirthday()==null?"暂无":fm.format(usrPerson.getBirthday()), f10));
				table3.addCell(cell);*/
				cell.setPhrase(new Paragraph("教育程度:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(dictoryDataService.getValueNameById(usrPerson.getEducation()), f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("身份证号码:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(usrPerson.getCid().toString(), f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("所在地:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(hj, f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("详细地址:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(hj + usrPerson.getAddress(), f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("邮政编码:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(usrPerson.getPostcode(), f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("职业:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(dictoryDataService.getValueNameById(usrPerson.getCareerid()), f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("固定电话:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(usrPerson.getTelephone(), f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("联系方式:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(dictoryDataService.getValueNameById(usrPerson.getIm1type()) +"  "+ usrPerson.getIm1(), f10));
				table3.addCell(cell);
				document.add(table3);
			}

			// 个人信息
			if (apply != null) {
				String pindName = "";
				String cindName = "";
				if (apply.getRunningTrade() != null) {
					pindName = dictoryDataService.getIndustryNameById(apply.getRunningTrade());
				}
				if (apply.getRunningTradeChild() != null) {
					cindName = dictoryDataService.getIndustryNameById(apply.getRunningTradeChild());
				}
				Paragraph p1 = new Paragraph("个人信息:", f10);
				p1.setLeading(15);
				p1.setSpacingAfter(10);
				document.add(p1);
				PdfPTable table3 = new PdfPTable(2);
				PdfPCell cell = new PdfPCell();
				cell.setFixedHeight(15f);
				cell.setHorizontalAlignment(PdfPCell.ALIGN_CENTER);
				table3.setWidthPercentage(100);
				cell.setPhrase(new Paragraph("行业：", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(pindName + cindName, f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("行业经验:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(apply.getExperience().toString() + "年", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("年营业额:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(dictoryDataService.getValueNameById(apply.getAllyearVolume()), f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("经营场所:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(apply.getRunningArea() == 1 ? "有" : "无", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("银行借款经历:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(apply.getHostoryLoan() == 1 ? "有" : "无", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph("使用信用卡经历:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(apply.getUseCreditcard() == 1 ? "有" : "无", f10));
				table3.addCell(cell);
				if(!(apply.getHostoryLoan()==0&&apply.getUseCreditcard()==0)){
				cell.setPhrase(new Paragraph("逾期还款记录:", f10));
				table3.addCell(cell);
				if(apply.getBreakRepay()==null||apply.getBreakRepay().intValue()!=1){
					cell.setPhrase(new Paragraph("无", f10));
				}else{
					cell.setPhrase(new Paragraph("有", f10));
				}
					table3.addCell(cell);
					
					cell.setPhrase(new Paragraph("近两年逾期次数:", f10));
					table3.addCell(cell);
					cell.setPhrase(new Paragraph(apply.getBreakNum() == null ? "无" : apply.getBreakNum()+"次", f10));
					table3.addCell(cell);
				}

				cell.setPhrase(new Paragraph("银行流水:", f10));
				table3.addCell(cell);
				cell.setPhrase(new Paragraph(apply.getBankSalaryList() == 1 ? "有" : "无", f10));
				table3.addCell(cell);
				if (apply.getBankSalaryList() != 0) {
					cell.setPhrase(new Paragraph("近半年银行流水量:", f10));
					table3.addCell(cell);
					cell.setPhrase(new Paragraph(apply.getSixmonthBanklist() == null ? "无" : apply
							.getSixmonthBanklist() + "万元", f10));
					table3.addCell(cell);
				}
				document.add(table3);
			}
			document.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("导出pdf时候出现异常：" + e.getMessage());
		}
		return downPath;
	}

	@Override
	public List<OrdCheckLog> findAllLogByComOrPle(Integer applyId) {
		return ordCheckLogDAO.findAllLogByComOrPle(applyId);
	}

	@Override
	public List<OrdCheckLog> findTopLogByComOrPle(Integer applyId, Integer num) {
		return ordCheckLogDAO.findTopLogByComOrPle(applyId, num);
	}

	@Override
	public List<OrdCheckLog> findAllLogByLoan(Integer applyId) {
		return ordCheckLogDAO.findAllLogByLoan(applyId);
	}

	@Override
	public List<OrdCheckLog> findTopLogByLoan(Integer applyId, Integer num) {
		return ordCheckLogDAO.findTopLogByLoan(applyId, num);
	}
}
