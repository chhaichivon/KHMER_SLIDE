package org.khmerslide.filter;

import com.fasterxml.jackson.annotation.JsonProperty;

public class FilterTotalDocumentByType {
	@JsonProperty("DOC_TYPE")
	private int doc_type_id;
	@JsonProperty("START_DATE")
	private String start_date;
	@JsonProperty("END_DATE")
	private String end_date;
	
	public FilterTotalDocumentByType() {
		// TODO Auto-generated constructor stub
		 doc_type_id = 0;
		 start_date = null;
		 end_date = null;
	}
	public int getDoc_type_id() {
		return doc_type_id;
	}
	public void setDoc_type_id(int doc_type_id) {
		this.doc_type_id = doc_type_id;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	
}