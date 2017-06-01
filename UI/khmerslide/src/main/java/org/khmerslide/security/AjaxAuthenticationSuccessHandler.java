package org.khmerslide.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component("ajaxAuthenticationSuccessHandler")
public class AjaxAuthenticationSuccessHandler implements  AuthenticationSuccessHandler {

	//TODO: TO OVERRIDE ON SUCCESS URL HANDLER
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		System.out.println("LOGIN SUCCESS HANDLER");
		
		response.getWriter().println(determineTargetUrl(authentication));
		response.getWriter().flush();
	}
	
	//TODO: TO DETERMINE THE ROLE OF USER AND RETURN THE REDIRECT URL
	private String determineTargetUrl(Authentication authentication) {

		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();

		List<String> roles = new ArrayList<String>();

		for (GrantedAuthority authority : authorities) {
			System.out.println(authority.getAuthority());
			roles.add(authority.getAuthority());
			System.out.println("Extract Role: " + authority.getAuthority());
		}
		if (roles.contains("ROLE_ADMIN")) {
			return "/admin/index";
		}else if(roles.contains("ROLE_USER")){
			return "/index.ks";
		}else if(roles.contains("ROLE_OTHER")){
			return "/";
		}else{
			return "accessDenied";
		}

	}
	
//	// Get API User from HttpSession
//	private APIUser getAPIUser(){
//		Authentication authentication =  SecurityContextHolder.getContext().getAuthentication();
//		APIUser user = (APIUser) authentication.getPrincipal();
//		return user;
//	}
}
