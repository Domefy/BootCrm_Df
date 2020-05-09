package com.itheima.core.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itheima.common.utils.Page;
import com.itheima.core.po.User;
import com.itheima.core.service.UserService;

/**
 * �û���������
 */
@Controller
public class UserController {
	// ����ע��
	@Autowired
	private UserService userService;

	/**
	 * �û���¼
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(String usercode, String password, Model model, HttpSession session) {
		// ͨ���˺ź������ѯ�û�
		User user = userService.findUser(usercode, password);
		if (user != null) {
			// ���û�������ӵ�Session
			session.setAttribute("USER_SESSION", user);
			// ��ת����ҳ��
			/* return "customer"; */
			return "redirect:customer/list.action";// ��ҳ��һ�������Ȳ�ѯ��ҳ��
		}
		model.addAttribute("msg", "�˺Ż�����������������룡");
		// ���ص���¼ҳ��
		return "login";
	}

	/**
	 * ���û���½ҳ����ת
	 */

	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public String toLogin() {
		return "login";
	}

	/**
	 * ע��,�����û�
	 */
	@RequestMapping("/register/create.action")
	@ResponseBody
	public String userRegister(User user, HttpSession session) {

		int rows = 0;
		// ����usercode��ѯ�û�
		User finduser = userService.findUserByUsercode(user.getUser_code());
		if (finduser == null) {// ������ԓ�Ñ��������]��ԓ�Ñ�
			// ��ȡ���һ���û�
			User suser = userService.findUserByFinal();
			// �����һ���û�id�洢���û�������
			user.setUser_id(suser.getUser_id());

			// ִ��Service���еĴ������������ص�����Ӱ�������
			rows = userService.createUser(user);// �]��ԓ�Ñ�
		}

		if (rows > 0)// �]���Ñ��ɹ�
			return "OK";
		else
			return "Fail";

	}

	/**
	 * �����û�
	 */
	@RequestMapping("/user/create.action")
	@ResponseBody
	public String userCreate(User user, HttpSession session) {

		int rows = 0;

		User finduser = userService.findUserByUsercode(user.getUser_code());
		if (finduser == null) {// ������ԓ�Ñ��������]��ԓ�Ñ�
			// ��ȡSession�еĵ�ǰ�û���Ϣ
			User suser = (User) session.getAttribute("USER_SESSION");
			// ����ǰ�û�id�洢���û�������
			user.setUser_id(suser.getUser_id());

			// ִ��Service���еĴ������������ص�����Ӱ�������
			rows = userService.createUser(user);// �]��ԓ�Ñ�
		}

		if (rows > 0)// �]���Ñ��ɹ�
			return "OK";
		else
			return "Fail";

	}

	/**
	 * ģ������������ת���ͻ�����ҳ��ķ���
	 */

	@RequestMapping(value = "/toCustomer.action")
	public String toCustomer() {
		return "customer";
	}

	/**
	 * �˳���¼
	 */

	@RequestMapping(value = "/logout.action")
	public String logout(HttpSession session) {
		// ���Session
		session.invalidate();
		// �ض��򵽵�¼ҳ�����ת����
		return "redirect:login.action";
	}

	/**
	 * �û��б�
	 */
	@RequestMapping(value = "/toUser/list.action")
	public String list(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows,
			String userName, String userCode, Model model) {
		// ������ѯ���пͻ�
		Page<User> users = userService.findUserList(page, rows, userName, userCode);
		model.addAttribute("page", users);

		// ��Ӳ���
		model.addAttribute("userCode", userCode);
		model.addAttribute("userName", userName);

		return "user";
	}

	/**
	 * ͨ��id��ȡ�û���Ϣ
	 */
	@RequestMapping("/user/getUserById.action")
	@ResponseBody
	public User getUserById(Integer id) {

		User user = userService.getUserById(id);
		return user;
	}

	/**
	 * �����û�
	 */
	@RequestMapping("/user/update.action")
	@ResponseBody
	public String userUpdate(User user) {
		int rows = userService.updateUser(user);
		if (rows > 0)
			return "OK";
		else
			return "Fail";
	}

	/**
	 * ɾ���û�
	 */
	@RequestMapping("/user/delete.action")
	@ResponseBody
	public String userDelete(Integer id) {
		int rows = userService.deleteUser(id);
		if (rows > 0)
			return "OK";
		else
			return "Fail";
	}

}
