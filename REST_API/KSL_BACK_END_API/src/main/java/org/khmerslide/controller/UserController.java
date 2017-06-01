package org.khmerslide.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.khmerslide.entities.User;
import org.khmerslide.entities.User_Type;
import org.khmerslide.model.FormUserInput;
import org.khmerslide.model.FormUserUpdate;
import org.khmerslide.model.FormUserUpdateStatus;
import org.khmerslide.model.UpdateUserProfile;
import org.khmerslide.passwordsecurity.BCrypt;
import org.khmerslide.services.UserService;
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
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.name.Rename;

//idovbcb

@Controller
@RequestMapping("/api/user")
public class UserController {
	@Autowired
	private UserService  userService;
	@ResponseBody
	@RequestMapping(value={"/get-user"},method=RequestMethod.GET, headers="Accept=Application/json")
	public ResponseEntity<Map<String, Object>> getUser(){
		Map<String , Object> map = new HashMap<String , Object>();
		try{
			ArrayList<User> users = userService.getUser();
			if(!users.isEmpty()){
				map.put("DATA", users);
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
	
	@ResponseBody
	@RequestMapping(value="/get-user/{id}" , method = RequestMethod.GET, headers="Accept=Application/json")
	public ResponseEntity<Map<String , Object>> getUserById(@PathVariable("id") int id){
		Map<String , Object> map = new HashMap<String,Object>();
		try{
			ArrayList<User> users = userService.getUserById(id);
			if(!users.isEmpty()){
				map.put("DATA", users);
				map.put("STATUS", true);
				map.put("MESSAGE", "DATA FOUND");
			}else{
				map.put("STATUS", false);
				map.put("MESSAGE", "DATA NOT FOUND");
			}
		}catch(Exception e){
			map.put("STATUS", false);
			map.put("MESSAGE", "ERROR!");
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String, Object>>(map ,HttpStatus.OK) ;
	}
	

	@RequestMapping(value={"/add-user"},method = RequestMethod.POST, headers="Accept=Application/json")
	public ResponseEntity<Map<String , Object>> addUser(@RequestBody FormUserInput inputUser){
		Map<String,Object> map = new HashMap<String, Object>();
		try{
			User u = new User();
			u.setUser_name(inputUser.getUser_name());
			u.setGender(inputUser.getGender());
			u.setEmail(inputUser.getEmail());
			u.setPassword(BCrypt.BCryptPassword(inputUser.getPassword()));
			u.setPhoto(inputUser.getPhoto());
			u.setRegistered_date(inputUser.getRegistered_date());
		
			u.setStatus(inputUser.getStatus());			
			User_Type  ut = new User_Type();
					ut.setRole_id(inputUser.getRole_id());
			u.setRole(ut);
			
			if(userService.addUser(u)){
				map.put("MESSAGE", "ADD USER");
				map.put("STATUS", true);
			}else{
				map.put("MESSAGE", "NOT ADD USER");
				map.put("STATUS", false);
			}
		}catch(Exception e){
			map.put("MESSAGE", "Error!");
			map.put("STATUS", false);
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String,Object>>(map , HttpStatus.OK);
		
	}
	
	
	@RequestMapping(value="/update-user-status" ,method = RequestMethod.PUT, headers="Accept=Application/json")
	public ResponseEntity<Map<String , Object>> setChangeStatusUser(@RequestBody FormUserUpdateStatus status){
		Map<String,Object> map = new HashMap<String, Object>();
		try{
			if(userService.setChangeStatusUser(status)){
				map.put("MESSAGE", "USER HAVE BEEN DELETE");
				map.put("STATUS", true);
			}else{
				map.put("MESSAGE", "NOT CANNOT BE DELETE");
				map.put("STATUS", false);
			}
		}catch(Exception e){
			map.put("MESSAGE", "Error!");
			map.put("STATUS", false);
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String,Object>>(map , HttpStatus.OK);
		
	}
	
	
//	=====================================Update User Profile Picture================================================
	@RequestMapping(value = { "/add-profile-picture/photo" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addUserProfilePicture(@RequestParam("img") CommonsMultipartFile file,
			HttpServletRequest request) {
		System.out.println("FILE=" + file.getOriginalFilename());

		String filename = "";
		Map<String, Object> map = new HashMap<String, Object>();

		if (!file.isEmpty()) {
			String originalSavePath = request.getRealPath("/");
			originalSavePath = originalSavePath + "resources/static/img/";
			String thumbnailSavePath = request.getRealPath("/") + "resources/static/img/users";
			String imagePath = "/resources/static/img/users/";
			System.out.println(thumbnailSavePath);
			try {
				filename = file.getOriginalFilename();

				byte[] bytes = file.getBytes();

				UUID uuid = UUID.randomUUID();

				String randomUUIDFileName = uuid.toString();

				String extension = filename.substring(filename.lastIndexOf(".") + 1);
				System.out.println(file.getOriginalFilename());
				System.out.println();

				File originalPath = new File(originalSavePath);

				if (!originalPath.exists()) {
					System.out.println("NOT EXISTS");
					originalPath.mkdirs();
				}

				File thumbnailPath = new File(thumbnailSavePath);

				if (!thumbnailPath.exists()) {
					System.out.println("NOT EXISTS");
					thumbnailPath.mkdirs();
				}
				//randomUUIDFileName += "-thumbnail";
				//System.out.println("==============> "+randomUUIDFileName);
				filename = randomUUIDFileName + "." + extension;
				//randomUUIDFileName += "."+extension;
			//	System.out.println("=================> full name: " + randomUUIDFileName);
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(new File(originalSavePath + filename)));
				stream.write(bytes);
				stream.close();

				try {
					// TODO: USING THUMBNAILS TO RESIZE THE IMAGE
					Thumbnails.of(originalSavePath + filename).forceSize(350, 350).toFiles(thumbnailPath,
							Rename.SUFFIX_HYPHEN_THUMBNAIL);
					String thumbnailName = randomUUIDFileName += "-thumbnail"+"."+extension; 
					
					System.out.println("===========>"+thumbnailName);
					
					System.out.println("You successfully uploaded " + thumbnailSavePath +"/"+ filename + "!");
					map.put("STATUS", true);
					map.put("MESSAGE", "Upload Success!");
					map.put("IMAGE_URL", thumbnailSavePath + File.separator + filename);
					map.put("IMAGE", imagePath + thumbnailName);
					
//					=======================Delete OriginalFile from Server===========================
					File f = new File(originalSavePath + filename);
					 
		    		if(f.delete()){
		    			System.out.println(f.getName() + " is deleted!");
		    		}else{
		    			System.out.println("Delete operation is failed.");
		    		}

				} catch (Exception ex) {
					stream = new BufferedOutputStream(new FileOutputStream(new File(originalPath + filename)));
					stream.write(bytes);
					stream.close();
				}

			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("You failed to upload " + filename + " => " + e.getMessage());
				map.put("IMAGE_URL", originalSavePath + File.separator + filename);
			}
		} else {
			System.out.println("You failed to upload " + filename + " because the file was empty.");
		}
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
	@RequestMapping(value={"/change-profile-picture/photo"},method=RequestMethod.PUT, headers = "Accept=Application/json")
	public ResponseEntity<Map<String, Object>> updateUserProfilePicture(@RequestBody UpdateUserProfile user){
		Map<String, Object> map = new HashMap<String , Object>();
		try{
			if(userService.updateUserProfilePicture(user)){
				map.put("MESSAGE", "USER UPDATE");
				map.put("STATUS", true);
			}else{
				map.put("MESSAGE", "USER NOT UPDATE");
				map.put("STATUS", false);
			}
		}catch(Exception e){
			map.put("MESSAGE", "Error!");
			map.put("STATUS", false);
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String,Object>>(map , HttpStatus.OK);
	}

	
	
	@RequestMapping(value={"/update-user"},method=RequestMethod.PUT, headers = "Accept=Application/json")
	public ResponseEntity<Map<String, Object>> updateUser(@RequestBody FormUserUpdate user){
		Map<String, Object> map = new HashMap<String , Object>();

		user.setPassword(BCrypt.BCryptPassword(FormUserUpdate.getPassword()));

		try{
			if(userService.updateUser(user)){
				map.put("MESSAGE", "USER UPDATE");
				map.put("STATUS", true);
			}else{
				map.put("MESSAGE", "USER NOT UPDATE");
				map.put("STATUS", false);
			}
		}catch(Exception e){
			map.put("MESSAGE", "Error!");
			map.put("STATUS", false);
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String,Object>>(map , HttpStatus.OK);
	}
	
	@RequestMapping(value="/delete-user/{id}" , method = RequestMethod.DELETE, headers="Accept=Application/json")
	public ResponseEntity<Map<String , Object>> deleteUser(@PathVariable("id") int id){
		Map<String , Object> map = new HashMap<String,Object>();
		try{
			if(userService.deleteUser(id)){
				map.put("MESSAGE", "USER DELETE");
				map.put("STATUS" , true);
			}else{
				map.put("MESSAGE", "USER NOT DELETE");
				map.put("STATUS" , false);
			}
		}catch(Exception e){
			e.printStackTrace();
			map.put("MESSAGE", "Error!");
			map.put("STATUS" , false);
		}
		return new ResponseEntity<Map<String,Object>>(map , HttpStatus.OK);
	}
	
	
	
	/*------------------------------------------------------------------------------
	 * 
	 * 
	 * SECURITY USER LOGIN AND CONTROLLER WITH ADMIN USER 
	 * 
	 * 
	 * 
	 * ----------------------------------------------------------------------------*/

	@RequestMapping(value="/find-user-by-username",method=RequestMethod.POST)
	@ResponseBody
	public org.khmerslide.security.User getUser(@RequestBody String email){
			System.out.println("userEmail ==>" + email);
			org.khmerslide.security.User user =  userService.findUserByEmail(email);
			System.out.println(user);
			return user;
	
	}
	
}	

