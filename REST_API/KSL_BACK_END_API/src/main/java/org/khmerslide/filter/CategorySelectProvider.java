package org.khmerslide.filter;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;

public class CategorySelectProvider {

	
	/*select and search category detail*/
	public static String findAndManagementCategory(Map<String,Object> param){
		FilterCategory  filter = (FilterCategory) param.get("filter");
		String sql = new SQL(){
			{
				SELECT("CB.cat_id," 
						 +" CB.cat_name," 
						 +" C.cat_name AS PARENT," 
						 +" CB.created_date," 
						 +" CB.status," 
						 +" U.user_name," 
						 +" CB.description," 
						 +" CB.icon"); 
				FROM("ksl_category C");
				INNER_JOIN("ksl_user U ON U.user_id= C.user_id");
				RIGHT_OUTER_JOIN("ksl_category CB ON C.cat_id = CB.parent_id");
				WHERE("CB.status = 1");
				/*	if (filter.getCat_id() !=0) {
						WHERE("CB.cat_id = #{filter.cat_id} ");
					}*/
					if (filter.getCat_name() != null) {
						WHERE("LOWER(CB.cat_name) LIKE LOWER('%' || #{filter.cat_name} || '%')");
					}
					if(filter.getCreated_date() != null){
						WHERE("LOWER(CB.created_date) LIKE LOWER('%' || #{filter.created_date} || '%')");
					}
					if(filter.getUser_name() != null){
						WHERE("LOWER(U.user_name) LIKE LOWER('%' || #{filter.user_name} || '%')");
					}
					ORDER_BY("CB.cat_id DESC OFFSET #{pagination.offset} LIMIT #{pagination.limit}");
			}
		}.toString();
		return sql;
	}
}
