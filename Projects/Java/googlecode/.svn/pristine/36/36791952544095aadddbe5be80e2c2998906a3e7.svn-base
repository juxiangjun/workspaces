package com.zj198.util;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

import org.apache.struts2.ServletActionContext;


public class PropertiesUtil {
	//TODO: apache properties class replace it
	public static String getByKey(String key) {
		Properties props = new Properties();
		String realPath = ServletActionContext.getServletContext().getRealPath("/WEB-INF/classes");
		try {
			InputStream in = new BufferedInputStream(new FileInputStream(realPath + "/config.properties"));
			props.load(in);
			return props.getProperty(key,null);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}