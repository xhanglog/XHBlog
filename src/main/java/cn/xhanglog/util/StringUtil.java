package cn.xhanglog.util;

import java.util.ArrayList;
import java.util.List;

/**
 * 字符串工具类
 *
 * @Author: Xhang
 */
public class StringUtil {

    /**
     * 判断是否是空
     *
     * @param str
     * @return
     */
    public static boolean isEmpty(String str) {
        if (str == null || "".equals(str.trim())) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 判断是否不是空
     *
     * @param str
     * @return
     */
    public static boolean isNotEmpty(String str) {
        if ((str != null) && !"".equals(str.trim())) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 把字符串根据逗号分隔开，加入到一个集合
     *
     * @param s
     * @return
     */
    public static List<String> filterComma(String str) {
        List<String> resultList = new ArrayList<String>();
        String arr[] = str.split(",");
        for (int i = 0; i < arr.length; i++) {
            resultList.add(arr[i]);
        }
        return resultList;
    }
}
