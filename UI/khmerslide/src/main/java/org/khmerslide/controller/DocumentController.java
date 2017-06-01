package org.khmerslide.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;


import org.khmerslide.entities.input.AddDocument;
import org.khmerslide.entities.input.AddUser;
import org.khmerslide.entities.input.EditUserStatus;
import org.khmerslide.entities.input.UpdateDocument;
import org.khmerslide.entities.input.UpdateLikeDocument;
import org.khmerslide.entities.input.UpdateStatusDocument;
import org.khmerslide.entities.input.UpdateViewDocument;
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
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.name.Rename;

@RestController
@RequestMapping("/rest/document")
public class DocumentController {
	
	
	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
//	===========================================Get All Document===============================================================
	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> document(){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/docs/get-document", HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	
//	===========================================Get Document By ID===============================================================
	@RequestMapping(value={"/{id}"}, method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> documentById(@PathVariable("id") int id){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/docs/get-document-by-id?doc_id=" + id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	
//	===========================================Get Document By Popularity===============================================================
	@RequestMapping(value={"/popular"}, method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> popularDocument( 
			@RequestParam(value = "page", required = false , defaultValue="1") int page 
		    , @RequestParam(value="item" , required = false , defaultValue="10") int item){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/docs/get-document-popular-post", HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	

//	===========================================Get Document By Recently===============================================================
	@RequestMapping(value={"/latest"}, method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> latestDocument( 
			@RequestParam(value = "page", required = false , defaultValue="1") int page 
		    , @RequestParam(value="item" , required = false , defaultValue="10") int item){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/docs/get-document-recent-post", HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	
//	===========================================Get Document By Recommendation===============================================================
	@RequestMapping(value={"/recomment/{id}"}, method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> recommentDocument(@PathVariable("id") int id,
			@RequestParam(value = "page", required = false , defaultValue="1") int page 
		    , @RequestParam(value="limit" , required = false , defaultValue="5") int limit){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/docs/get-document-recomment?cat_id=" + id +"&page="+ page + "&limit=" + limit, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	
	
//	===========================================Get Document By Category ID===============================================================	
	@RequestMapping(value={"/by-cat-id/{id}"}, method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getDocumentByCatId(@PathVariable("id") int id,
			@RequestParam(value = "page", required = false , defaultValue="1") int page 
		    , @RequestParam(value="limit" , required = false , defaultValue="10") int limit){
		System.out.println(limit);
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/docs/get-document-by-categoryid?cat_id=" + id +"&page="+ page + "&limit=" + limit, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
//	===========================================Get Document By Category And Document Type===============================================================	
	@RequestMapping(value={"/by-cat-type/{id}/{type}"}, method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getDocumentByCatAndType(@PathVariable("id") int id, @PathVariable("type") int type,
			@RequestParam(value = "page", required = false , defaultValue="1") int page 
		    , @RequestParam(value="limit" , required = false , defaultValue="10") int limit){
		System.out.println(limit);
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/docs/get-document-by-category-and-type?cat_id=" + id + "&doc_type_id=" + type +"&page="+ page + "&limit=" + limit, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
//	===========================================Get Document By User ID===============================================================	
	@RequestMapping(value={"/by-user-id/{id}"}, method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getDocumentByUserId(@PathVariable("id") int id,
			@RequestParam(value = "page", required = false , defaultValue="1") int page 
		    , @RequestParam(value="limit" , required = false , defaultValue="10") int limit){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/docs/get-document-by-user-id?user_id=" + id +"&page="+ page + "&limit=" + limit, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	
//	===========================================Get Document By Search===============================================================	
	@RequestMapping(value={"/search/{keyword}"}, method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getDocumentBySearch(@PathVariable("keyword") String keyword,
			@RequestParam(value = "page", required = false , defaultValue="1") int page 
		    , @RequestParam(value="limit" , required = false , defaultValue="10") int limit){
		System.out.println(limit);
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/docs/get-document-by-search?search=" + keyword, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
//	===========================================Add Document===============================================================	
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> addDocument(@RequestBody AddDocument addDocument){
		HttpEntity<Object> request = new HttpEntity<Object>(addDocument,header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/docs/add-document", HttpMethod.POST , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	

//	===========================================Update Document===============================================================
	@RequestMapping(method = RequestMethod.PUT)
	public ResponseEntity<Map<String , Object>> editDocument(@RequestBody UpdateDocument updateDocument){	
		HttpEntity<Object> request = new HttpEntity<Object>(updateDocument,header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/docs/update-document", HttpMethod.PUT , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	
//	===========================================Update View Document===============================================================
	@RequestMapping(value={"/update-document/view"}, method = RequestMethod.PUT)
	public ResponseEntity<Map<String , Object>> updateViewDocument(@RequestBody UpdateViewDocument updateViewDocument){
		HttpEntity<Object> request = new HttpEntity<Object>(updateViewDocument,header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/docs/update-document/view", HttpMethod.PUT , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
//	===========================================Update Like Document===============================================================
	@RequestMapping(value={"/update-document/like"}, method = RequestMethod.PUT)
	public ResponseEntity<Map<String , Object>> updateLikeDocument(@RequestBody UpdateLikeDocument updateLikeDocument){
		HttpEntity<Object> request = new HttpEntity<Object>(updateLikeDocument,header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/docs/update-document/like", HttpMethod.PUT , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	
	
//	===========================================Delete Document===============================================================	
	@RequestMapping(value="/delete", method = RequestMethod.PUT)
	public ResponseEntity<Map<String , Object>> deleteDocument(@RequestBody UpdateStatusDocument status){		
		HttpEntity<Object> request = new HttpEntity<Object>(status, header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/docs/delete-document", HttpMethod.PUT , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	//===========================================Get Document By Type===============================================================	
		@RequestMapping(value={"/get-totaldoc-type/{id}"}, method = RequestMethod.GET)
		public ResponseEntity<Map<String , Object>> getDocumentByType(@PathVariable("id") int id){
			HttpEntity<Object> request = new HttpEntity<Object>(header);
			ResponseEntity<Map> response = rest.exchange(WS_URL + "/docs/get-document-total-by-type?doc_type=" + id, HttpMethod.GET , request , Map.class) ;
			return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
		}

}
