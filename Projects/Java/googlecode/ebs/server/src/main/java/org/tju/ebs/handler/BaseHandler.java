package org.tju.ebs.handler;

import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.util.List;

import javax.servlet.http.*;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.tju.ebs.utils.StringUtil;

public abstract class BaseHandler {
	// 成功信息
	private String SUCCESS_MSG = "\"success\":\"%b\"";
	// 返回客户端消息
	private String RESPONSE_MSG = "\"msg\":\"%s\"";
	// 记录数
	private String TOTAL_MSG = "\"total\":\"%d\"";
	// 数据项列表
	private String ITEM_MSG = "\"items\":%s";

	private PrintWriter pw;
	private ApplicationContext context;

	protected HttpServletRequest request;
	protected HttpServletResponse response;
	protected String type;
	protected String sessionId;
	protected String filter;

	public abstract void doQuery(String type, int pageNo, int pageSize, String filter);

	public BaseHandler(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		this.type = request.getParameter("type");
	}

	public void get() {
		type = request.getParameter("type");
		String pageNo = request.getParameter("page");
		String pageSize = request.getParameter("limit");
		String filter = request.getParameter("filter");

		if (StringUtil.isNull(pageNo)) {
			pageNo = "0";
		}

		if (StringUtil.isNull(pageSize)) {
			pageSize = "0";
		}

		if (!StringUtil.isNull(type)) {
			this.doQuery(type, Integer.parseInt(pageNo),
					Integer.parseInt(pageSize), filter);
		} else {
			this.response(false,
					"you didn't tell us the data type you wanted.", 0, "[]");
		}
	}

	protected void response(boolean success, String msg, int total, String items) {
		String result = "{%s}";
		this.SUCCESS_MSG = String.format(this.SUCCESS_MSG, success);
		this.TOTAL_MSG = String.format(this.TOTAL_MSG, total);
		this.RESPONSE_MSG = String.format(RESPONSE_MSG, msg);
		this.ITEM_MSG = String.format(ITEM_MSG, items);
		result = String.format(result, this.SUCCESS_MSG + ","
				+ this.RESPONSE_MSG + "," + this.TOTAL_MSG + ","
				+ this.ITEM_MSG);
		try {
			response.setContentType("text/html;charset=utf8");
			pw = response.getWriter();
			this.pw.write(result);
		} catch (Exception e) {

		}
	}

	protected Object getBean(String beanName, HttpServletRequest request) {
		this.context = WebApplicationContextUtils
				.getWebApplicationContext(request.getSession()
						.getServletContext());
		return this.context.getBean(beanName);
	}

	@SuppressWarnings("rawtypes")
	protected void response(Object service, String method, Class[] paramTypes,
			Object[] params) {
		try {
			Class<? extends Object> c = service.getClass();
			Method m = c.getMethod(method, paramTypes);
			List list = (List) m.invoke(service, params);
			String jsonItems = StringUtil.toJson(list);
			this.response(true, "got it", list.size(), jsonItems);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
