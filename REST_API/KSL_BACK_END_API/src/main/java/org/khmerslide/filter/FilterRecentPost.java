package org.khmerslide.filter;

import com.fasterxml.jackson.annotation.JsonProperty;

public class FilterRecentPost {
	@JsonProperty("UPLOADED_DATE")
	private String date;

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
}