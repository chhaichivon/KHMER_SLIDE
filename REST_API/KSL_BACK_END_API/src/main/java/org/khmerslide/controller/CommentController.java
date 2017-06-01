package org.khmerslide.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.khmerslide.entities.Category;
import org.khmerslide.entities.Comment.updateComment;
import org.khmerslide.entities.Comment;
import org.khmerslide.entities.Document;
import org.khmerslide.entities.User;
import org.khmerslide.filter.FilterComment;
import org.khmerslide.model.InputComment;
import org.khmerslide.model.InputComment.UpdateComment;
import org.khmerslide.model.InputCategory;
import org.khmerslide.services.CommentService;
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

@Controller
@RequestMapping(value="/api/comment")
public class CommentController {
	@Autowired
	private CommentService commentService;
	@ResponseBody
	@RequestMapping(value={"/get-comment"},method=RequestMethod.GET,headers="Accept=Application/json")
	public ResponseEntity<Map<String, Object>> getComment(
			@RequestParam(value="page",required = false,defaultValue="1") int page, 
			@RequestParam(value="limit",required = false,defaultValue ="10") int limit,
			@RequestParam(value="cmt_text",required = false) String cmt_text,
			@RequestParam(value="cmt_date",required = false) String cmt_date,
			@RequestParam(value="doc_title",required = false) String doc_title,
			@RequestParam(value="user_name",required=false) String user_name){
		Map<String , Object> map = new HashMap<String , Object>();
		Pagination pagination = new Pagination();
			pagination.setPage(page);
			pagination.setLimit(limit);
		FilterComment  filter = new FilterComment();
			filter.setCmt_text(cmt_text);
			filter.setCmt_date(cmt_date);
			filter.setDoc_title(doc_title);
			filter.setUser_name(user_name);
		try{
			ArrayList<Comment> comment = commentService.getComment(filter,pagination);
			if(!comment.isEmpty()){
				map.put("DATA", comment);
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
	
	
//	======================================Get Comment By ID====================================================	
	@ResponseBody
	@RequestMapping(value={"/get-comment/{cmt_id}"},method=RequestMethod.GET,headers="Accept=Application/json")
	public ResponseEntity<Map<String, Object>> getCommentById(@PathVariable("cmt_id") int cmt_id){
		Map<String , Object> map = new HashMap<String , Object>();
		try{
			ArrayList<Comment> comment = commentService.getCommentById(cmt_id);
			if(!comment.isEmpty()){
				map.put("DATA", comment);
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
	
//	======================================Get Comment By Document ID====================================================	
	@ResponseBody
	@RequestMapping(value={"/get-comment-by/{doc_id}"},method=RequestMethod.GET,headers="Accept=Application/json")
	public ResponseEntity<Map<String, Object>> getCommentByDocId(@PathVariable("doc_id") int doc_id){
		Map<String , Object> map = new HashMap<String , Object>();
		try{
			ArrayList<Comment> comment = commentService.getCommentByDocId(doc_id);
			if(!comment.isEmpty()){
				map.put("DATA", comment);
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
	
	
	
	@RequestMapping(value={"/add-comment"},method = RequestMethod.POST, headers="Accept=Application/json")
	public @ResponseBody ResponseEntity<Map<String , Object>> addComment(@RequestBody InputComment insertcomment){
		Map<String,Object> map = new HashMap<String, Object>();
		try{
			Comment com = new Comment();
			com.setCmt_text(insertcomment.getCmt_text());
			com.setCmt_date(insertcomment.getCmt_date());
			com.setStatus(insertcomment.getStatus());
			 	User  u = new User();
			 		u.setUser_id(insertcomment.getUser_id());
			com.setUser(u);
				Document d = new Document();
				d.setDoc_id(insertcomment.getDoc_id());
			com.setDoc(d);
			com.setDescription(insertcomment.getDescription());
			if(commentService.addComment(com)){
				map.put("MESSAGE", "ADD COMMENT");
				map.put("STATUS", true);
			}else{
				map.put("MESSAGE", "NOT ADD COMMENT");
				map.put("STATUS", false);
			}
		}catch(Exception e){
			map.put("MESSAGE", "Error!");
			map.put("STATUS", false);
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String,Object>>(map , HttpStatus.OK);
		
	}
	
	@RequestMapping(value={"/update-comment/{cmt_id}"},method=RequestMethod.PUT, headers = "Accept=Application/json")
	public ResponseEntity<Map<String, Object>> updateComment(@PathVariable("cmt_id") int cmt_id ,@RequestBody UpdateComment updatecomment){
		Map<String, Object> map = new HashMap<String , Object>();
		try{
				Comment C = new Comment();
				C.setCmt_id(cmt_id); //set cmt_id
				C.setCmt_text(updatecomment.getCmt_text());
				//user can comment only text
			if(commentService.updateComment(C)){
				map.put("MESSAGE", "UPDATE COMMENT");
				map.put("STATUS", true);
			}else{
				map.put("MESSAGE", "NOT UPDATE COMMENT");
				map.put("STATUS", false);
			}
		}catch(Exception e){
			map.put("MESSAGE", "Error!");
			map.put("STATUS", false);
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String,Object>>(map , HttpStatus.OK);
	}
	
	
	
	@RequestMapping(value="delete-comment/{cmt_id}" , method = RequestMethod.DELETE, headers="Accept=Application/json")
	public ResponseEntity<Map<String , Object>> deleteCategory(@PathVariable("cmt_id") int cmt_id){
		Map<String , Object> map = new HashMap<String,Object>();
		try{
			if(commentService.deleteComment(cmt_id)){
				map.put("MESSAGE", "DELETE COMMENT");
				map.put("STATUS" , true);
			}else{
				map.put("MESSAGE", "NOT DELETE COMMENT");
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
