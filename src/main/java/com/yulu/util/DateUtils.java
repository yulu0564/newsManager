package com.yulu.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

/**
 * 时间工具类
 */
public class DateUtils {

    /**
     * @param millis   要转化的毫秒数。
     * @param isWhole  是否强制全部显示小时/分。
     * @param isFormat 时间数字是否要格式化，如果true：少位数前面补全；如果false：少位数前面不补全。
     * @return 返回时间字符串：小时/分/秒/毫秒的格式（如：24903600 --> 06小时55分钟）。
     */
    public static String millisToStringShort(long millis, boolean isWhole,
                                             boolean isFormat) {
        String h = "";
        String m = "";
        if (isWhole) {
            h = isFormat ? "00小时" : "0小时";
            m = isFormat ? "00分钟" : "0分钟";
        }

        long temp = millis;

        long hper = 60 * 60 * 1000;
        long mper = 60 * 1000;

        if (temp / hper > 0) {
            if (isFormat) {
                h = temp / hper < 10 ? "0" + temp / hper : temp / hper + "";
            } else {
                h = temp / hper + "";
            }
            h += "小时";
        }
        temp = temp % hper;

        if (temp / mper > 0) {
            if (isFormat) {
                m = temp / mper < 10 ? "0" + temp / mper : temp / mper + "";
            } else {
                m = temp / mper + "";
            }
            m += "分钟";
        }

        return h + m;
    }

    /**
     * @param millis  要转化的日期毫秒数。
     * @param pattern 要转化为的字符串格式（如：yyyy-MM-dd HH:mm:ss）。
     * @return 返回日期字符串。
     */
    public static String millisToStringDate(long millis, String pattern) {
        SimpleDateFormat format = new SimpleDateFormat(pattern,
                Locale.getDefault());
        return format.format(new Date(millis));
    }

    /**
     * @param millis  要转化的日期毫秒数。
     * @param pattern 要转化为的字符串格式（如：yyyy-MM-dd HH:mm:ss）。
     * @return 返回日期字符串（yyyy_MM_dd_HH_mm_ss）。
     */
    public static String millisToStringFilename(long millis, String pattern) {
        String dateStr = millisToStringDate(millis, pattern);
        return dateStr.replaceAll("[- :]", "_");
    }

    public static long oneHourMillis = 60 * 60 * 1000; // 一小时的毫秒数
    public static long oneDayMillis = 24 * oneHourMillis; // 一天的毫秒数
    public static long oneYearMillis = 365 * oneDayMillis; // 一年的毫秒数

    public static String millisToLifeString(long millis) {
        long now = System.currentTimeMillis();
        long todayStart = string2Millis(millisToStringDate(now, "yyyy-MM-dd"),
                "yyyy-MM-dd");

        // 一小时内
        if (now - millis <= oneHourMillis && now - millis > 0l) {
            String m = millisToStringShort(now - millis, false, false);
            return "".equals(m) ? "1分钟内" : m + "前";
        }

        // 大于今天开始开始值，小于今天开始值加一天（即今天结束值）
        if (millis >= todayStart && millis <= oneDayMillis + todayStart) {
            return "今天 " + millisToStringDate(millis, "HH:mm");
        }

        // 大于（今天开始值减一天，即昨天开始值）
        if (millis > todayStart - oneDayMillis) {
            return "昨天 " + millisToStringDate(millis, "HH:mm");
        }

        long thisYearStart = string2Millis(millisToStringDate(now, "yyyy"),
                "yyyy");
        // 大于今天小于今年
        if (millis > thisYearStart) {
            return millisToStringDate(millis, "MM月dd日 HH:mm");
        }

        return millisToStringDate(millis, "yyyy年MM月dd日 HH:mm");
    }

    /**
     * 字符串解析成毫秒数
     *
     * @param str
     * @param pattern
     * @return
     */
    public static long string2Millis(String str, String pattern) {
        SimpleDateFormat format = new SimpleDateFormat(pattern,
                Locale.getDefault());
        long millis = 0;
        try {
            millis = format.parse(str).getTime();
        } catch (ParseException e) {
        }
        return millis;
    }

    /**
     * 修改日期的格式
     */
    public static String changeTime(String time, String dateType, String lastPattern) {
        try {
            SimpleDateFormat df = new SimpleDateFormat(dateType);
            Date curDate = new Date(
                    System.currentTimeMillis());
            Date date = df.parse(time);
            if (areSameDay(curDate, date)) {
                long timeC = curDate.getTime() - date.getTime();
                if (timeC > 1000 * 60 * 60) {
                    return ((int) Math.ceil(timeC / (1000 * 60 * 60))) + "小时前";
                } else if (timeC > 1000 * 60) {
                    return ((int) Math.ceil(timeC / (1000 * 60))) + "分钟前";
                } else {
                    return "一分钟以内";
                }
//                SimpleDateFormat newDf = new SimpleDateFormat(newsPattern);
//                String newTime = newDf.format(date);
//                return newTime;
            } else {
                SimpleDateFormat lastDf = new SimpleDateFormat(lastPattern);
                String lasttime = lastDf.format(date);
                return lasttime;
            }
        } catch (Exception e) {
        }
        return time;
    }

    public static String updateTime(String time, String dateType, String lastPattern) {
        try {
            SimpleDateFormat df = new SimpleDateFormat(lastPattern);
            SimpleDateFormat newDf = new SimpleDateFormat(dateType);
            Date date = df.parse(time);
            String lasttime = newDf.format(date);
            return lasttime;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return time;
    }

    public static long getLongTime(String time, String lastPattern) {
        try {
            SimpleDateFormat df = new SimpleDateFormat(lastPattern);
            Date date = df.parse(time);
            return date.getTime();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static String updateTime(String time, String dateType) {
        try {
            Date date = new Date(
                    Long.parseLong(time) * 1000);
            SimpleDateFormat newDf = new SimpleDateFormat(dateType);
            String lasttime = newDf.format(date);
            return lasttime;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return time;
    }

    /**
     * 判断是否为同一天
     */
    public static boolean areSameDay(Date dateA, Date dateB) {
        Calendar calDateA = Calendar.getInstance();
        calDateA.setTime(dateA);

        Calendar calDateB = Calendar.getInstance();
        calDateB.setTime(dateB);

        return calDateA.get(Calendar.YEAR) == calDateB.get(Calendar.YEAR)
                && calDateA.get(Calendar.MONTH) == calDateB.get(Calendar.MONTH)
                && calDateA.get(Calendar.DAY_OF_MONTH) == calDateB.get(Calendar.DAY_OF_MONTH);
    }

    /**
     * 24小时候超时
     */
    public static boolean isOverdue(Date dateA, Date dateB) {
        long interval = (dateA.getTime() - dateB.getTime()) / 1000;
        if (interval > 85800) {
            return true;
        }
        return false;
    }

    public static String getBeforeTime() {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, -1);
        Date d = cal.getTime();
        SimpleDateFormat sp = new SimpleDateFormat("yyyy-MM-dd");
        String before = sp.format(d);//获取昨天日期
        return before;
    }

    /**
     * 判断是否是穿越时间
     *
     * @return
     */
    public static boolean IsForward(Calendar cal1, Calendar cal2) {
        return cal1.before(cal2);
    }

    /**
     * 是否是同一天
     */
    public static boolean isSameDate(Calendar cal1, Calendar cal2) {

        boolean isSameYear = cal1.get(Calendar.YEAR) == cal2
                .get(Calendar.YEAR);
        boolean isSameMonth = isSameYear
                && cal1.get(Calendar.MONTH) == cal2.get(Calendar.MONTH);
        boolean isSameDate = isSameMonth
                && cal1.get(Calendar.DAY_OF_MONTH) == cal2
                .get(Calendar.DAY_OF_MONTH);

        return isSameDate;
    }

}