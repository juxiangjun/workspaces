package org.tju.ebs.handler;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/gateway/{pkg}/{handler}/{method}")
public class Gateway {

	@RequestMapping
	public void handle(@PathVariable String pkg, @PathVariable String handler,
			@PathVariable String method, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String className = "org.tju.ebs.handler." + pkg + "." + handler
					+ "Handler";
			Class<?> c = Class.forName(className);
			Constructor<?> constructor = c.getConstructor(
					HttpServletRequest.class, HttpServletResponse.class);
			Method m = c.getMethod(method);
			m.invoke(constructor.newInstance(request, response));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
