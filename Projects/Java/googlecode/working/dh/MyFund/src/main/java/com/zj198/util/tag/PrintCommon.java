package com.zj198.util.tag;

import java.io.Writer;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.struts2.components.Component;
import org.apache.struts2.json.JSONReader;
import org.apache.struts2.json.JSONUtil;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import com.zj198.model.vo.ValueSetModel;
import com.zj198.service.common.DictoryDataService;
import com.zj198.util.ApplicationContextUtil;
import com.zj198.util.Constants;

public class PrintCommon extends Component{
	private String valueId;
	private String valueSetId;
	protected String valueSetMap;
	
	public PrintCommon(ValueStack value){
		super(value);
	}
	
	@Override
	public boolean start(Writer arg0){
		boolean result = super.start(arg0);
		try {
			StringBuilder str = new StringBuilder();
			boolean isValid = true;
			Object obj = null;
			if(isValid){
				if(valueId.startsWith("{") && valueId.endsWith("}")){
					valueId = valueId.substring(1, valueId.length()-1);
				}else if(valueId.startsWith("${") && valueId.endsWith("}")){
					valueId = valueId.substring(2, valueId.length()-1);
				}
				obj = this.getStack().findValue(valueId);
				isValid = obj == null ? false : true;
			}
			
			if(isValid){
				valueId = obj.toString().trim();
				if (valueId.indexOf(",") != -1) {
					if(valueId.startsWith(",")){
						valueId = valueId.substring(1);
					}
					if(valueId.endsWith(",")){
						valueId = valueId.substring(0, valueId.length() - 1);
					}
				}
				
				String valueIdStr = "";
				if(valueSetMap != null && !valueSetMap.trim().equals("")){
					LinkedHashMap<String, String> v = Constants.getValueSet().get(valueSetMap);
					if(valueId.indexOf(",") != -1){
						String[] arr = valueId.split(",");
						for(String s:arr){
							valueIdStr +=v.get(s) + ",";
						}
						valueIdStr = valueIdStr.substring(0, valueIdStr.length()-1);
					}else{
						valueIdStr =v.get(valueId);
					}
				}else{					
					if(!valueId.equals("")){
						ApplicationContext ac = (ApplicationContext) (new ActionContext(this.stack.getContext())).getApplication().get(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
						DictoryDataService dictoryDataService = (DictoryDataService) ac.getBean("dictoryDataService");
						if(valueId.indexOf(",") != -1){							
							valueIdStr = dictoryDataService.getValueNamesByIds(valueId);
						}else{
							valueIdStr = dictoryDataService.getValueNameById(Integer.valueOf(valueId));
						}
					}
				}
				str.append("<label class='common_value'>" + valueIdStr + "</label>");
			}
			arg0.write(str.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public String getValueId() {
		return valueId;
	}

	public void setValueId(String valueId) {
		this.valueId = valueId;
	}

	public String getValueSetId() {
		return valueSetId;
	}

	public void setValueSetId(String valueSetId) {
		this.valueSetId = valueSetId;
	}

	public String getValueSetMap() {
		return valueSetMap;
	}

	public void setValueSetMap(String valueSetMap) {
		this.valueSetMap = valueSetMap;
	}


}
