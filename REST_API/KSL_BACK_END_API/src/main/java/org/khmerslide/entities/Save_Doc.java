package org.khmerslide.entities;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Save_Doc {
	@JsonProperty("SAVEDOC")
	private int sd_id;
	@JsonProperty("SAVELIST")
	private int sl_id;
	@JsonProperty("DOC")
	private int doc_id;
	@JsonProperty("STATUS")
	private int status;
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getSd_id() {
		return sd_id;
	}
	public void setSd_id(int sd_id) {
		this.sd_id = sd_id;
	}
	public int getSl_id() {
		return sl_id;
	}
	public void setSl_id(int sl_id) {
		this.sl_id = sl_id;
	}
	public int getDoc_id() {
		return doc_id;
	}
	public void setDoc_id(int doc_id) {
		this.doc_id = doc_id;
	}
	
}