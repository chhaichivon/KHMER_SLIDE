package org.khmerslide.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//@RequestMapping("/")
public class FrontEndController {
	
	@RequestMapping(value = { "/", "/index", "/home" })
	public String frontEndPage() {
		return "front-end/index";
	}
	
	@RequestMapping(value = { "/category/all-categories" })
	public String CategoriesPage() {
		return "front-end/all-categories";
	}
	
	@RequestMapping(value = { "/category/all-category" })
	public String CategoryPage() {
		return "front-end/all-category";
	}
	
	@RequestMapping(value = { "/category/search-category" })
	public String searchCategoryPage() {
		return "front-end/search-category";
	}
	@RequestMapping(value = { "/view" })
	public String viewPage() {
		return "front-end/view";
	}
	@RequestMapping(value = { "/login" })
	public String loginPage() {
		return "front-end/login";
	}
}
