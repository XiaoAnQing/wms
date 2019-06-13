package com.hl.wms.interceptor;

import java.net.URLDecoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hl.wms.domain.User;
import com.hl.wms.service.UserService;


public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	UserService userService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		
		if(session.getAttribute("user")==null){
			String requestURI = request.getRequestURI();
			if("/wms/login".equals(requestURI)){
				return true;
			}else{
				//自动登录
				//1.先获取浏览器的cookie，然后遍历找到（autoLoginCookie）
				//2.判断autoLoginCookie是否为空，不为空，获取login Name，password
				//3.传入user的loginName,password
				Cookie autoLoginCookie = null;
				
				Cookie [] cookies = request.getCookies();
				
				if(cookies!=null){
					for(Cookie cookie : cookies){
						if(cookie.getName().equals("autoLoginInfo")){
							autoLoginCookie  = cookie;
							break;
						}
					}
					if(autoLoginCookie!=null){
						String autoLoginInfo = URLDecoder.decode(autoLoginCookie.getValue(),"UTF-8");
						
						if(!StringUtils.isEmpty(autoLoginInfo)){
							String loginName = autoLoginInfo.split(";")[0];
							String password = autoLoginInfo.split(";")[0];

							
							User user  = userService.login(loginName, password);
							if(user==null){
								autoLoginCookie.setMaxAge(0);
								response.addCookie(autoLoginCookie);
								response.sendRedirect(request.getContextPath()+"/login");
								return false;
							}else{
								autoLoginCookie.setMaxAge(1*24*60*60);
								response.addCookie(autoLoginCookie);
								session.setAttribute("user",user);
								response.sendRedirect(request.getContextPath());
								return false;
							}
							
						}
					}
				}
			}
			response.sendRedirect(request.getContextPath()+"/login");
			return false;
		}else{
			//判断是不是又来登录
			String requestURI = request.getRequestURI();
			if("/wms/login".equals(requestURI)){
				response.sendRedirect(request.getContextPath()+"/");
				return false;
			}
		}
		return true;
	}
	
}
