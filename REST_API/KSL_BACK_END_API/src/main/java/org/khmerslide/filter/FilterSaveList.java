package org.khmerslide.filter;

import com.fasterxml.jackson.annotation.JsonProperty;

public class FilterSaveList {
	@JsonProperty("SL_NAME")
	private String sl_name;
	@JsonProperty("SAVED_DATE")
	private String saved_date;
	@JsonProperty("USER_NAME")
	private String user_name;
	@JsonProperty("DOC_TITLE")
	private String doc_title;
	@JsonProperty("USER")
	private int userId;
	@JsonProperty("SL_ID")
	private int sl_id;
	@JsonProperty("SEARCH")
	private String search;
	
	public FilterSaveList() {
		// TODO Auto-generated constructor stub
		sl_name =null;
		saved_date =null;
		user_name =null;
		doc_title =null;
		userId =0;
		sl_id=0;
		search =null;
	}
	
	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public int getSl_id() {
		return sl_id;
	}

	public void setSl_id(int sl_id) {
		this.sl_id = sl_id;
	}

	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getSl_name() {
		return sl_name;
	}
	public void setSl_name(String sl_name) {
		this.sl_name = sl_name;
	}
	public String getSaved_date() {
		return saved_date;
	}
	public void setSaved_date(String saved_date) {
		this.saved_date = saved_date;
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

	@Override
	public String toString() {
		return "FilterSaveList [sl_name=" + sl_name + ", saved_date=" + saved_date + ", user_name=" + user_name
				+ ", doc_title=" + doc_title + ", userId=" + userId + ", sl_id=" + sl_id + ", search=" + search + "]";
	}
	
	
	
	
	
}