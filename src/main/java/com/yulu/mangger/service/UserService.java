package com.yulu.mangger.service;

import com.yulu.mangger.bean.User;
import java.util.List;

/**
 * @Description: 服务层接口
 */
public interface UserService {

    public List<User> findUserList(User user) throws Exception;

    public User findUserById(Integer id) throws Exception;

    public void edit_do(User user) throws Exception;

    public void delete_do(Integer id) throws Exception;

    public void ban_do(Integer id) throws Exception;

    public void ok_do(Integer id) throws Exception;

    public int add_do(User user) throws Exception;

    public User findLoginUser(String username, String password)
            throws Exception;
    public User findLoginUser(User user) throws Exception;
}