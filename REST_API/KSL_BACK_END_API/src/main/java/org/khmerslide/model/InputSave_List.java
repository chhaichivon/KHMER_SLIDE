package org.khmerslide.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class InputSave_List {


	private String sl_name;

	private String saved_date;

	private int status;

	private int  user_id;

	private int  doc_id;

	private String description;

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
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getDoc_id() {
		return doc_id;
	}
	public void setDoc_id(int doc_id) {
		this.doc_id = doc_id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public static class updateSaveList{
		@JsonProperty("SL_NAME")
		private String sl_name;
		@JsonProperty("STATUS")
		private int status;
		@JsonProperty("DOC_ID")
		private int  doc_id;
		@JsonProperty("DESCRIPTION")
		private String description;
		public String getSl_name() {
			return sl_name;
		}
		public void setSl_name(String sl_name) {
			this.sl_name = sl_name;
		}
		public int getStatus() {
			return status;
		}
		public void setStatus(int status) {
			this.status = status;
		}
		public int getDoc_id() {
			return doc_id;
		}
		public void setDoc_id(int doc_id) {
			this.doc_id = doc_id;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		
		
	}
	
	
}