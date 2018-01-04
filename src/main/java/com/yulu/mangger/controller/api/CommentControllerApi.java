package com.yulu.mangger.controller.api;

import com.alibaba.fastjson.JSONObject;
import com.yulu.mangger.constants.ErrorCode;
import com.yulu.mangger.bean.Comments;
import com.yulu.mangger.bean.ResultBean;
import com.yulu.mangger.service.CommentsService;
import com.yulu.util.DataUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
// 定义该Controller的根访问路径 /comment
@RequestMapping("/comment/api")
public class CommentControllerApi {
    @Autowired
    @Qualifier("commentsService")
    private CommentsService commentsService;

    // 添加评论
    @RequestMapping(value = "/add_comments", method = RequestMethod.POST)
    public void add_comments(String newsid,
                             String userid, String contects, HttpServletResponse response) throws Exception {
        Date date = new Date();
        SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String nowtime = time.format(date);
        Comments comments = new Comments();
        comments.setUserid(Integer.parseInt(userid));
        comments.setNewsid(Integer.parseInt(newsid));
        comments.setContects(contects);
        comments.setTime(nowtime);
        comments.setIsdelete("0");
        int key = commentsService.add_do(comments);
        comments = commentsService.findCommentsId(key);
        ResultBean<Comments> mResultBean = new ResultBean<Comments>();
        response.setContentType("application/json; charset=utf-8");
        mResultBean.setMsg("评论成功");
        mResultBean.setCode(0);
        mResultBean.setData(comments);
        response.getWriter().println(JSONObject.toJSONString(mResultBean));
    }

    // 获取评论列表
    @RequestMapping("/comments_list_interface")
    public  void comments_list_interface(String newsid, String userid, HttpServletResponse response, @RequestParam(required = false, defaultValue = "1") int page,
                                        @RequestParam(required = false, defaultValue = "10") int rows) throws Exception {
        Comments comments = new Comments();
        if (!DataUtils.isNull(newsid)) {
            comments.setNewsid(DataUtils.parseInt(newsid));
        }
        if (!DataUtils.isNull(userid)) {
            comments.setUserid(DataUtils.parseInt(userid));
        }
        List<Comments> commentslist = commentsService
                .findCommentsList(comments, page, rows);
        ResultBean<List<Comments>> mResultBean = new ResultBean<List<Comments>>();
        response.setContentType("application/json; charset=utf-8");
        mResultBean.setMsg("评论列表");
        mResultBean.setCode(ErrorCode.SUCCESS);
        mResultBean.setData(commentslist);
        response.getWriter().println(JSONObject.toJSONString(mResultBean));
    }

    //删除评论
    @RequestMapping("/delete_do")
    public void delete_do(Integer id, HttpServletResponse response) throws Exception {
        commentsService.delete_do(id);
        ResultBean mResultBean = new ResultBean();
        response.setContentType("application/json; charset=utf-8");
        mResultBean.setMsg("删除成功");
        mResultBean.setCode(0);
        response.getWriter().println(JSONObject.toJSONString(mResultBean));
    }
}
