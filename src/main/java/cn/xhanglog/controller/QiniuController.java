package cn.xhanglog.controller;

import cn.xhanglog.ueditor.upload.ReadQiNiuConfig;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import com.qiniu.util.Base64;
import com.qiniu.util.StringMap;
import com.qiniu.util.UrlSafeBase64;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.RequestBody;
import com.squareup.okhttp.Response;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
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
        try {
            byte[] bytes = file.getBytes();
            String imageName = "coverPic"+UUID.randomUUID().toString().replace("-","");
            try {
                //使用base64方式上传到七牛云
                String picurl = cn.xhanglog.controller.QiniuController.put64image(bytes, imageName);
                res.put("picurl",picurl);
                res.put("code",0);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return res;
        } catch (IOException e) {
            res.put("code",1);
            return res;
        }
    }

    public static String put64image(byte[] base64,String key) throws Exception {
        String file64 = Base64.encodeToString(base64, 0);
        Integer l = base64.length;
        String url = "http://upload.qiniup.com/putb64/" + l+"/key/"+ UrlSafeBase64.encodeToString(key);
        //非华东空间需要根据注意事项 1 修改上传域名
        RequestBody rb = RequestBody.create(null, file64);
        Request request = new Request.Builder().
                url(url).
                addHeader("Content-Type", "application/octet-stream")
                .addHeader("Authorization", "UpToken " + token)
                .post(rb).build();
        OkHttpClient client = new OkHttpClient();
        Response response = client.newCall(request).execute();
        return DOMAIN + key;
    }
}
