package org.khmerslide.entities;

import com.fasterxml.jackson.annotation.JsonProperty;

public class User_Type {
	@JsonProperty("ROLE_ID")
	private int role_id;
	@JsonProperty("ROLE_NAME")
	private String role_name;
	@JsonProperty("STATUS")
	private int status;
	@JsonProperty("DESCRIPTION")
	private String description;
	
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	

	
}
