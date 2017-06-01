package org.khmerslide.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.khmerslide.entities.Category;
//import org.khmerslide.entities.Doc_Type;
import org.khmerslide.entities.Document;
import org.khmerslide.entities.User;
import org.khmerslide.filter.FilterDocumentId;
import org.khmerslide.filter.FilterDocumentRecomment;
import org.khmerslide.filter.FilterSearchCategoryAndDocumentName;
import org.khmerslide.filter.FilterTotalDocumentByType;
import org.khmerslide.model.FormUserUpdate;
import org.khmerslide.model.InputDocument;
import org.khmerslide.model.UpdateDocument;
import org.khmerslide.model.UpdateLikeDocument;
import org.khmerslide.model.UpdateStatusDocument;
import org.khmerslide.model.UpdateViewDocument;
import org.khmerslide.services.DocumentService;
import org.khmerslide.utilities.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.drive.DriveFile;
import org.springframework.social.google.api.drive.UploadParameters;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;

import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.name.Rename;

@RestController
@RequestMapping(value = "/api/docs")
public class DocumentController {

	@Autowired
	private DocumentService documentService;

	@ResponseBody
	@RequestMapping(value = { "/get-document" }, method = RequestMethod.GET, headers = "Accept=Application/json")
	public ResponseEntity<Map<String, Object>> getDocument() {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			ArrayList<Document> docs = documentService.getDocument();
			if (!docs.isEmpty()) {
				map.put("DATA", docs);
				map.put("COUNT", docs.size());
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
	
/*====================================GET DOCUMENT BY SEARCH====================================*/
	
	@ResponseBody
	@RequestMapping(value={"/get-document-by-search"},method=RequestMethod.GET,headers="Accept=Application/json")
	public ResponseEntity<Map<String, Object>> getDocumentBySearch(
				@RequestParam(value ="page", required = false , defaultValue="1") int page,
				@RequestParam(value ="limit", required = false , defaultValue="15") int limit,
				/*@RequestParam(value = "cat_name",required = false, defaultValue="") String cat_name,
				@RequestParam(value = "doc_title",required = false,defaultValue="") String doc_title,*/
				@RequestParam(value = "search",required = false,defaultValue="") String search
				){
		Map<String , Object> map = new HashMap<String , Object>();
				Pagination pagination = new Pagination();
					pagination.setPage(page);
					pagination.setLimit(limit);
				FilterSearchCategoryAndDocumentName filter = new FilterSearchCategoryAndDocumentName();	
					filter.setSearch(search);
		try{
			ArrayList<Document> docs = documentService.getDocumentBySearch(filter, pagination);
			if(!docs.isEmpty()){
				map.put("DATA", docs);
				map.put("COUNT", docs.size());
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
	
	
	/*====================================GET DOCUMENT BY ID====================================*/
	@ResponseBody
	@RequestMapping(value={"/get-document-by-id"},method=RequestMethod.GET,headers="Accept=Application/json")
	public ResponseEntity<Map<String, Object>> getDocumentById(
			@RequestParam(value="doc_id",required=true) int doc_id
			){
		
		FilterDocumentId  filter = new FilterDocumentId();
			filter.setDoc_id(doc_id);
			
			
		Map<String , Object> map = new HashMap<String , Object>();
		try{
			ArrayList<Document> docs = documentService.getDocumentById(filter);
			if(!docs.isEmpty()){
				map.put("DATA", docs);
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
	
	
	/*====================================GET DOCUMENT USER ID====================================*/
	@ResponseBody
	@RequestMapping(value={"/get-document-by-user-id"},method=RequestMethod.GET,headers="Accept=Application/json")
	public ResponseEntity<Map<String, Object>> getDocumentByUserId(
			@RequestParam(value="user_id",required=true) int user_id,
			@RequestParam(value ="page", required = false , defaultValue="1") int page,
			@RequestParam(value ="limit", required = false , defaultValue="8") int limit
			
			){
		Pagination pagination = new Pagination();
			pagination.setPage(page);
			pagination.setLimit(limit);
		FilterDocumentId  filter = new FilterDocumentId();
			filter.setUser_id(user_id);
		Map<String , Object> map = new HashMap<String , Object>();
		try{
			ArrayList<Document> docs = documentService.getDocumnetByUserId(filter, pagination);
			if(!docs.isEmpty()){
				map.put("DATA", docs);
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
	
	/*====================================GET DOCUMENT POPULAR POST====================================*/
	@ResponseBody
	@RequestMapping(value={"/get-document-popular-post"},method=RequestMethod.GET,headers="Accept=Application/json")
	public ResponseEntity<Map<String, Object>> getDocumentPopularPost(
		/*	@RequestParam(value="like",required=false) int liked,
			@RequestParam(value="viewed",required=false) int viewed,*/
			@RequestParam(value ="page", required = false , defaultValue="1") int page,
			@RequestParam(value ="limit", required = false , defaultValue="15") int limit
			){
		
		Pagination pagination = new Pagination();
			pagination.setPage(page);
			pagination.setLimit(limit);
/*		FilterPopularPost  filter = new FilterPopularPost();
			filter.setLiked(liked);
			filter.setViewed(viewed);*/
			
		Map<String , Object> map = new HashMap<String , Object>();
		try{
			ArrayList<Document> docs = documentService.getDocumentPopularPost(pagination);
			if(!docs.isEmpty()){
				map.put("DATA", docs);
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
	
	
	/*====================================GET DOCUMENT RECENT POST====================================*/
	@ResponseBody
	@RequestMapping(value={"/get-document-recent-post"},method=RequestMethod.GET,headers="Accept=Application/json")
	public ResponseEntity<Map<String, Object>> getDocumentRecentPost(
			@RequestParam(value ="page", required = false , defaultValue="1") int page,
			@RequestParam(value ="limit", required = false , defaultValue="15") int limit
			){
		
		Pagination pagination = new Pagination();
			pagination.setPage(page);
			pagination.setLimit(limit);

		Map<String , Object> map = new HashMap<String , Object>();
		try{
			ArrayList<Document> docs = documentService.getDocumentRecentPost(pagination);
			if(!docs.isEmpty()){
				map.put("DATA", docs);
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
	
	
	/*====================================GET DOCUMENT RECOMMEND====================================*/
	@ResponseBody
	@RequestMapping(value={"/get-document-recomment"},method=RequestMethod.GET,headers="Accept=Application/json")
	public ResponseEntity<Map<String, Object>> getDocumentRecomment(
			@RequestParam(value="cat_id",required=true) int cat_id,
			@RequestParam(value ="page", required = false , defaultValue="1") int page,
			@RequestParam(value ="limit", required = false , defaultValue="5") int limit
			){
		Pagination pagination = new Pagination();
			pagination.setPage(page);
			pagination.setLimit(limit);
		FilterDocumentRecomment filter = new FilterDocumentRecomment();
			filter.setCat_id(cat_id);
			Map<String , Object> map = new HashMap<String , Object>();
		try{
			ArrayList<Document> docs = documentService.getAllDocumentRecomment(filter, pagination);
			if(!docs.isEmpty()){
				map.put("DATA", docs);
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

	
	/*====================================GET DOCUMENT BY CATEGORY ID====================================*/
	@ResponseBody
	@RequestMapping(value={"/get-document-by-categoryid"},method=RequestMethod.GET,headers="Accept=Application/json")
	public ResponseEntity<Map<String, Object>> getDocumentByCategoryId(
			@RequestParam(value ="page", required = false , defaultValue="1") int page,
			@RequestParam(value ="limit", required = false , defaultValue="15") int limit,
			@RequestParam(value = "cat_id",required = false,defaultValue="0") int cat_id,
			@RequestParam(value="doc_type_id",required = false,defaultValue ="0") int doc_type_id
			){
		Pagination pagination = new Pagination();
			pagination.setPage(page);
			pagination.setLimit(limit);
		FilterDocumentId filter = new FilterDocumentId();
			filter.setCat_id(cat_id);
			filter.setDoc_type(doc_type_id);
		Map<String , Object> map = new HashMap<String , Object>();
		try{
			ArrayList<Document> docs = documentService.getDocumentByCategoryId(filter, pagination);
			if(!docs.isEmpty()){
				map.put("DATA", docs);
				map.put("COUNT", docs.size());
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
	
	
	/*====================================GET DOCUMENT BY CATEGORY And Document Type====================================*/
	@ResponseBody
	@RequestMapping(value={"/get-document-by-category-and-type"},method=RequestMethod.GET,headers="Accept=Application/json")
	public ResponseEntity<Map<String, Object>> getDocumentByCategoryAndType(
			@RequestParam(value ="page", required = false , defaultValue="1") int page,
			@RequestParam(value ="limit", required = false , defaultValue="15") int limit,
			@RequestParam(value = "cat_id",required = true) int cat_id,
			@RequestParam(value="doc_type_id",required = true) int doc_type_id
			){
		Pagination pagination = new Pagination();
			pagination.setPage(page);
			pagination.setLimit(limit);
		FilterDocumentId filter = new FilterDocumentId();
			filter.setCat_id(cat_id);
			filter.setDoc_type(doc_type_id);
		Map<String , Object> map = new HashMap<String , Object>();
		try{
			ArrayList<Document> docs = documentService.getDocumentByCategoryAndType(filter, pagination);
			if(!docs.isEmpty()){
				map.put("DATA", docs);
				map.put("COUNT", docs.size());
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
	
	
/*====================================GET DOCUMENT TOTAL BY TYPE====================================*/
	
	@ResponseBody
	@RequestMapping(value={"/get-document-total-by-type"},method=RequestMethod.GET,headers="Accept=Application/json")
	public ResponseEntity<Map<String, Object>> getDocumentTotalByType(	
			@RequestParam(value="doc_type",required=false) int doc_type_id,
			@RequestParam(value="start_date",required=false) String start_date,
			@RequestParam(value="end_date",required=false) String end_date
			){	
		FilterTotalDocumentByType  filter = new FilterTotalDocumentByType();
			filter.setDoc_type_id(doc_type_id);
			filter.setStart_date(start_date);
			filter.setEnd_date(end_date);	
		Map<String , Object> map = new HashMap<String , Object>();
		try{
			Integer total = documentService.getDocumentTotalByType(filter);	
			if(total !=0){
				map.put("DATA", total);
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
	

	@RequestMapping(value = { "/add-ducument" }, method = RequestMethod.POST, headers = "Accept=Application/json")
	public ResponseEntity<Map<String, Object>> addDocument(@RequestBody InputDocument inputDocument) {


		// =========================Information of Document=========================

		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Document doc = new Document();
			doc.setDoc_title(inputDocument.getDoc_title());
			doc.setUploaded_date(inputDocument.getUploaded_date());
			doc.setUrl(inputDocument.getUrl());
			doc.setDescription(inputDocument.getDescription());
			doc.setStatus(inputDocument.getStatus());
			doc.setDoc_type_id(inputDocument.getDoc_type_id());
			User u = new User();
			u.setUser_id(inputDocument.getUser_id());
			doc.setUser(u);
			Category c = new Category();
			c.setCat_id(inputDocument.getCat_id());
			doc.setCat(c);
			doc.setThumbnail(inputDocument.getThumbnail());
			doc.setSource(inputDocument.getSource());
			System.out.println("Title " + inputDocument.getDoc_title());

			if (documentService.addDocument(doc)) {
				map.put("MESSAGE", "ADD DOCUMENT");
				map.put("STATUS", true);
			} else {
				map.put("MESSAGE", "NOT ADD DOCUMENT");
				map.put("STATUS", false);
			}
		} catch (Exception e) {
			map.put("MESSAGE", "Error!");
			map.put("STATUS", false);
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
	@RequestMapping(value = { "/add-ducument/file" }, method = RequestMethod.POST, headers = "Accept=Application/json")
	public ResponseEntity<Map<String, Object>> addDocument(@RequestParam("doc") CommonsMultipartFile file, HttpServletRequest request, @RequestParam("title") String title, @RequestParam("type") int type, @RequestParam("category") String category) {
		Document doc = new Document();
		System.out.println("FILE=" + file.getOriginalFilename());
		String filename = "";
		Map<String, Object> map = new HashMap<String, Object>();
			// =======================Document File===============================

			if (!file.isEmpty()) {
				String SavePath = request.getRealPath("/");
				SavePath = SavePath + "resources/static/document/";
				try {
					filename = file.getOriginalFilename();

					byte[] bytes = file.getBytes();

					System.out.println(file.getOriginalFilename());

					File originalPath = new File(SavePath);

					if (!originalPath.exists()) {
						System.out.println("NOT EXISTS");
						originalPath.mkdirs();
					}

					BufferedOutputStream stream = new BufferedOutputStream(
							new FileOutputStream(new File(SavePath + filename)));
					stream.write(bytes);
					stream.close();

					Set<String> scopes = new HashSet<>();
					scopes.add("https://www.googleapis.com/auth/drive");
					

					// <===================Toto: 1. Authentication with google drive api================>
					GoogleCredential googleCredential = new GoogleCredential.Builder()
							.setTransport(new NetHttpTransport()).setJsonFactory(JacksonFactory.getDefaultInstance())
							.setServiceAccountId("khmerslide@khmerslide.iam.gserviceaccount.com")
							.setServiceAccountScopes(scopes)
							.setServiceAccountPrivateKeyFromP12File(new File("KhmerSLIDE-8e9f607824e4.p12")).build();

					if (googleCredential.getAccessToken() == null) {
						googleCredential.refreshToken();
					}
					System.out.println("ACCESS TOKEN == " + googleCredential.getAccessToken());

					Google google = new GoogleTemplate(googleCredential.getAccessToken());

					String uploadFile = SavePath + filename;
					System.out.println("Upload FIle: " + uploadFile);

					Resource resource = new FileSystemResource(uploadFile);
					System.out.println(resource);
					System.out.println("this my url:"+ category);
					
					
// 					======================Checking Type of Document============================
					if(type == 1){
						DriveFile driveMeta = DriveFile.builder().setParents(category)
							.setTitle(title).setViewed(true).setRestricted(false)
							.setMimeType("application/vnd.google-apps.presentation")
							.build();
						UploadParameters parameters = new UploadParameters();
						DriveFile files = google.driveOperations().upload(resource, driveMeta, parameters);
						System.out.println(files.getId());
						System.out.println("You successfully uploaded " + SavePath + filename + "!");
						map.put("IMAGE_URL", SavePath + File.separator + filename);
						map.put("FILE_URL", files.getId());
//						String thumbnail = "https://drive.google.com/thumbnail?sz=w400-h280&id="+files.getId();
//						map.put("THUMBNAIL", thumbnail);
					}else if(type == 2){
						DriveFile driveMeta = DriveFile.builder().setParents(category)
								.setTitle(title).setViewed(true).setRestricted(false)
								.setMimeType("application/pdf")
								.build();
						UploadParameters parameters = new UploadParameters();
						DriveFile files = google.driveOperations().upload(resource, driveMeta, parameters);
						System.out.println(files.getId());
						System.out.println("You successfully uploaded " + SavePath + filename + "!");
						map.put("IMAGE_URL", SavePath + File.separator + filename);
						map.put("FILE_URL", files.getId());
					}else if(type == 3){
						DriveFile driveMeta = DriveFile.builder().setParents(category)
								.setTitle(title).setViewed(true).setRestricted(false)
								.setMimeType("application/vnd.google-apps.document")
								.build();
						UploadParameters parameters = new UploadParameters();
						DriveFile files = google.driveOperations().upload(resource, driveMeta, parameters);
						System.out.println(files.getId());
						System.out.println("You successfully uploaded " + SavePath + filename + "!");
						map.put("IMAGE_URL", SavePath + File.separator + filename);
						map.put("FILE_URL", files.getId());
					}
					
//					=======================Delete File from Server after Upload to Google Drive===========================
					File f = new File(SavePath + filename);
					 
		    		if(f.delete()){
		    			System.out.println(f.getName() + " is deleted!");
		    		}else{
		    			System.out.println("Delete operation is failed.");
		    		}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("You failed to upload " + filename + " => " + e.getMessage());
					map.put("IMAGE_URL", SavePath + File.separator + filename);
				}
			}else {
				System.out.println("You failed to upload " + filename + " because the file was empty.");
			}
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
	@RequestMapping(value = { "/add-ducument/thumbnail" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addDocument(@RequestParam("img") CommonsMultipartFile file,
			HttpServletRequest request) {
		System.out.println("FILE=" + file.getOriginalFilename());

		String filename = "";
		Map<String, Object> map = new HashMap<String, Object>();
		// =======================Document Thumbnails===============================

		if (!file.isEmpty()) {
			String originalSavePath = request.getRealPath("/");
			originalSavePath = originalSavePath + "resources/static/img/";
			String thumbnailSavePath = request.getRealPath("/") + "resources/static/img/thumbnails";
			String imagePath = "/resources/static/img/thumbnails/";
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
					Thumbnails.of(originalSavePath + filename).forceSize(400, 280).toFiles(thumbnailPath,
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

	

//	=============================================Update Document=====================================================
	@RequestMapping(value = { "/update-document" }, method = RequestMethod.PUT, headers = "Accept=Application/json")
	public ResponseEntity<Map<String, Object>> updateDocument(@RequestBody UpdateDocument document) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (documentService.updateDocument(document)) {
				map.put("MESSAGE", "UPDATE DOCUMENT");
				map.put("STATUS", true);
			} else {
				map.put("MESSAGE", "NOT UPDATE DOCUMENT");
				map.put("STATUS", false);
			}
		} catch (Exception e) {
			map.put("MESSAGE", "Error!");
			map.put("STATUS", false);
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
	
//	===========================Update Number View of Document=========================================================	
	@RequestMapping(value = { "/update-document/view" }, method = RequestMethod.PUT, headers = "Accept=Application/json")
	public ResponseEntity<Map<String, Object>> updateViewDocument(@RequestBody UpdateViewDocument document) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (documentService.updateViewDocument(document)) {
				map.put("MESSAGE", "UPDATE DOCUMENT");
				map.put("STATUS", true);
			} else {
				map.put("MESSAGE", "NOT UPDATE DOCUMENT");
				map.put("STATUS", false);
			}
		} catch (Exception e) {
			map.put("MESSAGE", "Error!");
			map.put("STATUS", false);
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
//	===========================Update Number View of Document=========================================================	
	@RequestMapping(value = { "/update-document/like" }, method = RequestMethod.PUT, headers = "Accept=Application/json")
	public ResponseEntity<Map<String, Object>> updateLikeDocument(@RequestBody UpdateLikeDocument document) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (documentService.updateLikeocument(document)) {
				map.put("MESSAGE", "UPDATE DOCUMENT");
				map.put("STATUS", true);
			} else {
				map.put("MESSAGE", "NOT UPDATE DOCUMENT");
				map.put("STATUS", false);
			}
		} catch (Exception e) {
			map.put("MESSAGE", "Error!");
			map.put("STATUS", false);
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}	
	
	
//	========================================================Delete Document=====================================================
	@RequestMapping(value={"/delete-document"},method=RequestMethod.PUT, headers = "Accept=Application/json")
	public ResponseEntity<Map<String, Object>> deleteUser(@RequestBody UpdateStatusDocument updateStatus){
		Map<String, Object> map = new HashMap<String , Object>();
		try{
			if(documentService.deleteDocument(updateStatus)){
				map.put("MESSAGE", "DOCUMENT DELETE");
				map.put("STATUS", true);
			}else{
				map.put("MESSAGE", "DOCUMENT NOT DELETE");
				map.put("STATUS", false);
			}
		}catch(Exception e){
			map.put("MESSAGE", "Error!");
			map.put("STATUS", false);
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String,Object>>(map , HttpStatus.OK);
	}

}
