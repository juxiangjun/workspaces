//贷款计算器
$(function() {
	waychg(false); 	
	$('#ddlPayWay').bind("change",function(){
		waychg(true);  
	});
});
function GetLoanRatio(month)  
{			
	if(month == "")
	{
		alert("缺少贷款期限");
		return;
	}
	var baserate = 0;
	if(month<=6){
		baserate = baserate_inteArr[0];
	}else if(month>6 && month<=12){
		baserate = baserate_inteArr[1];
	}else if(month>12 && month<=36){
		baserate = baserate_inteArr[2];
	}else if(month>36 && month<=60){
		baserate = baserate_inteArr[3];
	}else if(month>60){
		baserate = baserate_inteArr[4];
	}
	return baserate;
}
function AutoShowRate()
{
	if(document.all.edTimes.value>0)
	{
		var year;
		year = document.all.edTimes.value/12;
		document.all.edRate.value = GetLoanRatio(year*12);
	}
}
			
function waychg(flag)
{
	if(this.document.all.ddlPayWay.selectedIndex==0){	    
		this.document.all.rbPayFreq1.disabled = false;
		this.document.all.rbPayFreq3.disabled = false;
		this.document.all.rbPayFreq4.disabled = true;
		if(this.document.all.rbPayFreq4.checked)
			this.document.all.rbPayFreq1.checked = true;
	}
	if(this.document.all.ddlPayWay.selectedIndex==1){
		this.document.all.rbPayFreq1.disabled = false;
		this.document.all.rbPayFreq3.disabled = false;
		this.document.all.rbPayFreq4.disabled = true;
		if(this.document.all.rbPayFreq4.checked)
		this.document.all.rbPayFreq1.checked = true;
	}
	if(this.document.all.ddlPayWay.selectedIndex==2){
		this.document.all.rbPayFreq1.disabled = true;
		this.document.all.rbPayFreq3.disabled = true;
		this.document.all.rbPayFreq4.disabled = false;
		this.document.all.rbPayFreq4.checked = true;
	}
}
		
function SetTableColor(table)
{
	for(i=0;i<=table.rows.length-1;i++)
	{
		if(i==0)
		{
			table.rows(i).className="head";
			continue;
		}
		if (i%2)
			table.rows(i).className="odd";
		else
			table.rows(i).className="even";
	}
}

function CheckData()
{
	if (!CheckPN(this.document.all.edLastSum,"请在贷款金额输入正整数",false)) return false;		
	if (!CheckPN(this.document.all.edTimes,"请在贷款期限输入正整数",false)) return false;				
	if (!CheckFN(this.document.all.edRate,"请在年利率要求输入非负数")) return false;
	if (this.document.all.rbPayFreq3.checked) 
	//每季度，	贷款期限要是3的倍数
	if ( parseInt(this.document.all.edTimes.value) % 3!=0)
	{
		DispMessage(this.document.all.edTimes,"当偿还频率为每季度时，贷款期限要是3的倍数");
		return false;
	}
	return true;
}