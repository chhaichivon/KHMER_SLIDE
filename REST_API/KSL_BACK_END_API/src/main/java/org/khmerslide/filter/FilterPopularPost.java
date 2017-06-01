package org.khmerslide.filter;

import com.fasterxml.jackson.annotation.JsonProperty;

public class FilterPopularPost {
	@JsonProperty("LIKED")
	private int liked;

	public int getLiked() {
		return liked;
	}

	public void setLiked(int liked) {
		this.liked = liked;
	}

}
