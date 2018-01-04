package com.yulu.util;

import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 字符串工具类
 */
public class DataUtils {

    /**
     * 用正则表达式判断字符串是否为数字
     */
    public static boolean isNumeric(String str) {
        if (isNull(str)) {
            return false;
        }
        Pattern pattern = Pattern.compile("[0-9]*");
        return pattern.matcher(str).matches();
    }

    /**
     * 是否为手机号
     */
    public static boolean isPhoneNUmber(String str) {
        String mobileNumber = str;
        // 去掉86，+86开头
        if (mobileNumber.startsWith("86")) {
            mobileNumber = mobileNumber.substring(2);
        }
        if (mobileNumber.startsWith("+86")) {
            mobileNumber = mobileNumber.substring(3);
        }
        // 清除空格
        mobileNumber.replace(" ", "");
        if (mobileNumber.length() == 11) {
            Pattern pattern = Pattern
                    .compile("^((13[0-9])|14[5,7]|(15[^4,\\D])|(17[0-9])|(18[0-9]))\\d{8}$");
            return pattern.matcher(str).matches();
        } else {
            return false;
        }

    }

    /**
     *邮箱是否合法
     */
    public static boolean isEmail(String string) {
        if (string == null)
            return false;
        String regEx1 = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
        Pattern p;
        Matcher m;
        p = Pattern.compile(regEx1);
        m = p.matcher(string);
        if (m.matches())
            return true;
        else
            return false;
    }
    /**
     * 判断字符串是否为空
     *
     * @param checkStr 被验证的字符串
     * @return boolean 如果为空,返回true,否则,返回false
     */
    public static boolean isNull(String checkStr) {
        return checkStr==null||checkStr.equals("");
    }

    /**
     * 字符串转utf-8
     */
    public static String EncodeParams(String str) {
        if (str==null||str.equals("")) {
            return "";
        }
        try {
            return java.net.URLEncoder.encode(str, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 字符串以逗号隔开
     *
     * @param stringList
     * @param <T>
     * @return
     */
    public static <T> String listToString(List<T> stringList) {
        if (stringList == null) {
            return null;
        }
        StringBuilder result = new StringBuilder();
        boolean flag = false;
        for (T string : stringList) {
            if (flag) {
                result.append(",");
            } else {
                flag = true;
            }
            result.append(string);
        }
        return result.toString();
    }

    /**
     * 保留两位有效数字
     */
    public static String getTwoStep(double vaule) {
        try {
            DecimalFormat df = new DecimalFormat("###########0.00");
            return df.format(Math.round(vaule * 100) / 100.0);
        } catch (Exception e) {
        }
        return Math.round(vaule * 100) / 100.00f + "";
    }

    public static String getTwoStepAndInt(double vaule) {
        try {
            if (vaule == (int) vaule) {
                return ((int) vaule) + "";
            } else {
                DecimalFormat df = new DecimalFormat("###########0.00");
                return df.format(Math.round(vaule * 100) / 100.0);
            }
        } catch (Exception e) {
        }
        return Math.round(vaule * 100) / 100.00f + "";
    }

    public static String getTwoStepStr(String vaule) {
        try {
            float vauleF = Float.parseFloat(vaule);
            String unit = "";
            if (Math.abs(vauleF) > 100000000) {
                unit = "亿";
                vauleF /= 100000000;
            } else if (Math.abs(vauleF) > 10000) {
                unit = "万";
                vauleF /= 10000;
            }
            DecimalFormat df = new DecimalFormat("###########0.00");
            return df.format(Math.round(vauleF * 100) / 100.0) + unit;
        } catch (Exception e) {
        }
        return "- -";
    }
    public static String getTwoStep(String vaule, String exStr) {
        try {
            float vauleF = Float.parseFloat(vaule);
            DecimalFormat df = new DecimalFormat("###########0.00");
            return df.format(Math.round(vauleF * 100) / 100.0)+exStr;
        } catch (Exception e) {
        }
        return "- -";
    }
    public static String getTwoStepStrAnd(String vaule) {
        try {
            float vauleF = Float.parseFloat(vaule);
            String unit = "";
            if (Math.abs(vauleF) > 100000000) {
                unit = "亿";
                vauleF /= 100000000;
            } else if (Math.abs(vauleF) > 10000) {
                unit = "万";
                vauleF /= 10000;
            }
            String vauleR;
            if (vauleF == (int) vauleF) {
                vauleR = ((int) vauleF) + unit;
            } else {
                DecimalFormat df = new DecimalFormat("###########0.00");
                vauleR = df.format(Math.round(vauleF * 100) / 100.0) + unit;
            }
            if (vauleF > 0) {
                vauleR = "+" + vauleR;
            }
            return vauleR;
        } catch (Exception e) {
        }
        return "- -";
    }

    /**
     * 取整
     *
     * @param vaule
     * @return
     */
    public static String getIntStep(double vaule) {
        try {
            DecimalFormat df = new DecimalFormat("###########0");
            return df.format(Math.round(vaule * 100) / 100.0);
        } catch (Exception e) {
        }
        return Math.round(vaule) + "";
    }

    /**
     * 字符串转int类型
     *
     * @param vaule
     * @return
     */
    public static int parseInt(String vaule) {
        try {
            if (isNull(vaule)) {
                return 0;
            }
            return Integer.parseInt(vaule);
        } catch (Exception e) {
            return 0;
        }
    }

    public static int parseIntError(String vaule) {
        try {
            if (isNull(vaule)) {
                return Integer.MAX_VALUE;
            }
            return Integer.parseInt(vaule);
        } catch (Exception e) {
            return Integer.MAX_VALUE;
        }
    }

    /**
     * 字符串转float类型
     *
     * @param vaule
     * @return
     */
    public static float parseFloat(String vaule) {
        try {
            if (isNull(vaule)) {
                return 0;
            }
            return Float.parseFloat(vaule);
        } catch (Exception e) {
            return 0;
        }
    }

    /**
     * 字符串转float类型
     *
     * @param vaule
     * @return
     */
    public static float parseFloatError(String vaule) {
        try {
            if (isNull(vaule)) {
                return Float.MAX_VALUE;
            }
            return Float.parseFloat(vaule);
        } catch (Exception e) {
            return Float.MAX_VALUE;
        }
    }

    /**
     * 字符串转float类型
     *
     * @param vaule
     * @return
     */
    public static double parseDouble(String vaule) {
        try {
            if (isNull(vaule)) {
                return 0;
            }
            return Double.parseDouble(vaule);
        } catch (Exception e) {
            return 0;
        }
    }

    private static String[] units = {"", "十", "百", "千", "万", "十万", "百万", "千万", "亿",
            "十亿", "百亿", "千亿", "万亿"};
    private static char[] numArray = {'零', '一', '二', '三', '四', '五', '六', '七', '八', '九'};

    /**
     * 数字转化成汉字
     *
     * @param num
     * @return
     */
    public static String foematInteger(int num) {
        char[] val = String.valueOf(num).toCharArray();
        int len = val.length;
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < len; i++) {
            String m = val[i] + "";
            int n = Integer.valueOf(m);
            boolean isZero = n == 0;
            String unit = units[(len - 1) - i];
            if (isZero) {
                if ('0' == val[i - 1]) {
                    continue;
                } else {
                    sb.append(numArray[n]);
                }
            } else {
                sb.append(numArray[n]);
                sb.append(unit);
            }
        }
        return sb.toString();
    }

}