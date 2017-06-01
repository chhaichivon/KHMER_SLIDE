package org.khmerslide.repositories;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.khmerslide.entities.View_History;
import org.khmerslide.filter.FilterViewHistory;
import org.khmerslide.utilities.Pagination;
import org.springframework.stereotype.Repository;

@Repository
public interface ViewHistoryRepository {
	/*  Status 
    1 active
	2.disactive
	3.delete
	 */
	/*====================================GET VIEW HISTRORY====================================*/
	String G_VH="SELECT" 
			+" VH.vh_id,"
			+" VH.added_date,"
			+" U.user_id,"
			+" U.user_name,"
			+" U.gender,"    
			+" U.email,"
			+" U.password,"
			+" U.registered_date,"
			+" U.photo,"
			+" U.description,"
			+" U.status,"
			+" D.doc_title,"
			+" D.uploaded_date,"
			+" D.url,"
			+" D.liked,"
			+" D.shared,"
			+" D.viewed,"
			+" D.description,"
			+" D.status,"
			+" D.thumbnail,"
			+" D.source,"
			+" VH.description"
			+" FROM"
			+" ksl_view_history VH"
			+" INNER JOIN ksl_user U ON VH.user_id = U.user_id"
			+" INNER JOIN ksl_document D ON VH.doc_id = D.doc_id"
			+" LIMIT #{pagination.limit}"
			+" OFFSET #{pagination.offset}";
	@Select(G_VH)
	@Results(value={
			@Result(property="user.user_id",column="user_id"),
			@Result(property="user.user_name",column="user_name"),
			@Result(property="user.gender",column="gender"),
			@Result(property="user.email",column="email"),
			@Result(property="user.password",column="password"),
			@Result(property="user.registered_date",column="registered_date"),
			@Result(property="user.photo",column="photo"),
		/*	@Result(property="user.description",column="description"),*/
		/*	@Result(property="user.status",column="status"),*/
			@Result(property="doc.doc_title",column="doc_title"),
			@Result(property="doc.uploaded_date",column="uploaded_date"),
			@Result(property="doc.url",column="url"),
			@Result(property="doc.liked",column="liked"),
			@Result(property="doc.shared",column="shared"),
			@Result(property="doc.viewed",column="viewed"),
	/*		@Result(property="doc.description",column="description"),*/
		/*	@Result(property="doc.status",column="status"),*/
			@Result(property="doc.thumbnail",column="thumbnail"),
			@Result(property="doc.source",column="source")
			
	})
	public ArrayList<View_History> getViewHistory(@Param("pagination") Pagination pagination);
	
	/*====================================GET VIEW HISTORY BY USER ID====================================*/
	String GVHB_USER_ID="SELECT" 
			+" VH.vh_id,"
			+" VH.added_date,"
			+" U.user_id,"
			+" U.user_name,"
			+" U.gender,"
			+" U.email,"
			+" D.doc_id,"
			+" D.doc_title,"
			+" D.thumbnail,"
			+" D.liked,"
			+" D.shared,"
			+" D.viewed,"
			+" D.uploaded_date,"
			+" C.cat_id,"
			+" VH.description"
			+" FROM"
			+" ksl_view_history VH"
			+" INNER JOIN ksl_user U ON VH.user_id = U.user_id"
			+" INNER JOIN ksl_document D ON VH.doc_id = D.doc_id"
			+" INNER JOIN ksl_category C ON C.cat_id = D.cat_id"
			+" WHERE"
			+" D.status = 1 AND VH.status = 1"
			+" AND"
			+" U.user_id =#{filter.user_id}"
			+" ORDER BY D.doc_id DESC OFFSET #{pagination.offset} LIMIT #{pagination.limit}";
	@Select(GVHB_USER_ID)
	@Results(value={
			@Result(property="user.user_id",column="user_id"),
			@Result(property="user.user_name",column="user_name"),
			@Result(property="user.gender",column="gender"),
			@Result(property="user.email",column="email"),
			@Result(property="doc.doc_id",column="doc_id"),
			@Result(property="doc.cat.cat_id",column="cat_id"),
			@Result(property="doc.doc_title",column="doc_title"),
			@Result(property="doc.thumbnail",column="thumbnail"),
			@Result(property="doc.liked",column="liked"),
			@Result(property="doc.shared",column="shared"),
			@Result(property="doc.viewed",column="viewed"),
			@Result(property="doc.uploaded_date",column="uploaded_date")
	})
	
	public ArrayList<View_History> getViewHistoryByUserId(
			@Param("filter")FilterViewHistory filter,
			@Param("pagination")Pagination pagination);
	
	/*====================================GET VIEW HISTORY BY ID====================================*/
	String G_VHBI="SELECT" 
			+" VH.vh_id,"
			+" VH.added_date,"
			+" U.user_name,"
			+" D.doc_title,"
			+" VH.description,"
			+" FROM"
			+" ksl_view_history VH"
			+" INNER JOIN ksl_user U ON VH.user_id = U.user_id"
			+" INNER JOIN ksl_document D ON VH.doc_id = D.doc_id"
			+" WHERE"
			+" VH.vh_id=#{id}";
	@Select(G_VHBI)
	@Results(value={
			@Result(property="user.user_name",column="user_name"),
			@Result(property="doc.doc_title",column="doc_title")
	})
	public ArrayList<View_History> getViewHistoryById(int id);
	
	/*====================================ADD VIEW HISTORY====================================*/
	String A_VH="INSERT INTO"
			+" ksl_view_history("
			+" added_date,"
			+" user_id,"
			+" doc_id,"
			+" description)"
			+" VALUES("
			+" #{added_date},"
			+" #{user.user_id},"
			+" #{doc.doc_id},"
			+" #{description})";
	@Insert(A_VH)
	@Results(value={
			@Result(property="user.user_id",column="user_id"),
			@Result(property="doc.doc_id",column="doc_id")
	})
	public boolean addViewHistory(View_History vh);
	
	/*====================================UPDATE VIEW HISTORY====================================*/
	String U_VH="UPDATE ksl_view_history SET "
			+" doc_id=#{doc.doc_id},"
			+" description=#{description},"
			+" status=#{status}"
			+" WHERE"
			+" vh_id=#{vh_id}";
	@Update(U_VH)
	public boolean updateViewHistory(View_History vh);
	
	/*====================================DELETE VIEW HISTORY====================================*/
	String D_VH="UPDATE ksl_view_history SET"
			+" status=3"
			+" vh_id=#{vh_id}";
	@Delete(D_VH)
	public boolean deleteViewHistory(int vh_id);
	
	/*====================================DELETE VIEW HISTORY BY USER ID====================================*/
	final String DELETE_VIEW_HISTORY_USER_ID="UPDATE"
			+" ksl_view_history"
			+" SET"
			+" status=3"
			+" WHERE"
			+" user_id=#{userId}";
	@Update(DELETE_VIEW_HISTORY_USER_ID)
	public boolean deleteViewHistoryByUserId(int userId);
}