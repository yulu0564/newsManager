package com.yulu.mangger.controller.api;

import com.alibaba.fastjson.JSONObject;
import com.yulu.mangger.constants.ErrorCode;
import com.yulu.mangger.bean.News;
import com.yulu.mangger.bean.ResultBean;
import com.yulu.mangger.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
// 定义该Controller的根访问路径 /news
@RequestMapping("/news/api")
public class NewsControllerApi {
    // 注入UserService.
    @Autowired
    @Qualifier("newsService")
    private NewsService newsService;

    @RequestMapping("/list")
    public void news_list(HttpServletResponse response, Integer type, @RequestParam(required = false, defaultValue = "1") int page,
                          @RequestParam(required = false, defaultValue = "10") int rows)
            throws Exception {
        // 将参数传入Service层进行处理
        News news = new News();
        if (type != null && type != 0) {
            news.setSort(type);
        }
        List<News> newslist = newsService.findNewsList(news, page, rows);
        ResultBean<List<News>> mResultBean = new ResultBean<>();
        mResultBean.setData(newslist);
        mResultBean.setCode(ErrorCode.SUCCESS);
        response.setContentType("application/json; charset=utf-8");
        response.getWriter().println(JSONObject.toJSONString(mResultBean));
    }

}
