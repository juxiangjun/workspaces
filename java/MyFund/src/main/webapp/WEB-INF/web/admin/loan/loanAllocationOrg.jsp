<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="common" uri="/Common"%>
    <div class="f_box">
	  <span class="f_gz">融资建议：</span>
	  <p>${loanAllocation.orgCheckMemo }</p>  	
	</div>
    <s:if test="recommendProducts != null && recommendProducts.size() > 0">
    <div class="f_box" style="margin-bottom:10px;">
    	<span class="f_gz">推荐产品：</span>
    </div>
    <table class="container_950">
      <tr class="top_color">
        <td width="13%" style="padding-left:25px; border-top:1px solid #d7d7d7;">产品名称</td>
        <td width="9%" style="border-top:1px solid #d7d7d7;">金额</td>
        <td width="8%" style="border-top:1px solid #d7d7d7;">期限</td>
        <td width="10%" style="border-top:1px solid #d7d7d7;">利率说明(年利率)</td>
        <td width="10%" style="border-top:1px solid #d7d7d7;">产品特点</td>
        <td width="8%" style="border-top:1px solid #d7d7d7;">担保方式</td>
        <td width="6%" style="border-top:1px solid #d7d7d7;">审核时间</td>
        <td width="7%" style="border-top:1px solid #d7d7d7;"></td>
      </tr>
      <s:iterator value="recommendProducts">
	      <tr class="top_color01">
	        <td style="padding-left:25px;">
	        	<s:if test="logo == null || logo == ''">
			        <img src="/images/banklogo/zj198.jpg"  class="td_img" style="white-space: nowrap; padding-top:2px;"/>
		        </s:if>
		        <s:else>
		        	<img src="/images/banklogo/${logo }"  class="td_img" style="white-space: nowrap; padding-top:2px;"/>
		        </s:else>
		        <div style="padding-left:45px;">        
		        	${orgName }<br/>
		        	<div class="red" style="font-size:15px;font-weight: bolder;" >${financeName }</div>
		        </div>
	        </td>
	        <td><s:number name="financeLittleamount" />~<s:number name="financeBigamount" />万元</td>
	        <td>${financeLittledt }~${financeMostdt }个月</td>
	        <td>
	        	<s:if test="interestType == 155">
	        		<s:iterator value="interests">
	        			<s:if test="loan.loanMonth > financeStartdt && loan.loanMonth <= financeEnddt">
	        				<img src="/images/ico_upward.png"  style="float:left;margin:6px 3px 0 0;"/>${rateDown }%-${rateUp }%
	        			</s:if>
	        		</s:iterator>
	        	</s:if>
	        	<s:else>
	        		视具体情况而定
	        	</s:else>
	        </td>
	        <td><common:print valueId="repaymentType" divide="br"/></td>
	        <td><common:print valueId="proSpecial" divide="br"/></td>
	        <td>${checkTime}个工作日</td>
	        <td class="view_detail"><a href="/loan/financeProduct!cusViewFinance.act?product.id=${id}" target="_blank">查看</a></td>
	      </tr>
      </s:iterator>          
	</table>                                       
    </s:if>