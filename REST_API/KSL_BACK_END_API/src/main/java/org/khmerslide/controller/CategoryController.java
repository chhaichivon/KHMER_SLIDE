package org.khmerslide.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.khmerslide.entities.Category;
import org.khmerslide.entities.User;
import org.khmerslide.model.InputCategory;
import org.khmerslide.model.UpdateCategory;
import org.khmerslide.services.CategoryService;
import org.khmerslide.utilities.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.drive.DriveFile;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;

@Controller
@RequestMapping(value = "/api/category")
public class CategoryController {
	@Autowired
	private CategoryService categoryService;

//	==================================Get All Category==========================================================
	@ResponseBody
	@RequestMapping(value = { "/get-category" }, method = RequestMethod.GET, headers = "Accept=Application/json")
	public ResponseEntity<Map<String, Object>> getCategory() {
		Map<String, Object> map = new HashMap<String, Object>();
		Pagination pagination = new Pagination();
		// pagination.setPage(page);
		// pagination.setLimit(limit);
		try {
			ArrayList<Category> cateogry = categoryService.getCategory();
			if (!cateogry.isEmpty()) {
				map.put("DATA", cateogry);
				map.put("STATUS", true);
				map.put("MESSAGE", "DATA FOUND!");
			} else {
				map.put("STATUS", true);
				map.put("MESSAGE", "DATA NOT FOUND!");
			}
		} catch (Exception e) {
			map.put("STATUS", false);
			map.put("MESSAGE", "ERROR!");
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}

	
//	==============================Get Category By ID========================================================	
	@ResponseBody
	@RequestMapping(value = {
			"/get-category-by-id/{cat_id}" }, method = RequestMethod.GET, headers = "Accept=Application/json")
	public ResponseEntity<Map<String, Object>> getCategoryById(@PathVariable("cat_id") int cat_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			ArrayList<Category> cateogry = categoryService.getCategoryById(cat_id);
			if (!cateogry.isEmpty()) {
				map.put("DATA", cateogry);
				map.put("STATUS", true);
				map.put("MESSAGE", "DATA FOUND!");
			} else {
				map.put("STATUS", true);
				map.put("MESSAGE", "DATA NOT FOUND!");
			}
		} catch (Exception e) {
			map.put("STATUS", false);
			map.put("MESSAGE", "ERROR!");
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
	
//	==============================Get Category By Parent ID========================================================	
	@ResponseBody
	@RequestMapping(value = {
			"/get-category-by-parent-id/{cat_id}" }, method = RequestMethod.GET, headers = "Accept=Application/json")
	public ResponseEntity<Map<String, Object>> getCategoryByParentId(@PathVariable("cat_id") int cat_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			ArrayList<Category> cateogry = categoryService.getSubCategoryByParentId(cat_id);
			if (!cateogry.isEmpty()) {
				map.put("DATA", cateogry);
				map.put("STATUS", true);
				map.put("MESSAGE", "DATA FOUND!");
			} else {
				map.put("STATUS", true);
				map.put("MESSAGE", "DATA NOT FOUND!");
			}
		} catch (Exception e) {
			map.put("STATUS", false);
			map.put("MESSAGE", "ERROR!");
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
	
//	=============================Get Main Category==================================================	
	@ResponseBody
	@RequestMapping(value = {
			"/get-main-category" }, method = RequestMethod.GET, headers = "Accept=Application/json")
	public ResponseEntity<Map<String, Object>> getMainCategory() {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			ArrayList<Category> cateogry = categoryService.getMainCategory();
			if (!cateogry.isEmpty()) {
				map.put("DATA", cateogry);
				map.put("STATUS", true);
				map.put("MESSAGE", "DATA FOUND!");
			} else {
				map.put("STATUS", true);
				map.put("MESSAGE", "DATA NOT FOUND!");
			}
		} catch (Exception e) {
			map.put("STATUS", false);
			map.put("MESSAGE", "ERROR!");
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}


//	============================================Add Category======================================================
	@RequestMapping(value = { "/add-category" }, method = RequestMethod.POST, headers = "Accept=Application/json")
	public ResponseEntity<Map<String, Object>> addCategory(@RequestBody InputCategory inputcategory) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Set<String> scopes = new HashSet<>();
			scopes.add("https://www.googleapis.com/auth/drive");

			// Toto: 1. Authentication with google drive api
			GoogleCredential googleCredential = new GoogleCredential.Builder().setTransport(new NetHttpTransport())
					.setJsonFactory(JacksonFactory.getDefaultInstance())
					.setServiceAccountId("khmerslide@khmerslide.iam.gserviceaccount.com")
					.setServiceAccountScopes(scopes)
					.setServiceAccountPrivateKeyFromP12File(new File("KhmerSLIDE-8e9f607824e4.p12")).build();

			if (googleCredential.getAccessToken() == null) {
				googleCredential.refreshToken();
			}
			System.out.println("ACCESS TOKEN == " + googleCredential.getAccessToken());

			Google google = new GoogleTemplate(googleCredential.getAccessToken());
			// Ending of Authentication

			Category cat = new Category();
			Category parentCategory = new Category();

			parentCategory.setCat_id(inputcategory.getParent_id());
			parentCategory.setFolder_google_drive(inputcategory.getFolder_google_drive());

			cat.setParent(parentCategory);
			cat.setCat_name(inputcategory.getCat_name());
			cat.setCreated_date(inputcategory.getCreated_date());
			cat.setStatus(inputcategory.getStatus());
			/* cat.setStatus(inputcategory.getStatus()); */

			User u = new User();
			u.setUser_id(inputcategory.getUser_id());

			cat.setUser(u);
			cat.setDescription(inputcategory.getDescription());
			cat.setIcon(inputcategory.getIcon());

			// Todo: 2.create folder in google drive
			// check whether the created category has its parent or not
			if (inputcategory.getParent_id() == 0) {
				DriveFile folder = google.driveOperations().createFolder("0B2WJOSpqcAkyNlQ3Vmd4b3BGTjQ",
						cat.getCat_name());

				cat.setFolder_google_drive(folder.getId());
			} else {
				System.out.println(inputcategory.getParent_id());
				String parentFolderId = inputcategory.getFolder_google_drive();
				System.out.println("Parent :" + parentFolderId);
				try {
					DriveFile folderInfo = google.driveOperations().createFolder(parentFolderId.trim(),
							cat.getCat_name());
					cat.setFolder_google_drive(folderInfo.getId());
					System.out.println(folderInfo.getId());
				} catch (Exception ex) {
					ex.printStackTrace();
				}

			}
			// End of Creating folder

			// System.out.println(cat.getFolder_google_drive());
			// System.out.println(folder.getId());

			if (categoryService.addCategory(cat)) {
				map.put("MESSAGE", "ADD CATEGORY");
				map.put("STATUS", true);
			} else {
				map.put("MESSAGE", "NOT ADD CATEGORY");
				map.put("STATUS", false);
			}
		} catch (Exception e) {
			map.put("MESSAGE", "Error!");
			map.put("STATUS", false);
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

	}


//	====================================Update Category======================================================
	@RequestMapping(value={"/update-category"},method=RequestMethod.PUT, headers = "Accept=Application/json")
	public ResponseEntity<Map<String, Object>> updateUser(@RequestBody UpdateCategory category){
		Map<String, Object> map = new HashMap<String , Object>();
		try{
			if(categoryService.updateCategory(category)){
				map.put("MESSAGE", "CATEGORY UPDATE");
				map.put("STATUS", true);
			}else{
				map.put("MESSAGE", "CATEGORY NOT UPDATE");
				map.put("STATUS", false);
			}
		}catch(Exception e){
			map.put("MESSAGE", "Error!");
			map.put("STATUS", false);
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String,Object>>(map , HttpStatus.OK);
	}
	
	
//	===================================Delete Category=========================================================
	@RequestMapping(value = {
			"/delete-category/{cat_id}" }, method = RequestMethod.DELETE, headers = "Accept=Application/json")
	public ResponseEntity<Map<String, Object>> deleteCategory(@PathVariable("cat_id") int cat_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (categoryService.deleteCategory(cat_id)) {
				map.put("MESSAGE", "DELETE CATEGORY");
				map.put("STATUS", true);
			} else {
				map.put("MESSAGE", "NOT DELETE CATEGORY");
				map.put("STATUS", false);
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("MESSAGE", "Error!");
			map.put("STATUS", false);
		}
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
}