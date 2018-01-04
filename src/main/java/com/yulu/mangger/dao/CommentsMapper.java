package com.yulu.mangger.dao;

import com.yulu.mangger.bean.Comments;
import java.util.List;

public interface CommentsMapper {

	int deleteByPrimaryKey(Integer id);

	int insert(Comments record);

	int insertSelective(Comments record);

	Comments selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Comments record);

	int updateByPrimaryKey(Comments record);

	List<Comments> findCommentsList(Comments comments);
	Comments findCommentsId(Integer id);
}