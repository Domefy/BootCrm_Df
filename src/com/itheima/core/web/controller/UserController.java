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
 * 用户控制器类
 */
@Controller
public class UserController {
	// 依赖注入
	@Autowired
	private UserService userService;

	/**
	 * 用户登录
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(String usercode, String password, Model model, HttpSession session) {
		// 通过账号和密码查询用户
		User user = userService.findUser(usercode, password);
		if (user != null) {
			// 将用户对象添加到Session
			session.setAttribute("USER_SESSION", user);
			// 跳转到主页面
			/* return "customer"; */
			return "redirect:customer/list.action";// 让页面一进来就先查询的页面
		}
		model.addAttribute("msg", "账号或密码错误，请重新输入！");
		// 返回到登录页面
		return "login";
	}

	/**
	 * 向用户登陆页面跳转
	 */

	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public String toLogin() {
		return "login";
	}

	/**
	 * 注册,创建用户
	 */
	@RequestMapping("/register/create.action")
	@ResponseBody
	public String userRegister(User user, HttpSession session) {

		int rows = 0;
		// 根据usercode查询用户
		User finduser = userService.findUserByUsercode(user.getUser_code());
		if (finduser == null) {// 不存在該用戶，可以註冊該用戶
			// 获取最后一个用户
			User suser = userService.findUserByFinal();
			// 将最后一个用户id存储在用户对象中
			user.setUser_id(suser.getUser_id());

			// 执行Service层中的创建方法，返回的是受影响的行数
			rows = userService.createUser(user);// 註冊該用戶
		}

		if (rows > 0)// 註冊用戶成功
			return "OK";
		else
			return "Fail";

	}

	/**
	 * 创建用户
	 */
	@RequestMapping("/user/create.action")
	@ResponseBody
	public String userCreate(User user, HttpSession session) {

		int rows = 0;

		User finduser = userService.findUserByUsercode(user.getUser_code());
		if (finduser == null) {// 不存在該用戶，可以註冊該用戶
			// 获取Session中的当前用户信息
			User suser = (User) session.getAttribute("USER_SESSION");
			// 将当前用户id存储在用户对象中
			user.setUser_id(suser.getUser_id());

			// 执行Service层中的创建方法，返回的是受影响的行数
			rows = userService.createUser(user);// 註冊該用戶
		}

		if (rows > 0)// 註冊用戶成功
			return "OK";
		else
			return "Fail";

	}

	/**
	 * 模拟其他类中跳转到客户管理页面的方法
	 */

	@RequestMapping(value = "/toCustomer.action")
	public String toCustomer() {
		return "customer";
	}

	/**
	 * 退出登录
	 */

	@RequestMapping(value = "/logout.action")
	public String logout(HttpSession session) {
		// 清除Session
		session.invalidate();
		// 重定向到登录页面的跳转方法
		return "redirect:login.action";
	}

	/**
	 * 用户列表
	 */
	@RequestMapping(value = "/toUser/list.action")
	public String list(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows,
			String userName, String userCode, Model model) {
		// 条件查询所有客户
		Page<User> users = userService.findUserList(page, rows, userName, userCode);
		model.addAttribute("page", users);

		// 添加参数
		model.addAttribute("userCode", userCode);
		model.addAttribute("userName", userName);

		return "user";
	}

	/**
	 * 通过id获取用户信息
	 */
	@RequestMapping("/user/getUserById.action")
	@ResponseBody
	public User getUserById(Integer id) {

		User user = userService.getUserById(id);
		return user;
	}

	/**
	 * 更新用户
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
	 * 删除用户
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
