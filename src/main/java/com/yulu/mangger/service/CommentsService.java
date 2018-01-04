package com.yulu.mangger.service;

import com.yulu.mangger.bean.Comments;

import java.util.List;

public interface CommentsService {
    List<Comments> findCommentsList(Comments comments, int pageNum, int pageSize) throws Exception;

    Comments findCommentsId(int id) throws Exception;

    void delete_do(Integer id) throws Exception;

    int add_do(Comments comments) throws Exception;

}
