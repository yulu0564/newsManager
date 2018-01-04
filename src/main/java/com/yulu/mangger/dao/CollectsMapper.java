package com.yulu.mangger.dao;

import com.yulu.mangger.bean.Collects;

import java.util.List;

public interface CollectsMapper {

	int deleteByPrimaryKey(Integer id);

	int insert(Collects record);

	int insertSelective(Collects record);

	Collects selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Collects record);

	int updateByPrimaryKey(Collects record);

	List<Collects> findCollectsList(Collects collects);
	Collects findCollects(Collects collects);
}