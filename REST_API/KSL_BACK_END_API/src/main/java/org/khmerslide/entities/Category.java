package org.khmerslide.entities;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Category {
	@JsonProperty("CAT_ID")
	private int cat_id;
	@JsonProperty("PARENT")
	private Category parent;
	@JsonProperty("CAT_NAME")
	private String cat_name;
	@JsonProperty("CREATED_DATE")
	private String created_date;
	@JsonProperty("STATUS")
	private int status;
	@JsonProperty("USER")
	private User  user;
	@JsonProperty("DESCRIPTION")
	private String description;
	@JsonProperty("ICON")
	private String icon;
	@JsonProperty("FOLDER")
	private String folder_google_drive;
	
	
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getFolder_google_drive() {
		return folder_google_drive;
	}
	public void setFolder_google_drive(String folder_google_drive) {
		this.folder_google_drive = folder_google_drive;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getCat_id() {
		return cat_id;
	}
	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}

	public Category getParent() {
		return parent;
	}
	public void setParent(Category parent) {
		this.parent = parent;
	}
	public String getCat_name() {
		return cat_name;
	}
	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
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
