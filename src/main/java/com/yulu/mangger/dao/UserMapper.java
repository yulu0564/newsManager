package com.yulu.mangger.dao;

import java.util.List;

import com.yulu.mangger.bean.User;

public interface UserMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    List<User> findUserList(User user);

    User findUser(User user);

    User findLoginUser(User user);
    
    User banById(User user);
    
    User okById(User user);
}