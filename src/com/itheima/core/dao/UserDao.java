package com.itheima.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itheima.core.po.User;

/**
 * �û�DAO��ӿ�
 */
public interface UserDao {

	/**
	 * ͨ���˺ź������ѯ�û�����¼
	 */
	public User findUser(@Param("usercode") String usercode, @Param("password") String password);

	/**
	 * ͨ���˺Ų�ѯ�û���ע��
	 */
	public User findUserByUsercode(@Param("usercode") String usercode);

	/**
	 * ��ѯ���һ�����ݣ���ȡ����������ע��
	 */
	public User findUserByFinal();

	// ע��,ע���û�
	public int createUser(User user);

	// �û��б�
	public List<User> selectUserList(User user);

	// �û���
	public Integer selectUserListCount(User user);

	// ͨ��id��ѯ�û�
	public User getUserById(Integer id);

	// �����û���Ϣ
	public int updateUser(User user);

	// ɾ���ͻ��û�
	public int deleteUser(Integer id);

}
