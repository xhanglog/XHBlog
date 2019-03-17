/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.xhanglog.ueditor.upload;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author pangongxia
 */
public class ReadQiNiuConfig {

    private static final Properties PROPS = new Properties();
    private static Boolean config = true;

    public static void readConfig() {
        if (config) {
            InputStream is = ReadQiNiuConfig.class.getClassLoader().getResourceAsStream("qiniuConfig.properties");
            try {
                PROPS.load(is);
            } catch (IOException ex) {
                Logger.getLogger(ReadQiNiuConfig.class.getName()).log(Level.SEVERE, null, ex);
            }
            config = false;
        }
    }

    public static String getProperty(String key) {
        readConfig();
        return PROPS.getProperty(key);
    }

}
