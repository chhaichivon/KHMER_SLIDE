package org.khmerslide.controller;

import java.util.Map;

import org.khmerslide.entities.input.AddCategory;
import org.khmerslide.entities.input.AddUser;
import org.khmerslide.entities.input.EditUser;
import org.khmerslide.entities.input.UpdateCategory;
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
@RequestMapping("/rest/category")
public class CategoryController {

	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> category(){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/category/get-category/", HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(value={"/{id}"}, method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> categoryById(@PathVariable("id") int id){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/category/get-category-by-id/" + id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(value={"/category-by-parent-id/{id}"}, method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> categoryByParentId(@PathVariable("id") int id){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/category/get-category-by-parent-id/" + id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(value={"/get-main-category"}, method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> mainCategory(){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/category/get-main-category/", HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> addCategory(@RequestBody AddCategory addCat){		
		HttpEntity<Object> request = new HttpEntity<Object>(addCat,header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/category/add-category", HttpMethod.POST , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.PUT)
	public ResponseEntity<Map<String , Object>> editCategory(@RequestBody UpdateCategory editCategory){	
		HttpEntity<Object> request = new HttpEntity<Object>(editCategory,header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/category/update-category", HttpMethod.PUT , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(value="/delete/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Map<String , Object>> deleteCategory(@PathVariable("id") int id){		
		HttpEntity<Object> request = new HttpEntity<Object>(id, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/category/delete-category/" + id, HttpMethod.DELETE , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	

}
