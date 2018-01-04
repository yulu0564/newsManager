package com.yulu.mangger.controller.web;

import com.yulu.mangger.constants.ServiceConstants;
import com.yulu.mangger.service.CollectsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yulu.mangger.constants.AddressConstants.CollectURL;
@Controller
// 定义该Controller的根访问路径 /collect
@RequestMapping(CollectURL.COLLECT)
public class CollectController {

	@Autowired
	@Qualifier(ServiceConstants.COLLECTS_SERVICE)
	private CollectsService collectsService;

}
