package com.yulu.mangger.controller.api;

import com.alibaba.fastjson.JSONObject;
import com.yulu.mangger.constants.ErrorCode;
import com.yulu.mangger.bean.ResultBean;
import com.yulu.mangger.bean.User;
import com.yulu.mangger.service.CollectsService;
import com.yulu.mangger.service.CommentsService;
import com.yulu.mangger.service.UserService;
import com.yulu.util.DataUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
// 定义该Controller的根访问路径 /admin
@RequestMapping("/user")
public class UserControllerApi {
    // 注入UserService.
    @Autowired
    @Qualifier("userService")
    private UserService userService;

    @Autowired
    @Qualifier("commentsService")
    private CommentsService commentsService;

    @Autowired
    @Qualifier("collectsService")
    private CollectsService collectsService;

    // 登录
    @RequestMapping("/userLogin")
    public void userLogin(HttpSession session,
                          String username, String password,
                          HttpServletResponse response) throws Exception {
        ResultBean<User> mResultBean = new ResultBean<User>();
        response.setContentType("application/json; charset=utf-8");
        if (DataUtils.isNull(username)) {
            mResultBean.setCode(ErrorCode.LOGIN_NULL_USERNAME);
            mResultBean.setMsg(ErrorCode.getMsg(ErrorCode.LOGIN_NULL_USERNAME));
            response.getWriter().println(JSONObject.toJSONString(mResultBean));
            return;
        }
        if (DataUtils.isNull(password) || password.length() < 6) {
            mResultBean.setCode(ErrorCode.LOGIN_FORMAT_PASSWORD);
            mResultBean.setMsg(ErrorCode.getMsg(ErrorCode.LOGIN_FORMAT_PASSWORD));
            response.getWriter().println(JSONObject.toJSONString(mResultBean));
            return;
        }
        User r = userService.findLoginUser(username, password);
        if (r != null) {
            if (r.getIdent() == 0) {
                session.setAttribute("username", r.getUsername());
                session.setAttribute("userid", r.getId());
                session.setAttribute("nickname", r.getNickname());
                mResultBean.setData(r);
                mResultBean.setCode(ErrorCode.SUCCESS);
                mResultBean.setMsg(ErrorCode.getMsg(ErrorCode.SUCCESS));
                response.getWriter().println(JSONObject.toJSONString(mResultBean));
            } else {
                mResultBean.setCode(ErrorCode.LOGIN_USERNAME_OR_PASSWORD_ERROR);
                mResultBean.setMsg(ErrorCode.getMsg(ErrorCode.LOGIN_USERNAME_OR_PASSWORD_ERROR));
                response.getWriter().println(JSONObject.toJSONString(mResultBean));
                return;
            }
        } else {
            mResultBean.setCode(ErrorCode.LOGIN_USERNAME_OR_PASSWORD_ERROR);
            mResultBean.setMsg(ErrorCode.getMsg(ErrorCode.LOGIN_USERNAME_OR_PASSWORD_ERROR));
            response.getWriter().println(JSONObject.toJSONString(mResultBean));
            return;
        }
    }

    // 注册
    @RequestMapping("/register")
    public void register(HttpSession session,
                         String username, String password, Integer sex, String email,
                         String telephone, String nickname, String head_image, HttpServletResponse response) throws Exception {

        ResultBean<User> mResultBean = new ResultBean<User>();
        response.setContentType("application/json; charset=utf-8");
        if (DataUtils.isNull(username)) {
            mResultBean.setCode(ErrorCode.LOGIN_NULL_USERNAME);
            mResultBean.setMsg(ErrorCode.getMsg(ErrorCode.LOGIN_NULL_USERNAME));
            response.getWriter().println(JSONObject.toJSONString(mResultBean));
            return;
        }
        if (!getFormat(mResultBean, nickname, password, email, telephone, response)) {
            return;
        }
        User user = new User();
        user.setUsername(username);
        User r = userService.findLoginUser(user);
        if (r != null) {
            mResultBean.setCode(ErrorCode.LOGIN_EXIST_USERNAME);
            mResultBean.setMsg(ErrorCode.getMsg(ErrorCode.LOGIN_EXIST_USERNAME));
            response.getWriter().println(JSONObject.toJSONString(mResultBean));
            return;
        }
        user = new User();
        user.setTelephone(telephone);
        r = userService.findLoginUser(user);
        if (r != null) {
            mResultBean.setCode(ErrorCode.LOGIN_EXIST_PHONE);
            mResultBean.setMsg(ErrorCode.getMsg(ErrorCode.LOGIN_EXIST_PHONE));
            response.getWriter().println(JSONObject.toJSONString(mResultBean));
            return;
        }
        if (!DataUtils.isNull(email)) {
            user = new User();
            user.setEmail(email);
            r = userService.findLoginUser(user);
            if (r != null) {
                mResultBean.setCode(ErrorCode.LOGIN_EXIST_EMAIL);
                mResultBean.setMsg(ErrorCode.getMsg(ErrorCode.LOGIN_EXIST_EMAIL));
                response.getWriter().println(JSONObject.toJSONString(mResultBean));
                return;
            }
        }
        user.setUsername(username);
        user.setPassword(password);
        user.setSex(sex);
        user.setEmail(email);
        user.setTelephone(telephone);
        user.setIdent(0);
        user.setIsdelete(0);
        user.setCreateDate(new Date());
        user.setNickname(nickname);
        user.setHead_image(head_image);
        int userid = userService.add_do(user);
        mResultBean.setCode(ErrorCode.SUCCESS);
        mResultBean.setMsg(ErrorCode.getMsg(ErrorCode.SUCCESS));
        session.setAttribute("username", username);
        session.setAttribute("nickname", nickname);
        session.setAttribute("userid", userid);
        mResultBean.setCode(ErrorCode.SUCCESS);
        mResultBean.setMsg(ErrorCode.getMsg(ErrorCode.SUCCESS));
        mResultBean.setData(user);
        response.getWriter().println(JSONObject.toJSONString(mResultBean));
    }

    // 修改
    @RequestMapping("/user_inf_edit_do")
    public void user_inf_edit_do(HttpSession session,
                                 String nickname, String password, Integer sex, String email,
                                 String telephone, HttpServletResponse response) throws Exception {
        Integer id = (Integer) session.getAttribute("userid");
        User userinf = userService.findUserById(id);
        ResultBean<User> mResultBean = new ResultBean<User>();
        response.setContentType("application/json; charset=utf-8");
        if (!getFormat(mResultBean, nickname, password, email, telephone, response)) {
            return;
        }
        User user = new User();
        user.setTelephone(telephone);
        User r;
        if (!telephone.equals(userinf.getTelephone())) {
            r = userService.findLoginUser(user);
            if (r != null) {
                mResultBean.setCode(ErrorCode.LOGIN_EXIST_PHONE);
                mResultBean.setMsg(ErrorCode.getMsg(ErrorCode.LOGIN_EXIST_PHONE));
                response.getWriter().println(JSONObject.toJSONString(mResultBean));
                return;
            }
        }
        if (!email.equals(userinf.getEmail()) && !DataUtils.isNull(email)) {
            user = new User();
            user.setEmail(email);
            r = userService.findLoginUser(user);
            if (r != null) {
                mResultBean.setCode(ErrorCode.LOGIN_EXIST_EMAIL);
                mResultBean.setMsg(ErrorCode.getMsg(ErrorCode.LOGIN_EXIST_EMAIL));
                response.getWriter().println(JSONObject.toJSONString(mResultBean));
                return;
            }
        }
        user = new User();
        user.setId(id);
        user.setNickname(nickname);
        user.setPassword(password);
        user.setSex(sex);
        user.setEmail(email);
        user.setTelephone(telephone);
        user.setIdent(0);
        user.setIsdelete(0);
        userService.edit_do(user);
        mResultBean.setCode(ErrorCode.SUCCESS);
        mResultBean.setMsg(ErrorCode.getMsg(ErrorCode.SUCCESS));
        mResultBean.setData(user);
        response.getWriter().println(JSONObject.toJSONString(mResultBean));
    }

    private boolean getFormat(ResultBean mResultBean, String nickname, String password, String email,
                              String telephone, HttpServletResponse response) throws Exception {
        if (DataUtils.isNull(nickname)) {
            mResultBean.setCode(ErrorCode.LOGIN_FORMAT_PASSWORD);
            mResultBean.setMsg(ErrorCode.getMsg(ErrorCode.LOGIN_FORMAT_PASSWORD));
            response.getWriter().println(JSONObject.toJSONString(mResultBean));
            return false;
        }
        if (DataUtils.isNull(password) || password.length() < 6) {
            mResultBean.setCode(ErrorCode.LOGIN_FORMAT_PASSWORD);
            mResultBean.setMsg(ErrorCode.getMsg(ErrorCode.LOGIN_FORMAT_PASSWORD));
            response.getWriter().println(JSONObject.toJSONString(mResultBean));
            return false;
        }
        if (!DataUtils.isPhoneNUmber(telephone)) {
            mResultBean.setCode(ErrorCode.LOGIN_FORMAT_PHONE);
            mResultBean.setMsg(ErrorCode.getMsg(ErrorCode.LOGIN_FORMAT_PHONE));
            response.getWriter().println(JSONObject.toJSONString(mResultBean));
            return false;
        }
        if (!DataUtils.isNull(email) && !DataUtils.isEmail(email)) {
            mResultBean.setCode(ErrorCode.LOGIN_FORMAT_EMAIL);
            mResultBean.setMsg(ErrorCode.getMsg(ErrorCode.LOGIN_FORMAT_EMAIL));
            response.getWriter().println(JSONObject.toJSONString(mResultBean));
            return false;
        }
        return true;
    }
}
