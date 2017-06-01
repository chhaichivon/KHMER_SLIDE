package org.khmerslide.services.implement;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.khmerslide.model.Role;
import org.khmerslide.model.User;
import org.khmerslide.repositories.UserRepository;
import org.khmerslide.services.UserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class UserServiceImplement implements UserServices{
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	@Override
	public User findUserByEmail(String userEmail) {
		// TODO Auto-generated method stub
		
		//TODO: TO GET THE USER FROM API SERVER
		HttpEntity<String> request = new HttpEntity<String>(userEmail, header);
		System.out.println("URL ==>" + WS_URL + "/user/find-user-by-username");
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/user/find-user-by-username", HttpMethod.POST , request , Map.class) ;
	
		Map<String, Object> userMap = response.getBody();
		
		User user = new User();
		user.setId((int)userMap.get("id"));
		user.setEmail((String) userMap.get("email"));
		user.setPassword((String)userMap.get("password"));
		user.setUsername((String)userMap.get("username"));
		user.setStatus((String)userMap.get("status"));		
		
		List<HashMap<String, Object>> rolesMap = (List<HashMap<String, Object>>) userMap.get("roles");
		
		List<Role> roles = new ArrayList<Role>();
		
		for(HashMap<String, Object> roleMap : rolesMap){
			Role role = new Role();
			role.setId((int)roleMap.get("id"));
			role.setRoleName((String)roleMap.get("roleName"));
			roles.add(role);
		}
		
		user.setRoles(roles);
		
		System.out.println(user);
		return user;
		
		
		//TODO: GET USER FROM DATABASE DIRECTLY
		//return userRepository.findUserByEmail(userEmail);
	}

	@Override
	public List<Role> findUserRolesByUserId(int roleId) {
		// TODO Auto-generated method stub
		return userRepository.findUserRolesByUserId(roleId);
	}

}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	/*
	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	
	@Override
	public User findUserByEmail(String userEmail) {
		
		System.out.println(userEmail);
		
		UserLogin login = new UserLogin();
		login.setUsername(userEmail);
	
		HttpEntity<Object> request = new HttpEntity<Object>(login,header);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/user/find-user-by-username", HttpMethod.POST , request , Map.class) ;
		Map<String, Object> map = (HashMap<String, Object>)response.getBody();
		System.out.println(map);
		if(map.get("DATA") != null){
			Map<String , Object> data = (HashMap<String , Object>) map.get("DATA");
			User u = new User();
			u.setId((Integer)data.get("user_id"));
			u.setEmail((String)data.get("email"));
			u.setUsername((String)data.get("username"));
			u.setPassword((String) data.get("password"));
			
			List<Role> roles = new ArrayList<Role>();
			List<HashMap<String, Object>> dataRole = (List<HashMap<String, Object>>) data.get("roles");
			for (Map<String , Object> datas  : dataRole) {
				Role role = new Role();
				role.setId((Integer)datas.get("id"));
				role.setRoleName((String) datas.get("name"));
				roles.add(role);
				
				System.out.println(role.getId() + role.getRoleName());
				
			}
			//System.out.println(dataRole);
			u.setRoles(roles);
			
			//System.out.println(map);
			
			return u;
		}
		return null;
	}*/
