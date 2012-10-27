package com.zj198.service.junit;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.zj198.model.OrdLoanRequest;
import com.zj198.service.loan.LoanRequestService;

public class LoanRequestServiceTest {

    private ApplicationContext ac = null;

    @Before
    public void before() {
        ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext.xml", "applicationContext-dao.xml",
                "applicationContext-service.xml" });
    }
    @Test
    public void test() throws ParseException {
        OrdLoanRequest r = new OrdLoanRequest();
        LoanRequestService oanRequestService = (LoanRequestService) ac.getBean("loanRequestService");
        
        Map<String, Map<String, Object>> mapCondition = new HashMap<String, Map<String, Object>>();
        Map<String, Object> m = new HashMap<String, Object>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        
        m.put("createdtFirst", sdf.parse("2012-7-1"));
		m.put("createdtSecond", sdf.parse("2012-8-1"));
		mapCondition.put("createdt", m);
        
        System.out.println(oanRequestService.getByObjCondition(r, mapCondition, 1000, 0).get("list"));
    }

}
