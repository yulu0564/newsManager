package com.yulu.mangger.service.impl;

import com.yulu.mangger.bean.User;
import com.yulu.mangger.constants.ServiceConstants;
import com.yulu.mangger.dao.UserMapper;
import com.yulu.mangger.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Description: 服务层接口实现类
 */
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
@Service(ServiceConstants.USER_SERVICE)
public class UserServiceImp implements UserService {

    // 注入User
    @Autowired
    private UserMapper usermapper;

    @Override
    public List<User> findUserList(User user) throws Exception {
        // TODO Auto-generated method stub
        return usermapper.findUserList(user);
    }

    @Override
    public User findUserById(Integer id) throws Exception {
        // TODO Auto-generated method stub
        return usermapper.selectByPrimaryKey(id);
    }

    @Override
    public void edit_do(User user) throws Exception {
        // TODO Auto-generated method stub
        usermapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public void delete_do(Integer id) throws Exception {
        // TODO Auto-generated method stub
        usermapper.deleteByPrimaryKey(id);
    }

    @Override
    public int add_do(User user) throws Exception {
        // TODO Auto-generated method stub
        return usermapper.insertSelective(user);
    }

    @Override
    public User findLoginUser(String username, String password)
            throws Exception {
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        return usermapper.findLoginUser(user);
    }

    @Override
    public User findLoginUser(User user) throws Exception {
        return usermapper.findUser(user);
    }

    @Override
    public void ban_do(Integer id) throws Exception {
        User user = new User();
        user.setId(id);
        user.setIsdelete(1);
        usermapper.banById(user);
    }

    @Override
    public void ok_do(Integer id) throws Exception {
        User user = new User();
        user.setId(id);
        user.setIsdelete(0);
        usermapper.okById(user);
    }
}
