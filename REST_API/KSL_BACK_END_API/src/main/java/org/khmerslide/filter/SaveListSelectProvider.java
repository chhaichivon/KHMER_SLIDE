package org.khmerslide.filter;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.eclipse.jdt.internal.compiler.batch.Main;

public class SaveListSelectProvider {
	/*==================================GET ALL SAVELIST==================================*/
	public static String findAndManagementSaveList(Map<String,Object> param){
		FilterSaveList  filter = (FilterSaveList) param.get("filter");
		String sql = new SQL(){
			{
				SELECT("SD.sd_id,"
						+" SL.sl_id,"
						+" SL.sl_name,"
						+" SL.saved_date,"
						+" U.user_id,"
						+" U.user_name,"
						+" SL.status,"
						+" SL.description,"
						+" D.doc_id,"
						+" D.doc_title,"
						+" D.uploaded_date,"
						+" D.url,"
						+" D.liked,"
						+" D.shared,"
						+" D.viewed,"
						+" D.description,"
						+" D.status,"
						+" D.doc_type_id,"
						+" D.user_id,"
						+" D.cat_id,"
						+" D.thumbnail,"
						+" D.source"); 		
			FROM("ksl_save_list SL");
			INNER_JOIN("ksl_save_doc SD ON SD.sl_id = SL.sl_id");
			INNER_JOIN("ksl_user U ON U.user_id = SL.user_id");
			INNER_JOIN("ksl_document D ON D.doc_id = SD.doc_id");
			WHERE("D.status = 1 AND SL.status != 3");
					if (filter.getSl_name()!= null) {
						WHERE("LOWER(S.sl_name) LIKE LOWER('%' || #{filter.search} || '%')");
					}
					if(filter.getSaved_date() != null){
						WHERE("LOWER(S.saved_date) LIKE LOWER('%' || #{filter.search} || '%')");
					}
					if(filter.getUser_name() != null){
						WHERE("LOWER(U.user_name) LIKE LOWER('%' || #{filter.search} || '%')");
					}
					if(filter.getDoc_title() != null){
						WHERE("LOWER(D.doc_title) LIKE LOWER('%' || #{filter.search} || '%')");
					}
					ORDER_BY("SD.sd_id DESC OFFSET #{pagination.offset} LIMIT #{pagination.limit}");
			}
		}.toString();
		return sql;
	}
	/*=================================GET SAVELIST BY SAVELIST ID=================================*/
	public static String getSaveListBySaveListId(Map<String,Object> param){
		FilterSaveList  filter = (FilterSaveList) param.get("filter");
		String sql = new SQL(){
			{
				SELECT("SD.sd_id,"
						+" SL.sl_id,"
						+" SL.sl_name,"
						+" SL.saved_date,"
						+" U.user_id,"
						+" U.user_name,"
						+" SL.status,"
						+" SL.description,"
						+" D.doc_id,"
						+" D.doc_title,"
						+" D.uploaded_date,"
						+" D.url,"
						+" D.liked,"
						+" D.shared,"
						+" D.viewed,"
						+" D.description,"
						+" D.status,"
						+" D.doc_type_id,"
						+" D.user_id,"
						+" D.cat_id,"
						+" D.thumbnail,"
						+" D.source"); 		
			FROM("ksl_save_doc SD");
			INNER_JOIN("ksl_save_list SL ON SL.sl_id = SD.sl_id");
			INNER_JOIN("ksl_user U ON U.user_id = SL.user_id");
			INNER_JOIN("ksl_document D ON D.doc_id = SD.doc_id");
			INNER_JOIN("ksl_category C ON C.cat_id = D.cat_id");
			WHERE("SL.sl_id = #{filter.sl_id} AND SL.status != 3");
					ORDER_BY("SD.sd_id DESC OFFSET #{pagination.offset} LIMIT #{pagination.limit}");
			}
		}.toString();
		return sql;
	}
	/*=================================GET SAVELIST BY USER ID=================================*/
	public static String getSaveListByUserId(Map<String,Object> param){
		FilterSaveList filter =(FilterSaveList) param.get("filter");
		final String sql =new SQL(){
			{
				SELECT("SL.sl_id,"
						+" SL.sl_name,"
						+" SL.saved_date,"
						+" SL.status,"
						+" SL.user_id,"
						+" SL.description");
				FROM("ksl_save_list SL");
				WHERE("SL.user_id =#{filter.userId} AND SL.status != 3");
			}
		}.toString();
		return sql;
	}
	
	/*=================================GET SAVEDOC BY SAVE LIST ID=================================*/
	public static String getDocumentSaveDocBySaveListId(Map<String,Object> param){
		FilterSaveList  filter = (FilterSaveList) param.get("filter");
		String sql =new SQL(){
			{
				SELECT("SD.sd_id,"
						+" SD.sl_id,"
						+" D.doc_id,"
						+" D.doc_title,"
						+" D.uploaded_date,"
						+" D.url,"
						+" D.liked,"
						+" D.shared,"
						+" D.viewed,"
						+" D.description,"
						+" D.status,"
						+" D.doc_type_id,"
						+" D.user_id,"
						+" D.cat_id,"
						+" D.thumbnail,"
						+" D.source,"
						+" SD.status");
				FROM("ksl_save_doc SD");
				LEFT_OUTER_JOIN("ksl_document D ON D.doc_id = SD.doc_id");
				WHERE("SD.sl_id =#{filter.sl_id} AND SD.status != 3");
					ORDER_BY("SD.sd_id DESC OFFSET #{pagination.offset} LIMIT #{pagination.limit}");
			}
		}.toString();
		return sql;
	}
	
}