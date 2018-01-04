package com.yulu.mangger.dao;

import com.yulu.mangger.bean.Sort;

import java.util.List;

public interface SortMapper {

	int deleteByPrimaryKey(Integer id);

	int insert(Sort record);

	int insertSelective(Sort record);

	Sort selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Sort record);

	int updateByPrimaryKey(Sort record);

	List<Sort> findSortList(Sort sort);

	Sort banById(Sort sort);

	Sort okById(Sort sort);
}