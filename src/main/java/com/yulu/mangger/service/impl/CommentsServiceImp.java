package com.yulu.mangger.service.impl;

import com.github.pagehelper.PageHelper;
import com.yulu.mangger.bean.Comments;
import com.yulu.mangger.constants.ServiceConstants;
import com.yulu.mangger.dao.CommentsMapper;
import com.yulu.mangger.service.CommentsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
@Service(ServiceConstants.COMMENTS_SERVICE)
public class CommentsServiceImp implements CommentsService {
    @Resource
    private CommentsMapper commentsMapper;

    @Override
    public List<Comments> findCommentsList(Comments comments, int pageNum, int rows) throws Exception {
        PageHelper.startPage(pageNum, rows);
        return commentsMapper.findCommentsList(comments);
    }

    @Override
    public Comments findCommentsId(int id) throws Exception {
        return commentsMapper.findCommentsId(id);
    }


    @Override
    public void delete_do(Integer id) throws Exception {
        commentsMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int add_do(Comments comments) throws Exception {
        return commentsMapper.insertSelective(comments);
    }

}
