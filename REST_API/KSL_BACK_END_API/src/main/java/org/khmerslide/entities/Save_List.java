package org.khmerslide.entities;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Save_List {
	@JsonProperty("SL_ID")
	private int sl_id;
	@JsonProperty("SL_NAME")
	private String sl_name;
	@JsonProperty("SAVED_DATE")
	private String saved_date;
	@JsonProperty("STATUS")
	private int status;
	@JsonProperty("USER_ID")
	private User  user;
	@JsonProperty("DOC")
	private Document doc;
	@JsonProperty("SD_ID")
	private Save_Doc sd;
	
	public Save_Doc getSd() {
		return sd;
	}
	public void setSd(Save_Doc sd) {
		this.sd = sd;
	}
	@JsonProperty("DESCRIPTION")
	private String description;
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getSl_id() {
		return sl_id;
	}
	public void setSl_id(int sl_id) {
		this.sl_id = sl_id;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Document getDoc() {
		return doc;
	}
	public void setDoc(Document doc) {
		this.doc = doc;
	}
	
}