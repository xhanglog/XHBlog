package cn.xhanglog.util;

import org.apache.shiro.crypto.hash.Md5Hash;

/**
 * @Author: Xhang
 */
public class MD5Util {
    /**
     *
     * @param str
     * @param salt 加盐
     * @return
     */
    public static String md5(String str,String salt){
        return new Md5Hash(str,salt).toString();
    }
}
