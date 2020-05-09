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
 * �û�Service�ӿ�ʵ����
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
	// ע��UserDao
	@Autowired
	private UserDao userDao;

	// ͨ���˺ź������ѯ�û�����¼
	@Override
	public User findUser(String usercode, String password) {
		User user = this.userDao.findUser(usercode, password);
		return user;
	}

	// ͨ���˺Ų�ѯ�û���ע��
	@Override
	public User findUserByUsercode(String usercode) {
		User user = this.userDao.findUserByUsercode(usercode);
		return user;
	}

	// �����û������һ������
	@Override
	public User findUserByFinal() {
		User user = this.userDao.findUserByFinal();
		return user;
	}

	/**
	 * ע���û�
	 */
	@Override
	public int createUser(User user) {
		return userDao.createUser(user);
	}

	// �����û��б�
	@Override
	public Page<User> findUserList(Integer page, Integer rows, String userName, String userCode) {
		// TODO Auto-generated method stub
		// �����û�����
		User user = new User();
		// �ж��û�����
		if (StringUtils.isNotBlank(userName))
			user.setUser_name(userName);

		// �ж��û��˺�
		if (StringUtils.isNotBlank(userCode))
			user.setUser_code(userCode);

		// ��ǰҳ
		user.setStart((page - 1) * rows);
		// ÿҳ��
		user.setRows(rows);
		// ��ѯ�û��б�
		List<User> users = userDao.selectUserList(user);
		// ��ѯ�û��б��ܼ�¼��
		Integer count = userDao.selectUserListCount(user);
		// ����Page���ض���
		Page<User> result = new Page<>();
		result.setPage(page);
		result.setRows(users);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

	/**
	 * ͨ��id��ѯ�û�
	 */
	@Override
	public User getUserById(Integer id) {
		User user = userDao.getUserById(id);
		return user;
	}

	/**
	 * �����û�
	 */
	@Override
	public int updateUser(User user) {
		return userDao.updateUser(user);
	}

	/**
	 * ɾ���û�
	 */
	@Override
	public int deleteUser(Integer id) {
		return userDao.deleteUser(id);
	}

}
