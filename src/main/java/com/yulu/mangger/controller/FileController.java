package com.yulu.mangger.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.yulu.mangger.bean.ResultBean;
import com.yulu.util.FileUtils;
import com.yulu.util.OperateImage;
import com.yulu.util.QiniuHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

/**
 * 动态页面跳转控制器
 */
@Controller
@RequestMapping("/file")
public class FileController {
    /**
     * 处理图片裁剪
     *
     * @param file 图片
     */
    @RequestMapping(value = "/update_tailor_img", method = RequestMethod.POST)
    public void update_img(@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
        if (!file.isEmpty()) {
            // 上传文件路径
            java.util.Random random = new java.util.Random();// 定义随机类
            int result = random.nextInt(1);
            String path = request.getServletContext().getRealPath(
                    "/images/");
            // 上传文件名
            String filename = file.getOriginalFilename();
            File filepath = new File(path, filename);
            // 判断路径是否存在，如果不存在就创建一个
            if (!filepath.getParentFile().exists()) {
                filepath.getParentFile().mkdirs();
            }

            // 将上传文件保存到一个目标文件当中
            file.transferTo(new File(path + File.separator + filename));

            //裁剪图片
            JSONObject object = JSON.parseObject(request.getParameter("avatar_data"));
            OperateImage o = new OperateImage((int) Float.parseFloat(object.get("x").toString()), (int) Float.parseFloat(object.get("y").toString()), (int) Float.parseFloat(object.get("width").toString()), (int) Float.parseFloat(object.get("height").toString()));
            o.setSrcpath(path + File.separator + filename);//输入图片地址
            o.setSubpath("D:\\" + result + ".jpg");//输出图片地址
            o.cut();

            response.setContentType("application/json; charset=utf-8");
            ResultBean mResultBean = new ResultBean();
            mResultBean.setMsg("success");
            response.getWriter().println(JSONObject.toJSONString(mResultBean));
        } else {
            response.setContentType("application/json; charset=utf-8");
            ResultBean mResultBean = new ResultBean();
            mResultBean.setMsg("error");
            response.getWriter().println(JSONObject.toJSONString(mResultBean));
        }
    }

    /**
     * 上传文件到本地
     */
    @RequestMapping(value = "/upload_server")
    public void upload(@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (!file.isEmpty()) {
            // 上传文件路径
            java.util.Random random = new java.util.Random();// 定义随机类
            int result = random.nextInt(1);
            String path = request.getServletContext().getRealPath(
                    "/images/");
            // 上传文件名
            String filename = file.getOriginalFilename();
            File filepath = new File(path, filename);
            // 判断路径是否存在，如果不存在就创建一个
            if (!filepath.getParentFile().exists()) {
                filepath.getParentFile().mkdirs();
            }
            // 将上传文件保存到一个目标文件当中
            file.transferTo(new File(path + File.separator + filename));
            response.setContentType("application/json; charset=utf-8");
            ResultBean mResultBean = new ResultBean();
            mResultBean.setMsg("success");
            response.getWriter().println(JSONObject.toJSONString(mResultBean));
        } else {
            response.setContentType("application/json; charset=utf-8");
            ResultBean mResultBean = new ResultBean();
            mResultBean.setMsg("error");
            response.getWriter().println(JSONObject.toJSONString(mResultBean));
        }
    }

    /**
     * 上传文件到七牛云
     */
    @RequestMapping(value = "/upload_qiniu")
    public void upload_qiniu(@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (!file.isEmpty()) {
            // 上传文件路径
            String key = QiniuHelper.UploadFile(FileUtils.multipartToFile(file));
            response.setContentType("application/json; charset=utf-8");
            ResultBean mResultBean = new ResultBean();
            mResultBean.setMsg("success");
            mResultBean.setData(QiniuHelper.GetUrl(key));
            response.getWriter().println(JSONObject.toJSONString(mResultBean));
        } else {
            response.setContentType("application/json; charset=utf-8");
            ResultBean mResultBean = new ResultBean();
            mResultBean.setMsg("error");
            response.getWriter().println(JSONObject.toJSONString(mResultBean));
        }
    }
}

