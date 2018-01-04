package com.yulu.mangger.service.impl;

import com.yulu.mangger.bean.Sort;
import com.yulu.mangger.constants.ServiceConstants;
import com.yulu.mangger.dao.SortMapper;
import com.yulu.mangger.service.SortService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
@Service(ServiceConstants.SORT_SERVICE)
public class SortServiceImp implements SortService {
    // 注入User
    @Resource
    private SortMapper sortmapper;

    @Override
    public List<Sort> findSortList(Sort sort) throws Exception {
        return sortmapper.findSortList(sort);
    }

    @Override
    public Sort findSortById(Integer id) throws Exception {
        return sortmapper.selectByPrimaryKey(id);
    }

    @Override
    public void edit_do(Sort sort) throws Exception {
        sortmapper.updateByPrimaryKeySelective(sort);
    }

    @Override
    public void delete_do(Integer id) throws Exception {
        sortmapper.deleteByPrimaryKey(id);
    }

    @Override
    public void add_do(Sort sort) throws Exception {
        sortmapper.insertSelective(sort);
    }

    @Override
    public void ban_do(Integer id) throws Exception {
        Sort sort = new Sort();
        sort.setId(id);
        sort.setIsdelete(1);
        sortmapper.banById(sort);
    }

    @Override
    public void ok_do(Integer id) throws Exception {
        Sort sort = new Sort();
        sort.setId(id);
        sort.setIsdelete(0);
        sortmapper.okById(sort);
    }
}
