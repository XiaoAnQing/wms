package com.hl.wms.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.hl.wms.domain.User;
import com.hl.wms.query.UserQuery;

public interface UserService {

	User login(String loginName,String password);

	PageInfo<User> query(UserQuery userQuery);

	boolean save(User user);

	User findById(int id);

	boolean update(User user);

	void delete(List<Integer> ids);
	
}
