package org.khmerslide.entities;

import com.fasterxml.jackson.annotation.JsonProperty;

public class User {
	@JsonProperty("USER_ID")
	private int user_id;
	@JsonProperty("USER_NAME")
	private String user_name;
	@JsonProperty("GENDER")
	private String gender;
	@JsonProperty("EMAIL")
	private String email;
	@JsonProperty("PASSWORD")
	private String password;
	@JsonProperty("REGISTERED_DATE")
	private String registered_date;
	@JsonProperty("PHOTO")
	private String photo;
	@JsonProperty("DESCRIPTION")
	private String description;
	@JsonProperty("STATUS")
	private int status;
	@JsonProperty("ROLE")
	private User_Type role;
	
	
	public User_Type getRole() {
		return role;
	}
	public void setRole(User_Type role) {
		this.role = role;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRegistered_date() {
		return registered_date;
	}
	public void setRegistered_date(String registered_date) {
		this.registered_date = registered_date;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
