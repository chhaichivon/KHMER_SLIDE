package org.khmerslide.controller;

import java.util.List;

import org.khmerslide.model.Role;
import org.khmerslide.model.User;
import org.khmerslide.services.UserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
public class LoginController {
	@Autowired
	private UserServices userService;
	
	
	
	
	
//	@RequestMapping(value="/admin", method = RequestMethod.GET)
//	  public String printUser(ModelMap model) {
//		 
//		  //User user = (User)authentication.getPrincipal();
//		 
//	      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//	      String name = auth.getName(); 
//	      //get logged in username
//
//	      model.addAttribute("username", name);
//	      model.addAttribute("page", "index.jsp");
//	 
//	      return "admin/admin";
//
//	  }
//	  @RequestMapping(value="/admin/**", method = RequestMethod.GET)
//	  public String showUser(ModelMap model) {
//
//	     Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//	      User user = (User) auth.getPrincipal();
//	      System.out.println(user.getId());
//	     
//
////	      model.addAttribute("username", name);
//	      model.addAttribute("page", "index.jsp");
//	 
//	      return "";
//
//	  }
	  
	  
	  
	/*  @RequestMapping("/getuser")
		@ResponseBody
		public org.khmerslide.model.User getUser(){
			return userService.findUserByEmail("bb@gmail.com");
		}
		
		@RequestMapping("/getrole")
		@ResponseBody
		public List<Role> getRole(){
			
			return userService.findUserRolesByUserId(1);
		}*/
	  
}
