package org.khmerslide.filter;

import com.fasterxml.jackson.annotation.JsonProperty;

public class FilterSearchCategoryAndDocumentName {
	@JsonProperty("CAT_NAME")
	private String cat_name;
	@JsonProperty("DOC_TITLE")
	private String doc_title;
	
	@JsonProperty("SEARCH")
	private String search;
	
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public FilterSearchCategoryAndDocumentName() {
		// TODO Auto-generated constructor stub
		cat_name =null;
		doc_title =null;
	}
	public String getCat_name() {
		return cat_name;
	}
	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}
	public String getDoc_title() {
		return doc_title;
	}
	public void setDoc_title(String doc_title) {
		this.doc_title = doc_title;
	}
	@Override
	public String toString() {
		return "FilterSearchCategoryAndDocumentName="+ "search="
				+ search + "]";
	}
	
	
}
