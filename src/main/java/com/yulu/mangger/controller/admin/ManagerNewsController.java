package com.yulu.mangger.controller.admin;

import com.yulu.mangger.bean.News;
import com.yulu.mangger.bean.Sort;
import com.yulu.mangger.service.NewsService;
import com.yulu.mangger.service.SortService;
import com.yulu.util.DataUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
// 定义该Controller的根访问路径 /news
@RequestMapping("/admin/news")
public class ManagerNewsController {
	// 注入UserService

	@Autowired
	@Qualifier("newsService")
	private NewsService newsService;

	@Autowired
	@Qualifier("sortService")
	private SortService sortService;



	// 显示添加新闻界面
	@RequestMapping("/add")
	public ModelAndView add() throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		List<Sort> sortlist = sortService.findSortList(null);
		modelAndView.addObject("sortlist", sortlist);
		modelAndView.setViewName("admin/news/admin_news_addAndedit");
		return modelAndView;
	}

	// 添加新闻
	@RequestMapping(value = "/add_do",method=RequestMethod.POST)
	public String add_do( String title,String digest,
			String contect, String fromto, String sort,Model model)
			throws Exception {
		Date date = new Date();
		SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String nowtime = time.format(date);
		News news = new News();
		news.setTitle(title);
		news.setDigest(digest);
		news.setContect(contect);
		news.setFromto(fromto);
		news.setFromuser("admin");
		news.setSort(DataUtils.parseInt(sort));
		news.setTime(nowtime);
		news.setIsdelete(0);
		newsService.add_do(news);
		return "forward:newslist";
	}

//
//	// 添加新闻
//	@RequestMapping(value="/add_do",method= RequestMethod.POST)
//	public String add_do(@RequestParam("title")String title,
//						 @RequestParam("contect")String contect, @RequestParam("fromto")String fromto,
//						 @RequestParam("sort")Integer sort, @RequestParam("isdelete")Integer isdelete)
//			throws Exception {
//		Date date = new Date();
//		SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		String nowtime = time.format(date);
//		News news = new News();
//		news.setTitle(title);
//		news.setContect(contect);
//		news.setFromto(fromto);
//		news.setFromuser("admin");
//		news.setSort(sort);
//		news.setTime(nowtime);
//		news.setIsdelete(0);
//		newsService.add_do(news);
//		return "forward:newslist";
//	}

	// 修改页面
	@RequestMapping("/edit")
	public ModelAndView edit(Integer id) throws Exception {
		// 创建返回的对象modeAndView
		ModelAndView modelAndView = new ModelAndView();
		// 将参数传入Service层进行处理
		List<Sort> sortlist = sortService.findSortList(null);
		modelAndView.addObject("sortlist", sortlist);
		News newsinf = newsService.findNewsById(id);
		modelAndView.addObject("newsinf", newsinf);
		// 返回到jsp显示
		modelAndView.setViewName("admin/news/admin_news_addAndedit");
		return modelAndView;
	}

	// 修改
	@RequestMapping("/edit_do")
	public String edit_do(HttpServletRequest request, Integer id, String title,
			String contect, String fromto, Integer sort, Integer isdelete)
			throws Exception {
		Date date = new Date();
		SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String nowtime = time.format(date);
		News news = new News();
		news.setId(id);
		news.setTitle(title);
		news.setContect(contect);
		news.setFromto(fromto);
		news.setFromuser("admin");
		news.setSort(sort);
		news.setTime(nowtime);
		news.setIsdelete(0);
		newsService.edit_do(news);
		return "forward:newslist";
	}

	// 删除
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Integer id)
			throws Exception {
		newsService.delete_do(id);
		return "forward:newslist";
	}
}
