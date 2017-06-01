package org.khmerslide.model;



import com.fasterxml.jackson.annotation.JsonProperty;

public class InputView_History {
	private String added_date;
	private int  user_id;
	private int  doc_id;
	private String description;
	
	public String getAdded_date() {
		return added_date;
	}
	public void setAdded_date(String added_date) {
		this.added_date = added_date;
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
	public static class UpdateViewHistory{
		@JsonProperty("DOC_ID")
		private int  doc_id;
		@JsonProperty("DESCRIPTION")
		private String description;
		@JsonProperty("STATUS")
		private int status;
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
		public int getStatus() {
			return status;
		}
		public void setStatus(int status) {
			this.status = status;
		}
		
	}

}
