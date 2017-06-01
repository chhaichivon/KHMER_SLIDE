package org.khmerslide.filter;

import com.fasterxml.jackson.annotation.JsonProperty;

public class FilterDocumentRecomment {
	private int parent_id;
	public int getParent_id() {
		return parent_id;
	}

	public void setParent_id(int parent_id) {
		this.parent_id = parent_id;
	}

	//@JsonProperty("DOC_ID")
	private int cat_id;

	public int getCat_id() {
		return cat_id;
	}

	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}

}