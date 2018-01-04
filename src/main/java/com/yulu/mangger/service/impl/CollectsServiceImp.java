package com.yulu.mangger.service.impl;

import com.yulu.mangger.bean.Collects;
import com.yulu.mangger.constants.ServiceConstants;
import com.yulu.mangger.dao.CollectsMapper;
import com.yulu.mangger.service.CollectsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
@Service(ServiceConstants.COLLECTS_SERVICE)
public class CollectsServiceImp implements CollectsService {
	// 注入Mapper
	@Resource
	private CollectsMapper collectsMapper;

	@Override
	public List<Collects> findCollectsList(Collects collects) throws Exception {
		return collectsMapper.findCollectsList(collects);
	}

	@Override
	public void delete_do(Integer id) throws Exception {
		collectsMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void add_do(Collects collects) throws Exception {
		collectsMapper.insertSelective(collects);
	}

	@Override
	public Collects findCollects(Collects mCollects ) throws Exception {
		return collectsMapper.findCollects(mCollects);
	}

}
