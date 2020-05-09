package com.itheima.core.service;

import com.itheima.common.utils.Page;
import com.itheima.core.po.User;

/**
 * 用户Service层接口
 */
public interface UserService {

	// 通过账号和密码查询用户,登录用
	public User findUser(String usercode, String password);

	// 通过账号查询用户,注册用
	public User findUserByUsercode(String usercode);

	// 查询最后一个用户,注册用
	public User findUserByFinal();

	// 注册用户
	public int createUser(User user);

	// 查询用户列表
	public Page<User> findUserList(Integer page, Integer rows, String userName, String userCode);

	// 通过id查询用户
	public User getUserById(Integer id);

	// 更新用户
	public int updateUser(User user);

	// 删除用户
	public int deleteUser(Integer id);
}
