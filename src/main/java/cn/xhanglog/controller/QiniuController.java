package cn.xhanglog.controller;

import cn.xhanglog.ueditor.upload.ReadQiNiuConfig;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * @Author: Xhang
 * 上传到七牛云
 */
@Controller
public class QiniuController {

    private static final UploadManager UPLOADMANAGER = new UploadManager();
    private static final Auth AUTH = Auth.create(ReadQiNiuConfig.getProperty("ak"), ReadQiNiuConfig.getProperty("sk"));
    private static String token = AUTH.uploadToken(ReadQiNiuConfig.getProperty("bucket"),null, 3600, new StringMap().put("insertOnly", 1));
    private static final String DOMAIN = "http://image.xhanglog.cn/";

    @RequestMapping("/uploadPic")
    @ResponseBody
    public Map<String, Object> uplodaQiniu(MultipartFile file, HttpServletRequest request){
        Map<String, Object> res = new HashMap<>();
        try{
            // 包含原始文件名的字符串
            String fi = file.getOriginalFilename();
            // 提取文件拓展名
            String fileNameExtension = fi.substring(fi.indexOf("."), fi.length());
            // 生成云端的真实文件名
            String remoteFileName = "coverImg"+UUID.randomUUID().toString().replace("-","") + fileNameExtension;
            UPLOADMANAGER.put(file.getBytes(),remoteFileName,token);
            String picurl = DOMAIN + remoteFileName;
            res.put("picurl",picurl);
            res.put("code",0);
            return res;
        }catch (Exception e){
            res.put("code",1);
            return res;
        }
    }
}
