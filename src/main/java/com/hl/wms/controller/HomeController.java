package com.hl.wms.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hl.wms.domain.User;
import com.hl.wms.service.UserService;

@Controller
@RequestMapping("/")
public class HomeController {

	@Autowired
	UserService userService;
	
	@RequestMapping(value="",method=RequestMethod.GET)
	public String index(){
		return "index";
	}
	
	@RequestMapping(value="login",method=RequestMethod.GET)
	public String loginUI(){
		return "login";
	}
	
	@RequestMapping(value="logout",method=RequestMethod.GET)
	public String loginOut(HttpSession session){
		session.invalidate();
		return "login";
	}
	
	@RequestMapping(value="login",method=RequestMethod.POST)
	public String login(String loginName,String password,Model model,HttpSession session,String autoLogin,HttpServletResponse response){
		User user = userService.login(loginName, password);
		if(user==null){
			model.addAttribute("errorMsg","账号或密码错误");
			return "login";
		}else{
			//自动登录
			if("1".equals(autoLogin)){
				String  autoLoginInfo = loginName+","+password;
				Cookie cookie;
				try {
					cookie = new Cookie("autoLoginInfo",URLEncoder.encode(autoLoginInfo,"utf-8"));
					cookie.setMaxAge(1*24*60*60);
					response.addCookie(cookie);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
			//登录成功重定向到登录界面
			session.setAttribute("user",user);
			return "redirect:/";
		}
		
	}
	
	
	
	
	
}
