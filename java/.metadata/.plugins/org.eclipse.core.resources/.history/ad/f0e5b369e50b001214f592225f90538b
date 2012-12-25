package org.tju.ebs.interceptor;

import java.lang.reflect.Method;

import org.springframework.aop.AfterReturningAdvice;
import org.springframework.aop.MethodBeforeAdvice;

public class EmailSenderAdvice implements AfterReturningAdvice, MethodBeforeAdvice {

	@Override
	public void afterReturning(Object returnValue, Method method,
			Object[] args, Object target) throws Throwable {
		System.out.println("email has been sent out.");
	}

	
	@Override
	public void before(Method method, Object[] args, Object target)
			throws Throwable {
		System.out.println("try to authentication.");
	}
}
