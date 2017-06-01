package org.khmerslide.filter;

import com.fasterxml.jackson.annotation.JsonProperty;

public class FilterDocumentId {
	@JsonProperty("DOC_ID")
	private int doc_id;
	@JsonProperty("USER_ID")
	private int user_id;
	@JsonProperty("CAT_ID")
	private int cat_id;
//	@JsonProperty("SEARCH_ID")
//	private int search_id;
	@JsonProperty("DOC_TYPE")
	private int doc_type;
	
	
	public FilterDocumentId() {
		// TODO Auto-generated constructor stub
		doc_id =0;
		user_id =0;
//		search_id =0;
		cat_id =0;
		doc_id =0;
	}
	
	public int getDoc_type() {
		return doc_type;
	}

	public void setDoc_type(int doc_type) {
		this.doc_type = doc_type;
	}

//	public int getSearch_id() {
//		return search_id;
//	}
//	public void setSearch_id(int search_id) {
//		this.search_id = search_id;
//	}


	public int getDoc_id() {
		return doc_id;
	}

	public int getCat_id() {
		return cat_id;
	}

	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}

	public void setDoc_id(int doc_id) {
		this.doc_id = doc_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

}