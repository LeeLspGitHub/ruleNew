package com.lee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;


/**
 * �����������
 * @author Lee
 *
 */
@Controller
@RequestMapping("/liangxing")
public class LiangxingController {
	
	/**
	 * ϵͳ��¼�����ҳ
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index",method= RequestMethod.GET)
	public ModelAndView index(ModelAndView model, HttpServletRequest request){
		model.setViewName("index");
		return model;//WEB-INF/views/+system/index+.jsp = WEB-INF/views/system/index.jsp
	}

}
