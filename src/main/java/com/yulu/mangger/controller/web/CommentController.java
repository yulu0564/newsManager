package com.yulu.mangger.controller.web;

import com.github.pagehelper.PageInfo;
import com.yulu.mangger.bean.*;
import com.yulu.mangger.service.CommentsService;
import com.yulu.util.DataUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.yulu.mangger.constants.AddressConstants.CommentURL;
import java.util.List;

@Controller
// 定义该Controller的根访问路径 /comment
@RequestMapping(CommentURL.COMMENT)
public class CommentController {
    @Autowired
    @Qualifier("commentsService")
    private CommentsService commentsService;

    @RequestMapping(CommentURL.LIST)
    public ModelAndView comments_list(String newsid, String userid, @RequestParam(required = false, defaultValue = "1") int page,
                                      @RequestParam(required = false, defaultValue = "10") int rows)
            throws Exception {
        // 创建返回的对象modeAndView
        ModelAndView modelAndView = new ModelAndView();
        Comments comments = new Comments();
        if (!DataUtils.isNull(newsid)) {
            comments.setNewsid(DataUtils.parseInt(newsid));
        }
        if (!DataUtils.isNull(userid)) {
            comments.setUserid(DataUtils.parseInt(userid));
        }
        List<Comments> commentslist = commentsService
                .findCommentsList(comments, 1, 2);
        PageInfo<Comments> p = new PageInfo<Comments>(commentslist);
        modelAndView.addObject("commentslist", commentslist);
        modelAndView.addObject("pageNum", p.getPageNum());
        // 返回到jsp显示
//		modelAndView.setViewName("comment/comments_list");
        modelAndView.setViewName("user/user_comment");
        return modelAndView;
    }
}
