package com.itheima.core.service;

import com.itheima.common.utils.Page;
import com.itheima.core.po.User;

/**
 * �û�Service��ӿ�
 */
public interface UserService {

	// ͨ���˺ź������ѯ�û�,��¼��
	public User findUser(String usercode, String password);

	// ͨ���˺Ų�ѯ�û�,ע����
	public User findUserByUsercode(String usercode);

	// ��ѯ���һ���û�,ע����
	public User findUserByFinal();

	// ע���û�
	public int createUser(User user);

	// ��ѯ�û��б�
	public Page<User> findUserList(Integer page, Integer rows, String userName, String userCode);

	// ͨ��id��ѯ�û�
	public User getUserById(Integer id);

	// �����û�
	public int updateUser(User user);

	// ɾ���û�
	public int deleteUser(Integer id);
}
