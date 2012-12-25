package com.zj198.action.loan;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.action.loan.model.PreviewFinanceProSrModel;
import com.zj198.annotation.Product;
import com.zj198.model.DicCommon;
import com.zj198.model.DicIndustry;
import com.zj198.model.PrdDatafileList;
import com.zj198.model.PrdExtendsProperty;
import com.zj198.model.PrdFinance;
import com.zj198.model.PrdFinanceDatafile;
import com.zj198.model.PrdPropertyDic;
import com.zj198.model.UsrUser;
import com.zj198.model.vo.FinanceAreaModel;
import com.zj198.model.vo.FinanceIndustryModel;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.loan.FinanceProductService;
import com.zj198.service.loan.model.FinanceProductSpModel;
import com.zj198.service.loan.model.FinanceProductSrModel;
import com.zj198.util.Constants;

/**
 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 14:54:57
 * @modify zeroleavebaoyang@gmail.com
 * @since 2012-7-18 | 13:23:49
 */
public class UserFinanceProductAction extends BaseAction {
	private FinanceProductService financeProductService;
	private DictoryDataService dictoryDataService;
	private FinanceProductSpModel financeProductSpModel;
	private List<PrdFinance> productList;
	private List<PrdDatafileList> dataFileList;
	private List<DicCommon> purposeTypeList;
	private List<FinanceAreaModel> productAreaList;
	private List<FinanceIndustryModel> productIndustryList;
	private List<DicIndustry> industryList;
	private PrdFinance product;
	private Integer productId;
	private Integer purposeId;// ajax二级联动ID
	private Integer industryId;
	private Integer repeatStatus;//重新发布产品标志
	
	/**
	 * 银行或其它贷款机构产品管理
	 * @return
	 */
	public String execute() {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		if(user == null){
			return ERROR;
		}
		productList = financeProductService.findFinanceByUser(user.getId());
		
		return "financeMana";
	}
	
	
	@Product
	public String viewFinance(){
		product = financeProductService.getFinance(productId);
		productAreaList = financeProductService.findFiananceArea(productId);
		productIndustryList = financeProductService.findFiananceInducty(productId);
		financeProductSpModel = new FinanceProductSpModel();
		financeProductSpModel.setExtendsPropertyList(financeProductService.getFinancePropertys(productId));
		if(product.getOtherRequire() != null){
			product.setOtherRequire(product.getOtherRequire().replaceAll("\r\n", "<br/>"));
		}
		if(product.getProIntroduce() != null){
			product.setProIntroduce(product.getProIntroduce().replaceAll("\r\n", "<br/>"));
		}
		if(product.getDataFiles() != null){			
			for(PrdFinanceDatafile df: product.getDataFiles()){
				if(df.getOtherMemo() != null){
					df.setOtherMemo(df.getOtherMemo().replaceAll("\r\n", "<br/>"));
				}
			}
		}
		
		
		return "view_finance";
	}
	
	public String updateStatus(){
		financeProductService.updateFinanceStatus(product);
		return "update_success";
	}

	public String newfin() {
		dataFileList = financeProductService.findDataFileListAll();
		return "new_finanace_page";
	}
	
	/**
	 * 融资产品预览
	 * @return
	 */
	public String previewfin(){
		financeProductSpModel.setProduct(product);
		PreviewFinanceProSrModel srmodel = financeProductService.priviewFinance(financeProductSpModel);
		productAreaList = srmodel.getProductAreaList();
		productIndustryList = srmodel.getProductIndustryList();
		financeProductSpModel.setExtendsPropertyList(srmodel.getExtendsPropertyList());
		return "view_finance";
	}
	/**
	 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 14:54:57
	 * @param
	 * @return
	 */
	public String savefin() {
		// INIT
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		financeProductSpModel.setProduct(product);
//		financeProductSpModel.setUserId(user.getId());
//		financeProductSpModel.setUserType(Integer.valueOf(user.getType()));
		financeProductSpModel.setUser(user);
		financeProductService.saveFinance(financeProductSpModel);
		productAreaList = financeProductService.findFiananceArea(product.getId());
		productIndustryList = financeProductService.findFiananceInducty(product.getId());
		
		if(product.getOtherRequire() != null){
			product.setOtherRequire(product.getOtherRequire().replaceAll("\r\n", "<br/>"));
		}
//		if(product.getProIntroduce() != null){
//			product.setProIntroduce(product.getProIntroduce().replaceAll("\r\n", "<br/>"));
//		}
		if(product.getDataFiles() != null){			
			for(PrdFinanceDatafile df: product.getDataFiles()){
				if(df.getOtherMemo() != null){
					df.setOtherMemo(df.getOtherMemo().replaceAll("\r\n", "<br/>"));
				}
			}
		}
		
		return "view_finance";
	}
	@Product
	public String updateFinancePage() {
		financeProductSpModel = financeProductService.getFinanceProductToEdit(product.getId());
		product = financeProductSpModel.getProduct();
		dataFileList = financeProductSpModel.getDataFileList();
		return "update_finance_page";
	}
	@Product
	public String updatefin() {
		if(repeatStatus != null && repeatStatus.intValue() == 1){
			return savefin();
		}
		// INIT
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		financeProductSpModel.setProduct(product);
//		financeProductSpModel.setUserId(user.getId());
		financeProductSpModel.setUser(user);
		FinanceProductSrModel srModel = financeProductService.updateFinance(financeProductSpModel);
		product = srModel.getProduct();
		productAreaList = financeProductService.findFiananceArea(product.getId());
		productIndustryList = financeProductService.findFiananceInducty(product.getId());
		financeProductSpModel.setExtendsPropertyList(srModel.getExtendsPropertyList());
		
		if(product.getOtherRequire() != null){
			product.setOtherRequire(product.getOtherRequire().replaceAll("\r\n", "<br/>"));
		}
//		if(product.getProIntroduce() != null){
//			product.setProIntroduce(product.getProIntroduce().replaceAll("\r\n", "<br/>"));
//		}
		if(product.getDataFiles() != null && product.getDataFiles().size() > 0){			
			for(PrdFinanceDatafile df: product.getDataFiles()){
				if(df.getOtherMemo() != null){
					df.setOtherMemo(df.getOtherMemo().replaceAll("\r\n", "<br/>"));
				}
			}
		}
		
		return "view_finance";
	}

	
	public String extendsPro(){
		List<PrdExtendsProperty> plist = new ArrayList<PrdExtendsProperty>();
		if(financeProductSpModel.getExtendsName() != null && financeProductSpModel.getExtendsName().length > 0){
			int j = 0;
			for(int i = 0; i< financeProductSpModel.getExtendsName().length; i++){
				PrdExtendsProperty pro = new PrdExtendsProperty();
				pro.setExtendsType(Constants.EXTENDS_PROPERTY_FINANCE);
				pro.setRowId(product.getId());
				pro.setFieldName(financeProductSpModel.getExtendsName()[i]);
				pro.setFieldType(financeProductSpModel.getExtendsType()[i]);
				String pv = "";
				if(financeProductSpModel.getExtendsType()[i] == 3 || financeProductSpModel.getExtendsType()[i] == 4){
					pv = financeProductSpModel.getExtendsValue()[j++];
					pro.setFieldValue(pv);
				}
				pro.setFieldvalueNullAble(0);
				pro.setStatus(0);
				
				if(financeProductSpModel.getExtendsType()[i] == 3 || financeProductSpModel.getExtendsType()[i] == 4){
					if(pv != null && pv.length() > 0){
						String[] pstr = pv.split("#");
						Set<PrdPropertyDic> dicSet = new LinkedHashSet<PrdPropertyDic>();
						for(int k = 0; k < pstr.length; k++){
							PrdPropertyDic dic = new PrdPropertyDic();
							dic.setGroupId(pro.getId());
							dic.setDicValue(k + 1);
							dic.setDicName(pstr[k]);
							dicSet.add(dic);
						}
						pro.setPropertyDicSet(dicSet);
					}
				}
				plist.add(pro);
			}
		}
		financeProductSpModel.setExtendsPropertyList(plist);
		
		return "previewExtendsProperty";
	}


	/**
	 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 14:54:57
	 * @param
	 * @return
	 */
	public String searchDateFile() {
		// INIT
		financeProductService.searchDateFile();
		return "searchDateFile";
	}

	public void setFinanceProductService(FinanceProductService financeProductService) {
		this.financeProductService = financeProductService;
	}

	/**
	 * 
	 * @Author zeroleavebaoyang@gmail.com
	 * @Description 用途异步级联显示
	 * @return
	 */
	public String purpose() {
		purposeTypeList = dictoryDataService.findCommonDataByGroupId(purposeId);
		return "purposeTypeList";
	}

	/**
	 * 
	 * @Author zeroleavebaoyang@gmail.com
	 * @Description 行业异步级联显示
	 * @return
	 */
	public String Industry() {
		industryList = dictoryDataService.findIndustryByParentid(industryId);
		return "industryList";
	}

	//setter and getter
	public List<PrdFinance> getProductList() {
		return productList;
	}

	public void setProductList(List<PrdFinance> productList) {
		this.productList = productList;
	}

	public PrdFinance getProduct() {
		return product;
	}

	public void setProduct(PrdFinance product) {
		this.product = product;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public FinanceProductSpModel getFinanceProductSpModel() {
		return financeProductSpModel;
	}

	public void setFinanceProductSpModel(FinanceProductSpModel financeProductSpModel) {
		this.financeProductSpModel = financeProductSpModel;
	}

	public List<PrdDatafileList> getDataFileList() {
		return dataFileList;
	}

	public void setDataFileList(List<PrdDatafileList> dataFileList) {
		this.dataFileList = dataFileList;
	}

	public List<DicCommon> getPurposeTypeList() {
		return purposeTypeList;
	}

	public void setPurposeTypeList(List<DicCommon> purposeTypeList) {
		this.purposeTypeList = purposeTypeList;
	}

	public List<FinanceAreaModel> getProductAreaList() {
		return productAreaList;
	}

	public void setProductAreaList(List<FinanceAreaModel> productAreaList) {
		this.productAreaList = productAreaList;
	}

	public List<FinanceIndustryModel> getProductIndustryList() {
		return productIndustryList;
	}

	public void setProductIndustryList(
			List<FinanceIndustryModel> productIndustryList) {
		this.productIndustryList = productIndustryList;
	}

	public Integer getPurposeId() {
		return purposeId;
	}

	public void setPurposeId(Integer purposeId) {
		this.purposeId = purposeId;
	}


	public Integer getIndustryId() {
		return industryId;
	}

	public void setIndustryId(Integer industryId) {
		this.industryId = industryId;
	}

	public List<DicIndustry> getIndustryList() {
		return industryList;
	}

	public void setIndustryList(List<DicIndustry> industryList) {
		this.industryList = industryList;
	}

	public Integer getRepeatStatus() {
		return repeatStatus;
	}

	public void setRepeatStatus(Integer repeatStatus) {
		this.repeatStatus = repeatStatus;
	}

	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}
	
}
