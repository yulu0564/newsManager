package com.yulu.mangger.constants;

public class AddressConstants {
    public static final String REDIRECT = "redirect";
    public static final String FORWARD = "forward:";


    public enum EnumCollect {
    }

    public enum EnumComment {
        LIST
    }



    public enum EnumNews {
        LIST, SEARCH_LIST, NEWS_INF, NEWS_DETAILS
    }

    public static String gerNewsURL(EnumNews enums) {
        StringBuffer url = new StringBuffer(NewsURL.NEWS);
        switch (enums) {
            case LIST:
                url.append(NewsURL.LIST);
                break;
            case SEARCH_LIST:
                url.append(NewsURL.SEARCH_LIST);
                break;
            case NEWS_INF:
                url.append(NewsURL.NEWS_INF);
                break;
            case NEWS_DETAILS:
                url.append(NewsURL.NEWS_DETAILS);
                break;
        }
        return url.toString();
    }

    public interface NewsURL {
        String NEWS = "/news";
        String LIST = "/list";
        String SEARCH_LIST = "/search_list";
        String NEWS_INF = "/news_inf";
        String NEWS_DETAILS = "/news_details";
    }

    public interface CollectURL {
        String COLLECT = "/collect";
    }

    public interface CommentURL {
        String COMMENT = "/comment";
        String LIST = "/list";
    }
    public enum EnumUser {
        USER, LOGIN, SIGNOUT, USER_INF, USER_INF_EDIT, COLLECT, COMMENT
    }
    public static String gerUserURL(EnumUser enums) {
        StringBuffer url = new StringBuffer(NewsURL.NEWS);
        switch (enums) {
            case USER:
                url.append(NewsURL.LIST);
                break;
            case LOGIN:
                url.append(NewsURL.SEARCH_LIST);
                break;
            case SIGNOUT:
                url.append(NewsURL.NEWS_INF);
                break;
            case USER_INF:
                url.append(NewsURL.NEWS_DETAILS);
                break;
            case USER_INF_EDIT:
                url.append(NewsURL.NEWS_DETAILS);
                break;
            case COLLECT:
                url.append(NewsURL.NEWS_DETAILS);
                break;
            case COMMENT:
                url.append(NewsURL.NEWS_DETAILS);
                break;
        }
        return url.toString();
    }
    public interface UserURL {
        String USER = "/user";
        String LOGIN = "/login";// 登录
        String SIGNOUT = "/userSignout";// 退出登录
        String USER_INF = "/user_inf";// 个人中心
        String USER_INF_EDIT = "/user_inf_edit";// 修改用户页面
        String COLLECT = "/user_collect";  // 我的收藏
        String COMMENT = "/user_comment"; // 我的评论
    }
}
