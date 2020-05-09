package com.itheima.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itheima.core.po.User;

/**
 * 用户DAO层接口
 */
public interface UserDao {

	/**
	 * 通过账号和密码查询用户，登录
	 */
	public User findUser(@Param("usercode") String usercode, @Param("password") String password);

	/**
	 * 通过账号查询用户，注册
	 */
	public User findUserByUsercode(@Param("usercode") String usercode);

	/**
	 * 查询最后一条数据，获取主键，用于注册
	 */
	public User findUserByFinal();

	// 注册,注册用户
	public int createUser(User user);

	// 用户列表
	public List<User> selectUserList(User user);

	// 用户数
	public Integer selectUserListCount(User user);

	// 通过id查询用户
	public User getUserById(Integer id);

	// 更新用户信息
	public int updateUser(User user);

	// 删除客户用户
	public int deleteUser(Integer id);

}
