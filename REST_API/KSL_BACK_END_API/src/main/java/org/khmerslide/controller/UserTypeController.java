package org.khmerslide.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.khmerslide.entities.User;
import org.khmerslide.entities.User_Type;
import org.khmerslide.model.InputUser;
import org.khmerslide.services.UserService;
import org.khmerslide.services.UserTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/api/user-type")
public class UserTypeController {
	@Autowired
	private UserTypeService  userTypeService;
	@ResponseBody
	@RequestMapping(value={"/get-user-type"}, method=RequestMethod.GET, headers="Accept=Application/json")
	public ResponseEntity<Map<String, Object>> getUserType(){
		Map<String , Object> map = new HashMap<String , Object>();
		try{
			ArrayList<User_Type> ut = userTypeService.getUserType();
			if(!ut.isEmpty()){
				map.put("DATA", ut);
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
	
	
	
	
//	
//	@RequestMapping(method = RequestMethod.POST, headers="Accept=Application/json")
//	public ResponseEntity<Map<String , Object>> addUser(@RequestBody InputUser user){
//		Map<String,Object> map = new HashMap<String, Object>();
//		try{
//			User u = new User();
//			u.setUser_id(user.getUser_id());
//			u.setUser_name(user.getUser_name());
//			u.setGender(user.getGender());
//			u.setEmail(user.getEmail());
//			u.setPassword(user.getPassword());
//			u.setRegistered_date(user.getRegistered_date());
//			u.setPhoto(user.getPhoto());
//			u.setDescription(user.getDescription());
//			u.setStatus(user.getStatus());
//			//u.setRole_id(user.getRole_id());
//			User_Type  ut = new User_Type();
//					ut.setRole_id(user.getRole_id());
//			u.setRole(ut);
//			
//			if(userService.addUser(u)){
//				map.put("MESSAGE", "ADD USER");
//				map.put("STATUS", true);
//			}else{
//				map.put("MESSAGE", "NOT ADD USER");
//				map.put("STATUS", false);
//			}
//		}catch(Exception e){
//			map.put("MESSAGE", "Error!");
//			map.put("STATUS", false);
//			e.printStackTrace();
//		}
//		return new ResponseEntity<Map<String,Object>>(map , HttpStatus.OK);
//		
//	}
//	
//	
//	@RequestMapping(value="/{status}" ,method = RequestMethod.POST, headers="Accept=Application/json")
//	public ResponseEntity<Map<String , Object>> setApproveByAdmin(@PathVariable("status") int status){
//		Map<String,Object> map = new HashMap<String, Object>();
//		try{
//			if(userService.setApproveByAdmin(status)){
//				map.put("MESSAGE", "USER HAVE BEEN APPROVE");
//				map.put("STATUS", true);
//			}else{
//				map.put("MESSAGE", "NOT ADD USER");
//				map.put("STATUS", false);
//			}
//		}catch(Exception e){
//			map.put("MESSAGE", "Error!");
//			map.put("STATUS", false);
//			e.printStackTrace();
//		}
//		return new ResponseEntity<Map<String,Object>>(map , HttpStatus.OK);
//		
//	}
//	
//	
//	@RequestMapping(method=RequestMethod.PUT, headers = "Accept=Application/json")
//	public ResponseEntity<Map<String, Object>> updateUser(@RequestBody User user){
//		Map<String, Object> map = new HashMap<String , Object>();
//		try{
//			if(userService.updateUser(user)){
//				map.put("MESSAGE", "USER UPDATE");
//				map.put("STATUS", true);
//			}else{
//				map.put("MESSAGE", "USER NOT UPDATE");
//				map.put("STATUS", false);
//			}
//		}catch(Exception e){
//			map.put("MESSAGE", "Error!");
//			map.put("STATUS", false);
//			e.printStackTrace();
//		}
//		return new ResponseEntity<Map<String,Object>>(map , HttpStatus.OK);
//	}
//	
//	@RequestMapping(value="/{id}" , method = RequestMethod.DELETE, headers="Accept=Application/json")
//	public ResponseEntity<Map<String , Object>> deleteUser(@PathVariable("id") int id){
//		Map<String , Object> map = new HashMap<String,Object>();
//		try{
//			if(userService.deleteUser(id)){
//				map.put("MESSAGE", "USER DELETE");
//				map.put("STATUS" , true);
//			}else{
//				map.put("MESSAGE", "USER NOT DELETE");
//				map.put("STATUS" , false);
//			}
//		}catch(Exception e){
//			e.printStackTrace();
//			map.put("MESSAGE", "Error!");
//			map.put("STATUS" , false);
//		}
//		return new ResponseEntity<Map<String,Object>>(map , HttpStatus.OK);
//	}
	
}	

