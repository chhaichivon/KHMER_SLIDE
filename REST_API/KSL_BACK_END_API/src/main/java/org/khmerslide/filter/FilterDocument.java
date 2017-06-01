package org.khmerslide.filter;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

public class FilterDocument {
	@JsonProperty("DOC_NAME")
	private String doc_name;
	@JsonProperty("DOC_TITLE")
	private String doc_title;
	@JsonProperty("UPLOADED_DATE")
	private String uploaded_date;
	@JsonProperty("USER_NAME")
	private String user_name;
	@JsonProperty("CAT_NAME")
	private String cat_name;
	@JsonProperty("STATUS")
	private int status;
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public FilterDocument() {
		doc_id = 0;
		doc_name= null;
		doc_title =null;
		uploaded_date = null;
		user_name =null;
		cat_name =null;
	}
	@JsonProperty("DOC_ID")
	private int doc_id;
	public int getDoc_id() {
		return doc_id;
	}

	public void setDoc_id(int doc_id) {
		this.doc_id = doc_id;
		
	}

	public String getDoc_name() {
		return doc_name;
	}
	public void setDoc_name(String doc_name) {
		this.doc_name = doc_name;
	}
	public String getDoc_title() {
		return doc_title;
	}
	public void setDoc_title(String doc_title) {
		this.doc_title = doc_title;
	}
	public String getUploaded_date() {
		return uploaded_date;
	}
	public void setUploaded_date(String uploaded_date) {
		this.uploaded_date = uploaded_date;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getCat_name() {
		return cat_name;
	}
	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}


	
	
}
