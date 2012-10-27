package org.tju.ebs.interceptor;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoggerInterceptor extends HandlerInterceptorAdapter {

	private Date startTime;
	private Date endTime;
	
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler) throws Exception{
		System.out.println(this.getClass().getName()+"::preHandle");
		
		Calendar c = Calendar.getInstance();
		startTime = c.getTime();
		System.out.println("Start Time:" + startTime);
		return true;
	}
	
	@Override
	public void postHandle(
			HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)
			throws Exception {
		System.out.println(this.getClass().getName()+"::PostHandler");
	}
	
	@Override
	public void afterCompletion(
			HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println(this.getClass().getName()+"::afterCompletion");
		
		Calendar c = Calendar.getInstance();
		endTime = c.getTime();
		int elapsed = endTime.compareTo(startTime);
		System.out.println("End Time:" + endTime);
		System.out.println("Elapsed:"+elapsed);
		request.getSession().setAttribute("elapsed", elapsed);
	}
	
	
	
}
