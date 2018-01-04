package com.yulu.mangger.controller.admin;

import com.yulu.mangger.bean.Sort;
import com.yulu.mangger.service.SortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
// 定义该Controller的根访问路径 /sort
@RequestMapping("/admin/sort")
public class ManagerSortController {

	@Autowired
	@Qualifier("sortService")
	private SortService sortService;

	@RequestMapping("/sortlist")
	public ModelAndView sortlist(HttpServletRequest request, String serach)
			throws Exception {
		// 创建返回的对象modeAndView
		ModelAndView modelAndView = new ModelAndView();

		Sort sort = new Sort();
		sort.setSortname(serach);
		List<Sort> sortlist = sortService.findSortList(sort);
		modelAndView.addObject("sortlist", sortlist);
		// 返回到jsp显示
		modelAndView.setViewName("admin/sort/admin_sort_list");
		return modelAndView;
	}

	// 显示添加新闻界面
	@RequestMapping("/add")
	public String add() throws Exception {
		return "admin/sort/admin_sort_addAndedit";
	}

	// 添加新闻
	@RequestMapping("/add_do")
	public String add_do(HttpServletRequest request, String sortname,
			String description, Integer isdelete) throws Exception {
		Sort sort = new Sort();
		sort.setSortname(sortname);
		sort.setDescription(description);
		sort.setIsdelete(0);
		sortService.add_do(sort);
		return "forward:sortlist.action";
	}

	// 修改页面
	@RequestMapping("/edit")
	public ModelAndView edit(Integer id) throws Exception {
		// 创建返回的对象modeAndView
		ModelAndView modelAndView = new ModelAndView();
		// 将参数传入Service层进行处理
		Sort sortinf = sortService.findSortById(id);
		// 将处理的结果封装到ModelAndView
		modelAndView.addObject("sortinf", sortinf);
		// 返回到jsp显示
		modelAndView.setViewName("admin/sort/admin_sort_addAndedit");
		return modelAndView;
	}

	// 修改
	@RequestMapping("/edit_do")
	public String edit_do(HttpServletRequest request, Integer id,
			String sortname, String description, Integer isdelete)
			throws Exception {
		Sort sort = new Sort();
		sort.setId(id);
		sort.setSortname(sortname);
		sort.setDescription(description);
		sort.setIsdelete(0);
		sortService.edit_do(sort);
		return "forward:sortlist.action";
	}

	// 删除
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Integer id)
			throws Exception {
		sortService.delete_do(id);
		return "forward:sortlist.action";
	}

	// 冻结
	@RequestMapping("/ban")
	public String ban(HttpServletRequest request, Integer id) throws Exception {
		sortService.ban_do(id);
		return "forward:sortlist.action";
	}

	// 解冻
	@RequestMapping("/ok")
	public String ok(HttpServletRequest request, Integer id) throws Exception {
		sortService.ok_do(id);
		return "forward:sortlist.action";
	}
}
