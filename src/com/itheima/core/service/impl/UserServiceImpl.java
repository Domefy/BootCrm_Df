package com.itheima.core.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itheima.common.utils.Page;
import com.itheima.core.dao.UserDao;
import com.itheima.core.po.User;
import com.itheima.core.service.UserService;

/**
 * 用户Service接口实现类
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
	// 注入UserDao
	@Autowired
	private UserDao userDao;

	// 通过账号和密码查询用户，登录
	@Override
	public User findUser(String usercode, String password) {
		User user = this.userDao.findUser(usercode, password);
		return user;
	}

	// 通过账号查询用户，注册
	@Override
	public User findUserByUsercode(String usercode) {
		User user = this.userDao.findUserByUsercode(usercode);
		return user;
	}

	// 查找用户表最后一条数据
	@Override
	public User findUserByFinal() {
		User user = this.userDao.findUserByFinal();
		return user;
	}

	/**
	 * 注册用户
	 */
	@Override
	public int createUser(User user) {
		return userDao.createUser(user);
	}

	// 查找用户列表
	@Override
	public Page<User> findUserList(Integer page, Integer rows, String userName, String userCode) {
		// TODO Auto-generated method stub
		// 创建用户对象
		User user = new User();
		// 判断用户名称
		if (StringUtils.isNotBlank(userName))
			user.setUser_name(userName);

		// 判断用户账号
		if (StringUtils.isNotBlank(userCode))
			user.setUser_code(userCode);

		// 当前页
		user.setStart((page - 1) * rows);
		// 每页数
		user.setRows(rows);
		// 查询用户列表
		List<User> users = userDao.selectUserList(user);
		// 查询用户列表总记录数
		Integer count = userDao.selectUserListCount(user);
		// 创建Page返回对象
		Page<User> result = new Page<>();
		result.setPage(page);
		result.setRows(users);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

	/**
	 * 通过id查询用户
	 */
	@Override
	public User getUserById(Integer id) {
		User user = userDao.getUserById(id);
		return user;
	}

	/**
	 * 更新用户
	 */
	@Override
	public int updateUser(User user) {
		return userDao.updateUser(user);
	}

	/**
	 * 删除用户
	 */
	@Override
	public int deleteUser(Integer id) {
		return userDao.deleteUser(id);
	}

}
