package org.khmerslide.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.khmerslide.entities.Document;
import org.khmerslide.entities.Save_Doc;
import org.khmerslide.entities.Save_List;
import org.khmerslide.model.InputSave_List.updateSaveList;
import org.khmerslide.entities.User;
import org.khmerslide.filter.FilterSaveList;
import org.khmerslide.model.InputDocument;
import org.khmerslide.model.InputSave_Doc;
import org.khmerslide.model.InputSave_List;
import org.khmerslide.services.SaveListService;
import org.khmerslide.utilities.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ch.qos.logback.core.net.SyslogOutputStream;

@Controller
@RequestMapping(value="/api/savelist")
public class SaveListController {
	@Autowired
	private SaveListService  savelistService;
	
	/*====================================GET ALL SAVELIST====================================*/
	@ResponseBody
	@RequestMapping(value={"/get-getsavelist"},method=RequestMethod.GET,headers="Accept=Application/json")
	public ResponseEntity<Map<String, Object>> getSaveList(
			@RequestParam(value="page",required = false,defaultValue="1") int page, 
			@RequestParam(value="limit",required = false,defaultValue="10") int limit,
			@RequestParam(value="search",required = false,defaultValue="") String search
			){
		Map<String , Object> map = new HashMap<String , Object>();
		Pagination pagination = new Pagination();
			pagination.setPage(page);
			pagination.setLimit(limit);
		FilterSaveList filter = new FilterSaveList();
			filter.setSearch(search);
		try{
			ArrayList<Save_List> savelist = savelistService.getSaveList(filter,pagination);
			if(!savelist.isEmpty()){
				map.put("DATA", savelist);
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
	
	/*====================================GET SAVE DOC BY SAVELIST ID====================================*/
	@ResponseBody
	@RequestMapping(value={"/get-save-doc-by-savelistid"},method=RequestMethod.GET,headers="Accept=Application/json")
	public ResponseEntity<Map<String, Object>> getSaveListBySaveListId(
			@RequestParam(value ="page", required = false , defaultValue="1") int page,
			@RequestParam(value ="limit", required = false , defaultValue="15") int limit,
			@RequestParam(value = "slId",required = false, defaultValue="0") int slId
	){
		Map<String , Object> map = new HashMap<String , Object>();
		Pagination pagination = new Pagination();
			pagination.setLimit(limit);
			pagination.setPage(page);

		FilterSaveList filter = new FilterSaveList();
			filter.setSl_id(slId);
			System.out.println(filter.getSl_id());
			
		try{
			ArrayList<Save_List> savelist = savelistService.getDocumentSaveDocBySaveListId(filter, pagination);
			if(!savelist.isEmpty()){
				map.put("DATA", savelist);
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
	
	/*====================================GET SAVELIST BY USER ID====================================*/
	@ResponseBody
	@RequestMapping(value={"/get-getsavelist-by-userid"},method=RequestMethod.GET,headers="Accept=Application/json")
	public ResponseEntity<Map<String, Object>> getSaveListByUserId(
			@RequestParam(value ="page", required = false , defaultValue="1") int page,
			@RequestParam(value ="limit", required = false , defaultValue="15") int limit,
			@RequestParam(value = "userId",required = false, defaultValue="0") int userId
	){
		Map<String , Object> map = new HashMap<String , Object>();
		Pagination pagination = new Pagination();
			pagination.setLimit(limit);
			pagination.setPage(page);
			System.out.println(pagination.getLimit() +" "+ pagination.getPage());
		FilterSaveList filter = new FilterSaveList();
			filter.setUserId(userId);
			System.out.println(filter.getUserId());
		try{
			ArrayList<Save_List> savelist = savelistService.getSaveListByUserId(filter, pagination);
			System.out.println(" SaveList =" + savelist);
			if(!savelist.isEmpty()){
				map.put("DATA", savelist);
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
	
	/*====================================ADD SAVELIST====================================*/
	@RequestMapping(value={"/add-savelist"},method = RequestMethod.POST, headers="Accept=Application/json")
	public ResponseEntity<Map<String , Object>> addSaveList(@RequestBody InputSave_List savelist){
		Map<String,Object> map = new HashMap<String, Object>();
		try{
			Save_List sl = new Save_List();
			sl.setSl_name(savelist.getSl_name());
			sl.setSaved_date(savelist.getSaved_date());
			sl.setStatus(savelist.getStatus());
				User u = new User();
					u.setUser_id(savelist.getUser_id());
			sl.setUser(u);
				Document  d = new Document();
					d.setDoc_id(savelist.getDoc_id());
				sl.setDoc(d);
			sl.setDescription(savelist.getDescription());
			
			if(savelistService.addSaveList(sl)){
				map.put("MESSAGE", "ADD SAVELIST");
				map.put("STATUS", true);
			}else{
				map.put("MESSAGE", "NOT ADD SAVELIST");
				map.put("STATUS", false);
			}
		}catch(Exception e){
			map.put("MESSAGE", "Error!");
			map.put("STATUS", false);
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String,Object>>(map , HttpStatus.OK);
		
	}
	
	
	/*====================================Save Document to Save List====================================*/
	@RequestMapping(value={"/add-save-doc"},method = RequestMethod.POST, headers="Accept=Application/json")
	public ResponseEntity<Map<String , Object>> addSaveDoc(@RequestBody InputSave_Doc savedoc){
		Map<String,Object> map = new HashMap<String, Object>();
		try{
			InputSave_Doc sd = new InputSave_Doc();
			sd.setSl_id(savedoc.getSl_id());
			sd.setDoc_id(savedoc.getDoc_id());
			sd.setStatus(savedoc.getStatus());
				
			if(savelistService.saveDoc(sd)){
				map.put("MESSAGE", "ADD SAVELIST");
				map.put("STATUS", true);
			}else{
				map.put("MESSAGE", "NOT ADD SAVELIST");
				map.put("STATUS", false);
			}
		}catch(Exception e){
			map.put("MESSAGE", "Error!");
			map.put("STATUS", false);
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String,Object>>(map , HttpStatus.OK);
		
	}
	
	/*====================================UPDATE SAVELIST====================================*/
	@RequestMapping(value={"/update-savelist/{sl_id}"},method=RequestMethod.PUT, headers = "Accept=Application/json")
	public ResponseEntity<Map<String, Object>> updateSaveList(@PathVariable("sl_id") int sl_id,@RequestBody updateSaveList updatesl){
		Map<String, Object> map = new HashMap<String , Object>();
		try{
			Save_List sl = new Save_List();
				sl.setSl_id(sl_id);
				sl.setSl_name(updatesl.getSl_name());
				sl.setStatus(updatesl.getStatus());
					Document  d = new Document();
						d.setDoc_id(updatesl.getDoc_id());
				sl.setDoc(d);
					/*Save_Doc sd = new Save_Doc();
						sd.setDoc_id(updatesl.getSd_id());
				sl.setSd(sd);*/
				sl.setDescription(updatesl.getDescription());
				
				//JIVON UPDATE EY KE KLAS?. 1.  SaveLIST _Name , 2, Status , 3,  Description , => IN table SaveList. 
				//  Then Update Doc_ID too in table Save_Doc,  
				//  UPdate 1 Time ., We Update 2 Table.  
			if(savelistService.updateSaveList(sl)){
				map.put("MESSAGE", "UPDATE SAVELIST");
				map.put("STATUS", true);
			}else{
				map.put("MESSAGE", "NOT UPDATE SAVELIST");
				map.put("STATUS", false);
			}
		}catch(Exception e){
			map.put("MESSAGE", "Error!");
			map.put("STATUS", false);
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String,Object>>(map , HttpStatus.OK);
	}
	
	/*====================================DELETE SAVELIST====================================*/
	@RequestMapping(value="/delete-savelist/{sl_id}" , method = RequestMethod.DELETE, headers="Accept=Application/json")
	public ResponseEntity<Map<String , Object>> deleteSaveList(@PathVariable("sl_id") int sl_id){
		Map<String , Object> map = new HashMap<String,Object>();
		try{
			if(savelistService.deleteSaveList(sl_id)){
				map.put("MESSAGE", "SAVELIST DELETE");
				map.put("STATUS" , true);
			}else{
				map.put("MESSAGE", "SAVELIST NOT DELETE");
				map.put("STATUS" , false);
			}
		}catch(Exception e){
			e.printStackTrace();
			map.put("MESSAGE", "Error!");
			map.put("STATUS" , false);
		}
		return new ResponseEntity<Map<String,Object>>(map , HttpStatus.OK);
	}
	
	
	/*====================================DELETE SAVE DOCUMENT in SAVELIST====================================*/
	@RequestMapping(value="/delete-savedoc/{sd_id}" , method = RequestMethod.DELETE, headers="Accept=Application/json")
	public ResponseEntity<Map<String , Object>> deleteSaveDoc(@PathVariable("sd_id") int sd_id){
		Map<String , Object> map = new HashMap<String,Object>();
		try{
			if(savelistService.deleteSaveDoc(sd_id)){
				map.put("MESSAGE", "SAVELIST DELETE");
				map.put("STATUS" , true);
			}else{
				map.put("MESSAGE", "SAVELIST NOT DELETE");
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