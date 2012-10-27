package org.tju.ebs.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PublicService {

	private static final String configFile = "/com/bz/ebs/configuration/resources/webService.properties";
	private static final Logger log = LoggerFactory
			.getLogger(PublicService.class);

	private Properties p = null;

	public PublicService() {
		p = this.getProperties();
	}

	public String getWeatherByIP(String ip) {
		String url = p.getProperty("HOST_NAME") + p.getProperty("SERVICE_PATH")
				+ p.getProperty("SERVICE_NAME_IP_ADDR") + "?"
				+ p.getProperty("SERVICE_NAME_IP_ADDR_PARAM") + "=" + ip;
		return this.doRemoteGet(url);
	}

	public String getAddrByIP(String ip) {
		String url = p.getProperty("HOST_NAME") + p.getProperty("SERVICE_PATH")
				+ p.getProperty("SERVICE_NAME_WEATHER") + "?"
				+ p.getProperty("SERVICE_NAME_WEATHER_PARAM") + "=" + ip;
		return this.doRemoteGet(url);
	}

	public Properties getProperties() {
		InputStream inputStream = this.getClass().getClassLoader()
				.getResourceAsStream(configFile);
		Properties p = new Properties();
		try {
			p.load(inputStream);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		return p;
	}

	private String doRemoteGet(String url) {
		String result = "";
		try {
			HttpClient client = new HttpClient();
			HttpMethod method = new GetMethod(url);
			client.executeMethod(method);
			if (method.getStatusCode() == HttpStatus.SC_OK) {
				result = method.getResponseBodyAsString();
			}
		} catch (Exception e) {
			log.error("call sayHello service error!");
			e.printStackTrace();
		}
		return result;
	}
}
