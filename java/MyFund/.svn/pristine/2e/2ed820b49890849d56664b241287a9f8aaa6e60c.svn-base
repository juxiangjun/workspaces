package com.zj198.action.admin.system;

import java.util.Iterator;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.zj198.action.BaseAction;
import com.zj198.model.DicBaseRate;
import com.zj198.service.common.DictoryDataService;
import com.zj198.util.Constants;
import com.zj198.util.JsUtil;

public class BaseRateAction extends BaseAction {

	private DictoryDataService dictoryDataService;
	private List<DicBaseRate> list;
	private Double[] rates;
	

	public Double[] getRates() {
		return rates;
	}

	public void setRates(Double[] rates) {
		this.rates = rates;
	}

	public List<DicBaseRate> getList() {
		return list;
	}

	public void setList(List<DicBaseRate> list) {
		this.list = list;
	}

	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}

	public String execute() {
		list = dictoryDataService.findBaseRate();
		return "baseRatelist";
	}

	public String update() {
		list = dictoryDataService.findBaseRate();
		for(int j = 0; j < list.size(); j++){
			DicBaseRate br = list.get(j);
			Double db = rates[j].doubleValue();
			if(db != br.getRate().doubleValue()){
				br.setRate(db);
				dictoryDataService.updateBaseRate(br);
			}
		}
		//重新写入js文件
		String path = ServletActionContext.getServletContext().getRealPath(Constants.PATH);;
		JsUtil.writeFile(path, Constants.JSNAME, JsUtil.myContent(list));
		writeJson("{\"success\":\"true\"}");
		return null;
	}

}
