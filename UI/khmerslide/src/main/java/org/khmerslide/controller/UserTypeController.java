package org.khmerslide.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;


@RestController
@RequestMapping("/rest/user-type")
public class UserTypeController {
		
	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> userType(){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/user-type/get-user-type/", HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
//	@RequestMapping(method = RequestMethod.POST)
//	public ResponseEntity<Map<String , Object>> adduser(@RequestBody AddUser addUser){
//		HttpEntity<Object> request = new HttpEntity<Object>(addUser,header);
//		ResponseEntity<Map> response = rest.exchange(WS_URL + "/user", HttpMethod.POST , request , Map.class) ;
//		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
//	}

	

}
