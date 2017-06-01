package org.khmerslide.filter;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.web.bind.annotation.PathVariable;

public class DocumentSelectProvider {
	
	
	
	/*select and search document detail*/
	public static String findAllDocument(Map<String,Object> param){
		
		
		FilterDocument  filter = (FilterDocument) param.get("filter");
		String sql = new SQL(){
			{
				SELECT("D.doc_id,"
						+" D.doc_title,"
						+" D.uploaded_date,"
						+" D.url,"
						+" D.liked,"
						+" D.shared,"
						+" D.viewed,"
						+" D.description,"
						+" D.status,"
						+" D.doc_type_id,"
						+" U.user_id,"
						+" U.user_name,"
						+" CT.cat_name,"
						+" D.thumbnail,"
						+" D.source");
				FROM("ksl_document D");
				INNER_JOIN("ksl_category CT ON D.cat_id = CT.cat_id");
				INNER_JOIN("ksl_user U ON D.user_id = U.user_id");
				WHERE("D.status !=3");
					if (filter.getStatus()!=0) {
						WHERE("D.status = #{filter.status}");
					}
					if (filter.getUser_name() != null) {
						WHERE("LOWER(U.user_name) LIKE LOWER('%' || #{filter.user_name} || '%')");
					}
					if(filter.getUploaded_date() != null){
						WHERE("LOWER(D.uploaded_date) LIKE LOWER('%' || #{filter.uploaded_date} || '%')");
					}
					if(filter.getDoc_title() != null){
						WHERE("LOWER(D.doc_title) LIKE LOWER('%' || #{filter.doc_title} || '%')");
					}
					if(filter.getCat_name() !=null){
						WHERE("LOWER(CT.cat_name) LIKE LOWER('%' || #{filter.cat_name} || '%')");
					}
					ORDER_BY("D.doc_id DESC OFFSET #{pagination.offset} LIMIT #{pagination.limit}");
			}
		}.toString();
		return sql;
	}
	
	
	/*select and search document detail*/
	public static String findDocumentById(Map<String,Object> param){
		FilterDocumentId  filter = (FilterDocumentId) param.get("filter");
		String sql = new SQL(){
			{
				SELECT("D.doc_id,"
						+" D.doc_title,"
						+" D.uploaded_date,"
						+" D.url,"
						+" D.liked,"
						+" D.shared,"
						+" D.viewed,"
						+" D.description,"
						+" D.status,"
						+" D.doc_type_id,"
						+" U.user_id,"
						+" U.user_name,"
						+" U.photo,"
						+" CT.cat_id,"
						+" CT.cat_name,"
						+" D.thumbnail,"
						+" D.source");
				FROM("ksl_document D");
				INNER_JOIN("ksl_category CT ON D.cat_id = CT.cat_id");
				INNER_JOIN("ksl_user U ON D.user_id = U.user_id");
				WHERE("D.status !=3");
					if (filter.getDoc_id() != 0) {
						WHERE("D.doc_id = #{filter.doc_id}");
					}
			}
		}.toString();
		return sql;
	}
	
	/*USER DOCUMENT BY USER ID*/
	public static String findDocumentByUserId(Map<String,Object> param){
		FilterDocumentId  filter = (FilterDocumentId) param.get("filter");
		String sql = new SQL(){
			{
				SELECT("D.doc_id,"
						+" D.doc_title,"
						+" D.uploaded_date,"
						+" D.url,"
						+" D.liked,"
						+" D.shared,"
						+" D.viewed,"
						+" D.description,"
						+" D.status,"
						+" D.doc_type_id,"
						+" U.user_id,"
						+" U.user_name,"
						+" CT.cat_id,"
						+" CT.cat_name,"
						+" D.thumbnail,"
						+" D.source");
				FROM("ksl_document D");
				INNER_JOIN("ksl_category CT ON D.cat_id = CT.cat_id");
				INNER_JOIN("ksl_user U ON D.user_id = U.user_id");
				WHERE("D.status !=3  AND"
						+" U.user_id = #{filter.user_id}");
				ORDER_BY("D.doc_id DESC OFFSET #{pagination.offset} LIMIT #{pagination.limit}");
			}
		}.toString();
		return sql;
	}
	
	/*select and search document popular post*/
	public static String findAllDocumentPopularPost(Map<String,Object> param){
	/*	FilterPopularPost  filter = (FilterPopularPost) param.get("filter");*/
		String sql = new SQL(){
			{
				SELECT("D.doc_id,"
						+" D.doc_title,"
						+" D.uploaded_date,"
						+" D.url,"
						+" D.liked,"
						+" D.shared,"
						+" D.viewed,"
						+" D.description,"
						+" D.status,"
						+" D.doc_type_id,"
						+" U.user_name,"
						+" CT.cat_id,"
						+" CT.cat_name,"
						+" D.thumbnail,"
						+" D.source");
				FROM("ksl_document D");
				INNER_JOIN("ksl_category CT ON D.cat_id = CT.cat_id");
				INNER_JOIN("ksl_user U ON D.user_id = U.user_id");
				WHERE("D.status !=3"
					+" AND"
					+" D.viewed !=0");
					/*if (filter.getLiked() != 0) {
						WHERE("D.liked >= #{filter.liked}");
					}
					if (filter.getViewed() != 0) {
						WHERE("D.viewed >= #{filter.viewed}");
					}*/
					ORDER_BY("D.viewed DESC OFFSET #{pagination.offset} LIMIT #{pagination.limit}");
			}
		}.toString();
		return sql;
	}
	
	
	/*select and search document popular post*/
	public static String findAllDocumentRecentPost(Map<String,Object> param){
		//FilterRecentPost  filter = (FilterRecentPost) param.get("filter");
		String sql = new SQL(){
			{
				SELECT("D.doc_id,"
						+" D.doc_title,"
						+" D.uploaded_date,"
						+" D.url,"
						+" D.liked,"
						+" D.shared,"
						+" D.viewed,"
						+" D.description,"
						+" D.status,"
						+" D.doc_type_id,"
						+" U.user_name,"
						+" CT.cat_id,"
						+" CT.cat_name,"
						+" D.thumbnail,"
						+" D.source");
				FROM("ksl_document D");
				INNER_JOIN("ksl_category CT ON D.cat_id = CT.cat_id");
				INNER_JOIN("ksl_user U ON D.user_id = U.user_id");
				WHERE("D.status !=3");
					/*+" AND"
					+" D.uploaded_date =#{filter.date}");*/
				ORDER_BY("D.doc_id DESC OFFSET #{pagination.offset} LIMIT #{pagination.limit}");
			}
		}.toString();
		return sql;
	}
	
	/*select and search document detail*/
	public static String findDocumentByRecomment(Map<String,Object> param){
		System.out.println("TEST");
		FilterDocumentRecomment  filter = (FilterDocumentRecomment) param.get("filter");
		String sql = new SQL(){
			{
				SELECT("D.doc_id,"
						+" D.doc_title,"
						+" D.uploaded_date,"
						+" D.url,"
						+" D.liked,"
						+" D.shared,"
						+" D.viewed,"
						+" D.description,"
						+" D.status,"
						+" D.doc_type_id,"
						+" U.user_name,"
						+" CT.cat_id,"
						+" CT.cat_name,"
						+" D.thumbnail,"
						+" D.source");
				FROM("ksl_document D");
				INNER_JOIN("ksl_category CT ON D.cat_id = CT.cat_id");
				INNER_JOIN("ksl_user U ON D.user_id = U.user_id");
				WHERE("D.status !=3"
					+" AND"
					+" D.viewed !=0");
					if (filter.getCat_id() !=0){
						WHERE("D.cat_id = #{filter.cat_id}");
					}
					ORDER_BY("D.viewed DESC OFFSET #{pagination.offset} LIMIT #{pagination.limit}");
			}
		}.toString();
		System.out.println("TEST1");
		return sql;
	}
	

}