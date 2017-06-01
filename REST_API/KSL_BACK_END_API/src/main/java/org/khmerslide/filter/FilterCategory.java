package org.khmerslide.filter;

import com.fasterxml.jackson.annotation.JsonProperty;

public class FilterCategory {
	@JsonProperty("CAT_ID")
	private int cat_id;
	public FilterCategory() {
	
		cat_id = 0;
		cat_name = null;
		created_date = null;
		user_name = null;
	}
	public int getCat_id() {
		return cat_id;
	}
	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}
	@JsonProperty("CAT_NAME")
	private String  cat_name;
	@JsonProperty("CREATED_DATE")
	private String created_date;
	@JsonProperty("USER_NAME")
	private String user_name;
	
	public String getCat_name() {
		return cat_name;
	}
	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
}
