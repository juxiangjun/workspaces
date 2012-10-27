package org.tju.ebs.utils;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

public class HttpUtils {

	@SuppressWarnings("unchecked")
	public static String getHttpServletRequestParamters(
			HttpServletRequest request) {
		String result = "";
		Enumeration e = request.getParameterNames();

		while (e.hasMoreElements()) {
			result = result + e.nextElement().toString() + ",";
		}
		return result;
	}
}
