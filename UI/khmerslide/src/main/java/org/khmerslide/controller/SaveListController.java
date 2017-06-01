package org.khmerslide.controller;

import java.util.Map;

import org.khmerslide.entities.input.AddSaveList;
import org.khmerslide.entities.input.AddViewHistory;
import org.khmerslide.entities.input.InputSave_Doc;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;


@RestController
@RequestMapping("/rest/save-list")
public class SaveListController {
		
	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	
//	==================================================Get All Save List=========================================================================
	@RequestMapping(value={"/get-savelist"},method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getSaveList(
										  @RequestParam(value = "page", required = false , defaultValue="1") int page 
									    , @RequestParam(value="item" , required = false , defaultValue="10") int item){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/savelist/get-getsavelist?page=" + page + "&limit="+ item, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
	
//	===========================================Get Save List By User ID===============================================================	
	@RequestMapping(value={"/by-user-id/{id}"}, method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getSaveListByUserId(@PathVariable("id") int id,
			@RequestParam(value = "page", required = false , defaultValue="1") int page 
		    , @RequestParam(value="limit" , required = false , defaultValue="10") int limit){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/savelist/get-getsavelist-by-userid?userId=" + id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
//	===========================================Get Document By SaveList ID===============================================================	
	@RequestMapping(value={"/by-save-list-id/{id}"}, method = RequestMethod.GET)
	public ResponseEntity<Map<String , Object>> getDocBySaveListId(@PathVariable("id") int id,
			@RequestParam(value = "page", required = false , defaultValue="1") int page 
		    , @RequestParam(value="limit" , required = false , defaultValue="10") int limit){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/savelist/get-save-doc-by-savelistid?slId=" + id, HttpMethod.GET , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
//	===========================================Create and Add Document to SaveList By User ID===============================================================		
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> addSaveList(@RequestBody AddSaveList addSaveList){		
		HttpEntity<Object> request = new HttpEntity<Object>(addSaveList,header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/savelist/add-savelist", HttpMethod.POST , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}
	
//	===========================================Create and Add Document to SaveList By User ID===============================================================		
	@RequestMapping(value="/save-doc", method = RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> saveDoc(@RequestBody InputSave_Doc saveDoc){		
		HttpEntity<Object> request = new HttpEntity<Object>(saveDoc,header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/savelist/add-save-doc", HttpMethod.POST , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
	}

//	===========================================Delete SaveList===============================================================
	@RequestMapping(value={"/delete-savelist/{SL_ID}"},method = RequestMethod.DELETE)
	public ResponseEntity<Map<String , Object>> deleteSaveList(
			@PathVariable(value="SL_ID") int SL_ID
			){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/savelist/delete-savelist/"+ SL_ID , HttpMethod.DELETE , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
}
	
//	===========================================Delete Document From Save List===============================================================
	@RequestMapping(value={"/delete-savedoc/{sd_id}"},method = RequestMethod.DELETE)
	public ResponseEntity<Map<String , Object>> deleteSaveDoc(
			@PathVariable(value="sd_id") int sd_id
			){
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/savelist/delete-savedoc/"+ sd_id , HttpMethod.DELETE , request , Map.class) ;
		return new ResponseEntity<Map<String , Object>>(response.getBody() , HttpStatus.OK);
}
	

}