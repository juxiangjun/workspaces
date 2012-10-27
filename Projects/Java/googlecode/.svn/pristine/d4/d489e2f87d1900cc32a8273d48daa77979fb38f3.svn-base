package org.tju.ebs.resources;

public class Constants {

	public static class PUBLIC {
		public static String LOGIN_USER = "LOGIN_USER";
		public static String LOGIN_ORG_COMPANY = "LOGIN_ORG_COMPANY";

		public static String getProjectPath() {
			String s = System.getProperty("user.dir");
			s = s.substring(0, s.lastIndexOf("\\") + 1);
			return s + "webapps/ebs/";
		}

		public static String getClassPath() {
			return getProjectPath() + "WEB-INF/classes/";
		}
	}

	public static class ERROR {
		public static String AA = "";
	}

	public static class MEMCACHED {
		public static String SYS_OBJECT_PROPERTY_LIST = "SYS_OBJECT_PROPERTY_LIST";
		public static String ORG_DEPARTMENT_LIST_KEY = "_ORG_DEPARTMENT_LIST_KEY";
		public static String ORG_EMPLOYEE_LIST_DEPT = "_ORG_DEPARTMENT_LIST_DEPT";
		public static String ORG_EMPLOYEE_LIST_COMPANY = "_ORG_DEPARTMENT_LIST_COMPANY";
	}

	public static class DOMAIN_LIST {
		public static String ORG_DEPARTMENT_LIST = "_ORG_DEPARTMENT_LIST";
	}

	public static class VIEW {
		public static String MAIN_PANEL = "mainPanel";
	}

	public static class REPORT {
		private static String REPORT_TEMPLATE_PATH = "com/bz/ebs/server/report/template/";
		public static String SYS_COUNTRY = REPORT_TEMPLATE_PATH
				+ "sysCountry.jrxml";
	}

}
