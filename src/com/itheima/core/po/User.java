package com.itheima.core.po;

import java.io.Serializable;

/**
 * �û��־û���
 */
public class User implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer user_id; // �û�id
	private String user_code; // �û��˺�
	private String user_name; // �û�����
	private String user_password; // �û�����
	private Integer user_state; // �û�״̬

	private Integer start; // ��ʼ��
	private Integer rows; // ��ȡ����

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public String getUser_code() {
		return user_code;
	}

	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public Integer getUser_state() {
		return user_state;
	}

	public void setUser_state(Integer user_state) {
		this.user_state = user_state;
	}
}
