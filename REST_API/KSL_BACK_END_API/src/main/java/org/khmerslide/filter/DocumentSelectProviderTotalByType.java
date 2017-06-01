package org.khmerslide.filter;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;

public class DocumentSelectProviderTotalByType {

	/*select and search document detail*/
	public static String findAllDocumentTotalByDocType(Map<String,Object> param){
		FilterTotalDocumentByType  filter = (FilterTotalDocumentByType) param.get("filter");
		String sql = new SQL(){
			{
				SELECT("COUNT(DISTINCT D.doc_id) AS TOTAL_DOCS");					
				FROM("ksl_document D");
				/*INNER_JOIN("ksl_doc_type DT ON  DT.doc_type_id = D.doc_type_id");*/
				WHERE("D.status !=3");
					if (filter.getDoc_type_id() != 0) {
						WHERE("D.doc_type_id = #{filter.doc_type_id}");
					}
					 if(filter.getStart_date() != null &&  filter.getEnd_date() !=null){
						 WHERE("to_date(D.uploaded_date,'dd-MMM-yyyy') BETWEEN to_date(#{filter.start_date},'dd-MMM-yyyy')  AND to_date(#{filter.end_date},'dd-MMM-yyyy')");
					 }
					 /*ORDER_BY("D.doc_id DESC OFFSET #{pagination.offset} LIMIT #{pagination.limit}");*/
			}
		}.toString();
		return sql;
	}

}