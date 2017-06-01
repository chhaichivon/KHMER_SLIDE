package org.khmerslide.filter;

import com.fasterxml.jackson.annotation.JsonProperty;

public class FilterComment {
	@JsonProperty("CMT_TEXT")
	private String cmt_text;
	@JsonProperty("CMT_DATE")
	private String cmt_date;
	@JsonProperty("USER_NAME")
	private String user_name;
	@JsonProperty("DOC_TITLE")
	private String doc_title;
	
	
	
	public FilterComment() {
		// TODO Auto-generated constructor stub
		cmt_text = null;
		cmt_date =null;
		user_name = null;
		doc_title =null;
	}
	public String getCmt_text() {
		return cmt_text;
	}
	public void setCmt_text(String cmt_text) {
		this.cmt_text = cmt_text;
	}
	public String getCmt_date() {
		return cmt_date;
	}
	public void setCmt_date(String cmt_date) {
		this.cmt_date = cmt_date;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getDoc_title() {
		return doc_title;
	}
	public void setDoc_title(String doc_title) {
		this.doc_title = doc_title;
	}
	
}
