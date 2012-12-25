package com.zj198.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieOperateUtil {
	public static void addPartnerCookie(String referenceId, HttpServletResponse response){
		Cookie cookie = new Cookie(Constants.PNR_COOKIE_REFERENCE_NAME, referenceId);
        cookie.setMaxAge(60*60*24*3);
        cookie.setPath("/");
        response.addCookie(cookie);
	}
	public static String getPartnerCookie(HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        for(Cookie cookie : cookies)
        {
            if(cookie.getName().equals(Constants.PNR_COOKIE_REFERENCE_NAME))
            {
                return cookie.getValue();
            }
        }
        return null;
	}
}
