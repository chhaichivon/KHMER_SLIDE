package org.khmerslide.controller;

import java.util.Map;

import org.khmerslide.entities.input.AddComment;
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
@RequestMapping("/rest/comment")
public class CommentController {

	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	@RequestMapping(value={"/get-comment"}, method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> category(
										  @RequestParam(value = "page", required = false , defaultValue="1") int page 
									    , @RequestParam(value="item" , required = false , defaultValue="10") int item){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		//ResponseEntity<Map> response = rest.exchange("http://localhost:9999/api/category/get-category?page=1&limit=10", HttpMethod.GET , request , Map.class) ;
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/comment/get-comment?page=" + page + "&limit="+ item, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(value={"/by-document/{doc_id}"}, method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getCommentByDocumentId(@PathVariable("doc_id") int id){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/comment/get-comment-by/" + id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> addDocument(@RequestBody AddComment addComment){
		HttpEntity<Object> request = new HttpEntity<Object>(addComment,header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/comment/add-comment", HttpMethod.POST , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	@RequestMapping(value={"/delete-comment/{cmt_id}"},method = RequestMethod.DELETE)
	public ResponseEntity<Map<String , Object>> deleteComment(
			@PathVariable(value="cmt_id") int cmt_id
			){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/comment/delete-comment/"+ cmt_id , HttpMethod.DELETE , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
}
	

}