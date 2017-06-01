package org.khmerslide.controller;

import java.util.Map;

import org.khmerslide.entities.input.AddCategory;
import org.khmerslide.entities.input.AddViewHistory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@RequestMapping("/rest/view-history")
public class ViewHistoryController {

	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
//	===========================================Get All View History===============================================================	
	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> viewhistory(
										  @RequestParam(value = "page", required = false , defaultValue="1") int page 
									    , @RequestParam(value="item" , required = false , defaultValue="10") int item){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		//ResponseEntity<Map> response = rest.exchange("http://localhost:9999/api/category/get-category?page=1&limit=10", HttpMethod.GET , request , Map.class) ;
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/viewhistory/get-viewhistory?page=" + page + "&limit="+ item, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
//	===========================================Get View History By User ID===============================================================	
	@RequestMapping(value={"/by-user-id/{id}"}, method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getHistoryByUserId(@PathVariable("id") int id,
			@RequestParam(value = "page", required = false , defaultValue="1") int page 
		    , @RequestParam(value="limit" , required = false , defaultValue="4") int limit){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/viewhistory/get-viewhistory-by-userid?user_id=" + id +"&page="+ page + "&limit=" + limit, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
//	===========================================Add View History By User ID===============================================================		
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> addViewHistory(@RequestBody AddViewHistory addView){		
		HttpEntity<Object> request = new HttpEntity<Object>(addView,header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/viewhistory/add-viewhistory", HttpMethod.POST , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
//	===========================================Delete View History By User ID===============================================================	
	@RequestMapping(value={"/delete/{id}"}, method = RequestMethod.DELETE)
	public ResponseEntity<Map<String , Object>> deleteHistoryByUserId(@PathVariable("id") int id){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/viewhistory/delete-viewhistory-by-userid/" + id, HttpMethod.DELETE , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}

}