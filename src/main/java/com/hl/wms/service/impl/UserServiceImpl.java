package com.hl.wms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hl.wms.dao.UserMapper;
import com.hl.wms.domain.User;
import com.hl.wms.query.UserQuery;
import com.hl.wms.service.UserService;


@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper userMapper;
	
	@Override
	public User login(String loginName, String password) {
		return userMapper.login(loginName, password);
	}

	@Override
	public PageInfo<User> query(UserQuery userQuery) {
		
		PageHelper.startPage(userQuery.getPageNum(),userQuery.getPageSize());
		
		Page<User> page = (Page<User>) userMapper.query(userQuery);
		
		PageInfo<User> pageInfo = page.toPageInfo();
		
		return pageInfo;
	}

	@Override
	public boolean save(User user) {
		user.setPassword("123456");
		return userMapper.save(user)==1;
	}

	@Override
	public User findById(int userId) {
		return userMapper.findById(userId);
	}

	@Override
	public boolean update(User user) {
		user.setPassword(null);
		return userMapper.update(user)==1;
	}

	@Override
	public void delete(List<Integer> ids) {
		userMapper.delete(ids);
	}

}
