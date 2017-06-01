package org.khmerslide.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class UserLogin {
	@JsonProperty("EMAIL")
	private String email;
	@JsonProperty("USERNAME")
	private String username;
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
}
