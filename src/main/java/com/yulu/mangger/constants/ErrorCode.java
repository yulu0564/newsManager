package com.yulu.mangger.constants;

/**
 * 错误码
 */
public class ErrorCode {
    public static final int SUCCESS = 0;

    public static final int LOGIN_EXIST_USERNAME = 10001;// username已经存在
    public static final int LOGIN_EXIST_PHONE = 10002;// 手机号已经存在
    public static final int LOGIN_NULL_USERNAME = 10003;// username为空
    public static final int LOGIN_FORMAT_PHONE =  10004;// 手机号格式不正确
    public static final int LOGIN_FORMAT_EMAIL = 10005; //邮箱格式不正确
    public static final int LOGIN_EXIST_EMAIL = 10006; //邮箱已经存在
    public static final int LOGIN_FORMAT_PASSWORD = 10007; //密码格式不正确
    public static final int LOGIN_NOT_LOGIN= 10008; //未登录
    public static final int LOGIN_USERNAME_OR_PASSWORD_ERROR = 10009; //用户名或密码错误

    public static final int COLLECT_SAVE_ALREADY  = 20001;//文章已经保存
    public static final int COLLECT_NOT_COLLECT = 20002;//该用户未收藏
    public static String getMsg(int code) {
        switch (code) {
            case SUCCESS:
                return "请求成功！";
            /*用户注册登录部分*/
            case LOGIN_EXIST_USERNAME:
                return "用户名已存在！";
            case LOGIN_EXIST_PHONE:
                return "手机号已存在！";
            case LOGIN_NULL_USERNAME:
                return "username为空！";
            case LOGIN_FORMAT_PHONE:
                return "手机号格式不正确！";
            case LOGIN_FORMAT_EMAIL:
                return "邮箱格式不正确！";
            case LOGIN_EXIST_EMAIL:
                return "邮箱已经存在！";
            case LOGIN_FORMAT_PASSWORD:
                return "密码格式不正确！";
            case LOGIN_NOT_LOGIN:
                return "未登录！";
            case LOGIN_USERNAME_OR_PASSWORD_ERROR:
                return "用户名或密码错误！";
            case COLLECT_SAVE_ALREADY:
                return "文章已经保存！";
            case COLLECT_NOT_COLLECT:
                return "该用户未收藏！";

        }
        return null;
    }

    public static final int ISSUSE_FRIEND_NO_FRIEND = 1401;
    public static final int ISSUSE_FRIEND_SAVE_FAILD = 140103;
//    public static final int ISSUSE_FRIEND_CANCEL_FAILD = 140104;
//    public static final int ISSUSE_FRIEND_ALREADY = 140107;

    public static final int ISSUSE_FRIEND_NO_USER = 140101;
    public static final int ISSUSE_FRIEND_NO_STOCK = 140102;

    public static final int ISSUSE_STOCK_SAVE_FAILD = 140105;
//    public static final int ISSUSE_STOCK_CANCEL_FAILD = 140106;
//    public static final int ISSUSE_STOCK_ALREADY = 140108;

    //关注
}
