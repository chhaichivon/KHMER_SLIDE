package org.khmerslide.filter;

import com.fasterxml.jackson.annotation.JsonProperty;

public class FilterViewHistory {
	@JsonProperty("USER_ID")
	private int user_id;

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
}