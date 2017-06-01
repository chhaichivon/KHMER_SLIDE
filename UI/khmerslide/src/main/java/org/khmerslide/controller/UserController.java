package org.khmerslide.controller;

import java.util.Map;

import org.khmerslide.entities.input.AddUser;
import org.khmerslide.entities.input.ChangeUserProfilePicture;
import org.khmerslide.entities.input.EditUser;
import org.khmerslide.entities.input.EditUserStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;


@RestController
@RequestMapping("/rest/user")
public class UserController {
	

	
	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> user(){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/user/get-user/", HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(value={"/{id}"}, method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> userById(@PathVariable("id") int id){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/user/get-user/" + id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> adduser(@RequestBody AddUser addUser){		
		HttpEntity<Object> request = new HttpEntity<Object>(addUser,header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/user/add-user", HttpMethod.POST , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.PUT)
	public ResponseEntity<Map<String , Object>> edituser(@RequestBody EditUser editUser){	
		HttpEntity<Object> request = new HttpEntity<Object>(editUser,header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/user/update-user", HttpMethod.PUT , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(value="/change-profile", method = RequestMethod.PUT)
	public ResponseEntity<Map<String , Object>> changeUserProfilePicture(@RequestBody ChangeUserProfilePicture user){	
		HttpEntity<Object> request = new HttpEntity<Object>(user,header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/user/change-profile-picture/photo", HttpMethod.PUT , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(value="/status", method = RequestMethod.PUT)
	public ResponseEntity<Map<String , Object>> editUserStatus(@RequestBody EditUserStatus status){		
		System.out.println(status.getStatus());
		HttpEntity<Object> request = new HttpEntity<Object>(status, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/user/update-user-status", HttpMethod.PUT , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(value={"/gender/{gender}"}, method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> userByGender(@PathVariable("gender") String gender){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/user/get-user?page=1&limit=10&gender=" + gender, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(value={"/role/{role}"}, method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> userByRole(@PathVariable("role") String role){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/user/get-user?page=1&limit=10&role=" + role, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}

}
