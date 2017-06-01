package org.khmerslide.entities.input;

	public class UpdateCategory {
		private int parent_id;
		private int cat_id;
		public int getCat_id() {
			return cat_id;
		}
		public void setCat_id(int cat_id) {
			this.cat_id = cat_id;
		}
		private String cat_name;
		private int status;
		private String description;
		private String icon;
		public int getParent_id() {
			return parent_id;
		}
		public void setParent_id(int parent_id) {
			this.parent_id = parent_id;
		}
		public String getCat_name() {
			return cat_name;
		}
		public void setCat_name(String cat_name) {
			this.cat_name = cat_name;
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
		public String getIcon() {
			return icon;
		}
		public void setIcon(String icon) {
			this.icon = icon;
		}
		
	}
