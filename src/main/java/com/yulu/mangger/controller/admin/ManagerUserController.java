package com.yulu.mangger.controller.admin;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.yulu.mangger.bean.User;
import com.yulu.mangger.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
// 定义该Controller的根访问路径 /admin
@RequestMapping("/admin/user")
public class ManagerUserController {
	// 注入UserService
	@Autowired
	@Qualifier("userService")
	private UserService userService;

	@RequestMapping("/userlist")
	public ModelAndView userlist(HttpServletRequest request, String serach)
			throws Exception {
		// 创建返回的对象modeAndView
		ModelAndView modelAndView = new ModelAndView();
		// 将参数传入Service层进行处理
		User user = new User();
		user.setUsername(serach);
		List<User> userList = userService.findUserList(user);
		// 将处理的结果封装到ModelAndView
		modelAndView.addObject("userList", userList);
		// 返回到jsp显示
		modelAndView.setViewName("admin/user/admin_user_list");
		return modelAndView;
	}

	// 显示添加用户界面
	@RequestMapping("/add")
	public String add() throws Exception {
		return "admin/user/admin_user_addAndedit";
	}

	// 添加用户
	@RequestMapping(value="/add_do",method= RequestMethod.POST )
	public String add_do(HttpServletRequest request, String username,
						 String password, Integer sex, String email, String telephone, String nickname, String head_image)
			throws Exception {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setSex(sex);
		user.setEmail(email);
		user.setTelephone(telephone);
		user.setIdent(0);
		user.setIsdelete(0);
		user.setStatus(0);
		user.setCreateDate(new Date());
		user.setNickname(nickname);
		user.setHead_image(head_image);
		userService.add_do(user);
		return "forward:userlist";
	}

	// 修改用户页面
	@RequestMapping("/edit")
	public ModelAndView edit(Integer id) throws Exception {
		// 创建返回的对象modeAndView
		ModelAndView modelAndView = new ModelAndView();
		// 将参数传入Service层进行处理
		User userinf = userService.findUserById(id);
		// 将处理的结果封装到ModelAndView
		modelAndView.addObject("userinf", userinf);
		// 返回到jsp显示
		modelAndView.setViewName("admin/user/admin_user_addAndedit");
		return modelAndView;
	}

	// 修改
	@RequestMapping("/edit_do")
	public String edit_do(HttpServletRequest request, Integer id,
			String username, String password, Integer sex, String email,
						  String telephone) throws Exception {
		User user = new User();
		user.setId(id);
		user.setUsername(username);
		user.setPassword(password);
		user.setSex(sex);
		user.setEmail(email);
		user.setTelephone(telephone);
		user.setIdent(0);
		user.setIsdelete(0);
		userService.edit_do(user);
		return "forward:userlist";
	}

	// 删除
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Integer id)
			throws Exception {
		userService.delete_do(id);
		return "forward:userlist";
	}

	// 冻结
	@RequestMapping("/ban")
	public String ban(HttpServletRequest request, Integer id) throws Exception {
		userService.ban_do(id);
		return "forward:userlist";
	}

	// 解冻
	@RequestMapping("/ok")
	public String ok(HttpServletRequest request, Integer id) throws Exception {
		userService.ok_do(id);
		return "forward:userlist";
	}
}
