package com.yulu.mangger.service;


import com.yulu.mangger.bean.Collects;
import com.yulu.mangger.bean.User;

import java.util.List;

public interface CollectsService {
	public List<Collects> findCollectsList(Collects collects) throws Exception;

	public void delete_do(Integer id) throws Exception;

	public void add_do(Collects collects) throws Exception;
	public Collects findCollects(Collects mCollects) throws Exception;

}
