package org.khmerslide.entities;

import org.khmerslide.model.InputComment;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Comment {
	@JsonProperty("CMT_ID")
	private int cmt_id;
	@JsonProperty("CMT_TEXT")
	private String cmt_text;
	@JsonProperty("CMT_DATE")
	private String cmt_date;
	@JsonProperty("STATUS")
	private int status;
	@JsonProperty("USER")
	private User user;
	@JsonProperty("DOC")
	private Document  doc;
	@JsonProperty("DISCRIPTION")
	private String description;
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getCmt_id() {
		return cmt_id;
	}
	public void setCmt_id(int cmt_id) {
		this.cmt_id = cmt_id;
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
	
	public static class updateComment extends InputComment{
		@JsonProperty("CMT_TEXT")
		private String cmt_text;

		public String getCmt_text() {
			return cmt_text;
		}

		public void setCmt_text(String cmt_text) {
			this.cmt_text = cmt_text;
		}
		
	}
}
