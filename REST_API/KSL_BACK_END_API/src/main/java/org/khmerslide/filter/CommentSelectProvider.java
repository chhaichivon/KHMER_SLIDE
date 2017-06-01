package org.khmerslide.filter;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;

public class CommentSelectProvider {
	
	
	/*select and search category detail*/
	public static String findAndManagementComment(Map<String,Object> param){
		FilterComment  filter = (FilterComment) param.get("filter");
		String sql = new SQL(){
			{
				SELECT(" C.cmt_id,"
						+" C.cmt_text,"
						+" C.cmt_date,"
						+" C.status,"
						+" U.user_name,"
						+" D.doc_title"); 
				FROM("ksl_comment C");
				INNER_JOIN("ksl_user U ON C.user_id = U.user_id");
				INNER_JOIN("ksl_document D ON C.doc_id = D.doc_id");
				WHERE("C.status = 1");
					if (filter.getCmt_text() != null) {
						WHERE("LOWER(C.cmt_text) LIKE LOWER('%' || #{filter.cmt_text} || '%')");
					}
					if(filter.getCmt_date() != null){
						WHERE("LOWER(C.cmt_date) LIKE LOWER('%' || #{filter.cmt_date} || '%')");
					}
					if(filter.getUser_name() != null){
						WHERE("LOWER(U.user_name) LIKE LOWER('%' || #{filter.user_name} || '%')");
					}
					if(filter.getDoc_title() != null){
						WHERE("LOWER(D.doc_title) LIKE LOWER('%' || #{filter.doc_title} || '%')");
					}
					ORDER_BY("C.cmt_id DESC OFFSET #{pagination.offset} LIMIT #{pagination.limit}");
			}
		}.toString();
		return sql;
	}
}
