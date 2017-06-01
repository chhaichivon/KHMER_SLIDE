package org.khmerslide.services.implement;

import org.khmerslide.model.User;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import org.khmerslide.services.*;



@Service("customUserDetailService")
public class CustomUserDetailService implements UserDetailsService{

	@Autowired
	private UserServices userService;
	
	@Override
	public UserDetails loadUserByUsername(String userEmail) throws UsernameNotFoundException {
//		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		
		User user = userService.findUserByEmail(userEmail);
		if(user == null){
			System.out.println("User not found!");
			throw new UsernameNotFoundException("User not found!");
		}
		
		System.out.println(user.getUsername());
		System.out.println(user.getRoles().get(0).getRoleName());
		
		return user;
	}

}

