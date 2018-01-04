package com.yulu.mangger.controller;

import com.yulu.mangger.constants.AddressConstants;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 动态页面跳转控制器
 */
@Controller
public class FormController {

    @RequestMapping(value = "/{formName}")
    public String loginForm(@PathVariable String formName) {
        // 动态跳转页面
        return formName;
    }

    @RequestMapping(value = "")
    public String loginForm() {
        // 动态跳转页面
        return "forward:index";
    }

    @RequestMapping(value = "index")
    public String index() {
        // 动态跳转页面
        return AddressConstants.FORWARD+AddressConstants.NewsURL.NEWS+AddressConstants.NewsURL.LIST;
    }

}

