package org.khmerslide.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.khmerslide.entities.Document;
import org.khmerslide.entities.User;
import org.khmerslide.entities.View_History;
import org.khmerslide.filter.FilterViewHistory;
import org.khmerslide.model.InputView_History;
import org.khmerslide.model.InputView_History.UpdateViewHistory;
import org.khmerslide.services.ViewHistoryService;
import org.khmerslide.utilities.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/api/viewhistory")
public class ViewHistoryController {
	@Autowired
	private ViewHistoryService  viewhistoryService;
	
	/*====================================GET VIEW HISTRORY====================================*/
	@ResponseBody
	@RequestMapping(value={"/get-viewhistory"},method=RequestMethod.GET,headers="Accept=Application/json")
	public ResponseEntity<Map<String, Object>> getViewHistory(
			@RequestParam(value="page",required = false,defaultValue="1") int page, 
			@RequestParam(value="limit",required = false,defaultValue="15") int limit
			){
		Map<String , Object> map = new HashMap<String , Object>();
		Pagination pagination = new Pagination();
			pagination.setPage(page);
			pagination.setLimit(limit);
		try{
			ArrayList<View_History> vh = viewhistoryService.getViewHistory(pagination);
			if(!vh.isEmpty()){
				map.put("DATA", vh);
				map.put("STATUS", true);
				map.put("MESSAGE", "DATA FOUND!");
			}else{
				map.put("STATUS", true);
				map.put("MESSAGE", "DATA NOT FOUND!");
			}
		}catch(Exception e){
			map.put("STATUS", false);
			map.put("MESSAGE", "ERROR!");
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String, Object>>(map ,HttpStatus.OK) ;
	}
	
	/*====================================GET VIEW HISTORY BY USER ID====================================*/
	@ResponseBody
	@RequestMapping(value={"/get-viewhistory-by-userid"},method=RequestMethod.GET,headers="Accept=Application/json")
	public ResponseEntity<Map<String, Object>> getViewHistoryByUserId(
			@RequestParam(value="page",required = false,defaultValue="1") int page,
			@RequestParam(value="limit",required = false,defaultValue="10") int limit,
			@RequestParam(value="user_id",required =true,defaultValue="0") int user_id){
		Map<String , Object> map = new HashMap<String , Object>();
		Pagination pagination = new Pagination();
			pagination.setLimit(limit);
			pagination.setPage(page);
		FilterViewHistory filter = new FilterViewHistory();
			filter.setUser_id(user_id);
		try{
			ArrayList<View_History> vh = viewhistoryService.getViewHistoryByUserId(filter, pagination);
			if(!vh.isEmpty()){
				map.put("DATA", vh);
				map.put("COUNT", vh.size());
				map.put("STATUS", true);
				map.put("MESSAGE", "DATA FOUND!");
			}else{
				map.put("STATUS", true);
				map.put("MESSAGE", "DATA NOT FOUND!");
			}
		}catch(Exception e){
			map.put("STATUS", false);
			map.put("MESSAGE", "ERROR!");
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String, Object>>(map ,HttpStatus.OK) ;
	}
	
	
	/*====================================GET VIEW HISTORY BY ID====================================*/
	@ResponseBody
	@RequestMapping(value={"/get-viewhistory/{vh_id}"},method=RequestMethod.GET,headers="Accept=Application/json")
	public ResponseEntity<Map<String, Object>> getViewHistoryById(@PathVariable("vh_id") int vh_id){
		Map<String , Object> map = new HashMap<String , Object>();
		try{
			ArrayList<View_History> vh = viewhistoryService.getViewHistoryById(vh_id);
			if(!vh.isEmpty()){
				map.put("DATA", vh);
				map.put("STATUS", true);
				map.put("MESSAGE", "DATA FOUND!");
			}else{
				map.put("STATUS", true);
				map.put("MESSAGE", "DATA NOT FOUND!");
			}
		}catch(Exception e){
			map.put("STATUS", false);
			map.put("MESSAGE", "ERROR!");
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String, Object>>(map ,HttpStatus.OK) ;
	}
	
	/*====================================ADD VIEW HISTORY====================================*/
	@RequestMapping(value={"/add-viewhistory"},method = RequestMethod.POST, headers="Accept=Application/json")
	public ResponseEntity<Map<String , Object>> addViewHistory(@RequestBody InputView_History viewhistory){
		Map<String,Object> map = new HashMap<String, Object>();
		try{
			View_History vh = new View_History();
			vh.setAdded_date(viewhistory.getAdded_date());
				User U = new User();
					U.setUser_id(viewhistory.getUser_id());
			vh.setUser(U);
				Document D = new Document();
					D.setDoc_id(viewhistory.getDoc_id());
			vh.setDoc(D);
			vh.setDescription(viewhistory.getDescription());
			if(viewhistoryService.addViewHistory(vh)){
				map.put("MESSAGE", "ADD VIEW HISTORY");
				map.put("STATUS", true);
			}else{
				map.put("MESSAGE", "NOT ADD VIEW HISTORY");
				map.put("STATUS", false);
			}
		}catch(Exception e){
			map.put("MESSAGE", "Error!");
			map.put("STATUS", false);
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String,Object>>(map , HttpStatus.OK);
	}
	
/*====================================UPDATE VIEW HISTORY====================================*/
	@RequestMapping(value={"/update-viewhistory/{vh_id}"},method=RequestMethod.PUT, headers = "Accept=Application/json")
	public ResponseEntity<Map<String, Object>> updateViewHisotry(@PathVariable("vh_id") int vh_id,@RequestBody UpdateViewHistory viewhistory){
		Map<String, Object> map = new HashMap<String , Object>();
		try{
			View_History  VH = new View_History();
				VH.setVh_id(vh_id);
					Document D = new Document();
						D.setDoc_id(viewhistory.getDoc_id());
				VH.setDoc(D);
				VH.setDescription(viewhistory.getDescription());
			
			if(viewhistoryService.updateViewHistory(VH)){
				map.put("MESSAGE", "UPDATE VIEW HISTORY");
				map.put("STATUS", true);
			}else{
				map.put("MESSAGE", "NOT UPDATE VIEW HISTORY");
				map.put("STATUS", false);
			}
		}catch(Exception e){
			map.put("MESSAGE", "Error!");
			map.put("STATUS", false);
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String,Object>>(map , HttpStatus.OK);
	}
	
	/*====================================DELETE VIEW HISTORY====================================*/
	@RequestMapping(value="/delete-viewhistory/{vh_id}" , method = RequestMethod.DELETE, headers="Accept=Application/json")
	public ResponseEntity<Map<String , Object>> deleteUser(@PathVariable("vh_id") int vh_id){
		Map<String , Object> map = new HashMap<String,Object>();
		try{
			if(viewhistoryService.deleteViewHistory(vh_id)){
				map.put("MESSAGE", "DELETE VIEW HISTORY");
				map.put("STATUS" , true);
			}else{
				map.put("MESSAGE", "NOT DELETE VIEW HISTORY");
				map.put("STATUS" , false);
			}
		}catch(Exception e){
			e.printStackTrace();
			map.put("MESSAGE", "Error!");
			map.put("STATUS" , false);
		}
		return new ResponseEntity<Map<String,Object>>(map , HttpStatus.OK);
	}
	
	/*====================================DELETE VIEW HISTORY BY USER ID====================================*/
	@RequestMapping(value="/delete-viewhistory-by-userid/{userId}" , method = RequestMethod.DELETE, headers="Accept=Application/json")
	public ResponseEntity<Map<String , Object>> deleteViewHistoryByUserId(@PathVariable("userId") int userId){
		Map<String , Object> map = new HashMap<String,Object>();
		try{
			if(viewhistoryService.deleteViewHistoryByUserId(userId)){
				map.put("MESSAGE", "DELETE VIEW HISTORY");
				map.put("STATUS" , true);
			}else{
				map.put("MESSAGE", "NOT DELETE VIEW HISTORY");
				map.put("STATUS" , false);
			}
		}catch(Exception e){
			e.printStackTrace();
			map.put("MESSAGE", "Error!");
			map.put("STATUS" , false);
		}
		return new ResponseEntity<Map<String,Object>>(map , HttpStatus.OK);
	}

}