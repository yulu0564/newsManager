package com.yulu.util;

import java.io.File;
import java.util.UUID;

import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

/**
 * 七牛上传帮助类
 */
public class QiniuHelper {

    /**
     * 空间名
     */
    private static String bucket = "yulu";

    /**
     * 域名
     */
    private static String Url = "owqb07jhj.bkt.clouddn.com";

    /**
     * 公钥
     */
    private static String ACCESS_KEY = "-cbaUNmUhK1x-048E8m6gCxEH39Az4hasDO-Ih-E";

    private static String SECRET_KEY = "2vqQGBAdskH6dVMaywstyL6OTSHRMPkCJ2zqxTKR";

    /**
     * 上传附件
     *
     * @throws QiniuException
     */
    public static String UploadFile(File file) throws QiniuException {

        String key = UUID.randomUUID().toString().replaceAll("-", "");

        try {
            //构造一个带指定Zone对象的配置类
            Configuration cfg = new Configuration(Zone.zone0());
            //...其他参数参考类注释
            UploadManager uploadManager = new UploadManager(cfg);

            //密钥配置
            Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);

            //上传文件
            Response res = uploadManager.put(file, key, auth.uploadToken(bucket, key));
        } catch (Exception e) {
            return "";
        }
        return key;
    }

    //删除文件
    public void deleteFile(String key) {
        //构造一个带指定Zone对象的配置类
        Configuration cfg = new Configuration(Zone.zone0());
        Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
        BucketManager bucketManager = new BucketManager(auth, cfg);
        try {
            bucketManager.delete(bucket, key);
        } catch (QiniuException ex) {
            //如果遇到异常，说明删除失败
            System.err.println(ex.code());
            System.err.println(ex.response.toString());
        }
    }

    /**
     * 获得url地址
     */
    public static String GetUrl(String key) {
        return String.format("http://%s/%s", Url, key);
    }

}