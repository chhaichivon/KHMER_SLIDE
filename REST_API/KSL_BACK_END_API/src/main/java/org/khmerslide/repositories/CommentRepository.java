package org.khmerslide.repositories;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.khmerslide.entities.Comment;
import org.khmerslide.filter.CategorySelectProvider;
import org.khmerslide.filter.CommentSelectProvider;
import org.khmerslide.filter.FilterCategory;
import org.khmerslide.filter.FilterComment;
import org.khmerslide.utilities.Pagination;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentRepository {
	/*Status 
	    1 Not Active
		2.delete
	 */
	/*String G_CM="SELECT" 
			+" C.cmt_id,"
			+" C.cmt_text,"
			+" C.cmt_date,"
			+" C.status,"
			+" U.user_name,"
			+" D.doc_title" 
			+" FROM" 
			+" ksl_comment C"
			+" FULL JOIN ksl_user U ON C.user_id = U.user_id"
			+" FULL JOIN ksl_document D ON C.doc_id = D.doc_id"
			+" WHERE C.status = 1"
			+" LIMIT #{pagination.limit}"
			+" OFFSET #{pagination.offset}";*/
	
//	======================================Get All Comment=====================================
	@SelectProvider(type = CommentSelectProvider.class, method = "findAndManagementComment")
	@Results(value={
			@Result(property="cmt_text",column="cmt_text"),
			@Result(property="cmt_date",column="cmt_date"),
			@Result(property="user.user_name",column="user_name"),
			@Result(property="doc.doc_title",column="doc_title")
	})
	public ArrayList<Comment> getComment(
			@Param("filter") FilterComment filter,
			@Param("pagination") Pagination pagination);
	
//	===========================Get Comment By ID===========================
	String G_CMBI="SELECT" 
			+" C.cmt_id,"
			+" C.cmt_text,"
			+" C.cmt_date,"
			+" C.status,"
			+" U.user_name,"
			+" D.doc_title" 
			+" FROM" 
			+" ksl_comment C"
			+" FULL JOIN ksl_user U ON C.user_id = U.user_id"
			+" FULL JOIN ksl_document D ON C.doc_id = D.doc_id"
			+" WHERE C.status = 1"
			+" AND"
			+" C.cmt_id=#{id};";
	@Select(G_CMBI)
	@Results(value={
			@Result(property="user.user_name",column="user_name"),
			@Result(property="doc.doc_title",column="doc_title")
	})
	public ArrayList<Comment> getCommentById(int id);
	
	
//	=========================Get Comment by Doc Id=======================	
	String G_CMBDI="SELECT" 
			+" C.cmt_id,"
			+" C.cmt_text,"
			+" C.cmt_date,"
			+" C.status,"
			+" U.user_id,"
			+" U.user_name,"
			+" U.photo,"
			+" D.doc_id,"
			+" D.doc_title" 
			+" FROM" 
			+" ksl_comment C"
			+" FULL JOIN ksl_user U ON C.user_id = U.user_id"
			+" FULL JOIN ksl_document D ON C.doc_id = D.doc_id"
			+" WHERE C.status = 1"
			+" AND"
			+" D.doc_id=#{id};";
	@Select(G_CMBDI)
	@Results(value={
			@Result(property="user.user_id",column="user_id"),
			@Result(property="user.user_name",column="user_name"),
			@Result(property="user.photo",column="photo"),
			@Result(property="doc.doc_id",column="doc_id"),
			@Result(property="doc.doc_title",column="doc_title")
	})
	public ArrayList<Comment> getCommentByDocId(int id);
	
	
//	============================Insert Comment========================	
	String A_CM="INSERT INTO "
			+ "ksl_comment("
			+ "cmt_text,"
			+ "cmt_date,"
			+ "status,"
			+ "user_id,"
			+ "doc_id,"
			+ "description)"
			+ "VALUES("
			+ "#{cmt_text},"
			+ "#{cmt_date},"
			+ "#{status},"
			+ "#{user.user_id},"
			+ "#{doc.doc_id},"
			+ "#{description})";
	@Insert(A_CM)
	@Results(value={
			@Result(property="user.user_id",column="user_id"),
			@Result(property="doc.doc_id",column="doc_id")
	})
	public boolean addComment(Comment comment);
	
//	==========================Update Comment========================	
	String U_CM="UPDATE ksl_comment"
			+" SET"
			+" cmt_text=#{cmt_text}"
			+" WHERE"
			+" cmt_id=#{cmt_id}";
	@Update(U_CM)
	public boolean updateComment(Comment comment);
	
	
//	============================Delete Comment=========================	
	String D_CM="UPDATE ksl_comment"
			+" SET"
			+" status=3"
			+" WHERE"
			+" cmt_id=#{cmt_id}";
	@Delete(D_CM)
	public boolean deleteComment(int cmt_id);
}
