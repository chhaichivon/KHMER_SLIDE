package org.khmerslide.entities.input;

import com.fasterxml.jackson.annotation.JsonProperty;

public class InputSave_Doc {

	private int status;

	private int  sl_id;

	private int  doc_id;

	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
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