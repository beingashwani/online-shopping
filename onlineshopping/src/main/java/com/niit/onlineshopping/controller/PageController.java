package com.niit.onlineshopping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageController {

	@RequestMapping(value = { "/", "/home", "/index" })
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("greeting", "Welcome to spring webmvc");
		return mv;
	}
	
	// http://localhost:8081/onlineshopping/test
	// http://localhost:8081/onlineshopping/test?greeting=Welcome to spring webmvc RequestParam example
	//@RequestMapping(value = "/test")
	//public ModelAndView test(@RequestParam("greeting") String greeting) {
/*	public ModelAndView test(@RequestParam(value="greeting",required=false) String greeting) {
		if(greeting==null)
			greeting="Hey, it is default message";
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("greeting", greeting);
		return mv;
	}*/
	
	@RequestMapping(value = "/test/{greeting}")
	public ModelAndView test(@PathVariable(value="greeting") String greeting) {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("greeting", greeting);
		return mv;
	}

}
