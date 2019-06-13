package com.hl.wms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.pagehelper.PageInfo;
import com.hl.wms.domain.User;
import com.hl.wms.query.UserQuery;

public interface UserMapper {

	User login(@Param("loginName") String loginName,@Param("password")String password);

	List<User> query(UserQuery userQuery);

	int save(User user);

	User findById(int userId);

	int update(User user);

	void delete(List<Integer> ids);
	
}
