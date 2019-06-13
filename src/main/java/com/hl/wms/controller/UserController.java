package com.hl.wms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.hl.wms.domain.User;
import com.hl.wms.query.UserQuery;
import com.hl.wms.service.UserService;
import com.hl.wms.utils.JsonModel;

@Controller
@RequestMapping("/users")
public class UserController {

	@Autowired
	UserService userService;
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(){
		return "user/list";
	}
	
	@RequestMapping(value="",method=RequestMethod.GET)
	@ResponseBody
	public JsonModel<User> query(UserQuery userQuery){
		JsonModel<User> jsonModel = new JsonModel<User>();
		
		//封装了分页和查询信息
		
		PageInfo<User> pageInfo = userService.query(userQuery);
 		
		jsonModel.setSuccess(true);
		jsonModel.setRows(pageInfo.getList());
		jsonModel.setMsg("查找用户成功");
		
		jsonModel.setTotal(pageInfo.getTotal());
		return jsonModel;
	}
	
	/*@RequestMapping(value="",method=RequestMethod.GET)
	@ResponseBody
	public JsonModel<User> query(UserQuery userQuery){
		JsonModel<User> jsonModel = new JsonModel<User>();
		List<User> users = userService.query(userQuery);
		jsonModel.setSuccess(true);
		jsonModel.setRows(users);
		jsonModel.setMsg("查找用户成功");
		jsonModel.setTotal(users.size());
		return jsonModel;
	}*/
	
	@RequestMapping(value="/new",method=RequestMethod.GET)
	public String saveUI(){
		return "user/save";
	}
	
	
	@RequestMapping(value="",method=RequestMethod.POST)
	public String save(User user){
		boolean sign = userService.save(user);
		if(sign){
			return "redirect:users/list";
		}else{
			return null;
		}
	}
	
	@RequestMapping(value="/edit/{id}",method=RequestMethod.GET)
	public String editUI(@PathVariable("id") int id,Model model){
		User user= userService.findById(id);
		
		if(user==null){
		}
		model.addAttribute("user",user);
		return "user/edit";
	}
	
	@RequestMapping(value="/{id}",method=RequestMethod.PUT)
	public String update(User user){
		
		boolean sign = userService.update(user);
		if(sign){
			return "redirect:/users/list";
		}else{
			return null;
		}
	}
	
	
	/*@RequestMapping(value="/delete/{id}",method=RequestMethod.GET)
	public String delete(@PathVariable("id") int id){
		
		boolean sign = userService.delete(id);
		if(sign){
			return "redirect:/users/list";
		}else{
			return null;
		}
	}*/
	@RequestMapping(value="/delete/{ids}",method=RequestMethod.POST)
	public void delete(@PathVariable List<Integer> ids){
		userService.delete(ids);
	}
	
	
	
}
