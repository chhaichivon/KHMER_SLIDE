package org.khmerslide.services;

import java.util.ArrayList;

import org.khmerslide.entities.User;
import org.khmerslide.entities.View_History;
import org.khmerslide.filter.FilterViewHistory;
import org.khmerslide.utilities.Pagination;

public interface ViewHistoryService {
	public ArrayList<View_History> getViewHistory(
			Pagination pagination
			);
	public boolean addViewHistory(View_History vh);
	public boolean updateViewHistory(View_History vh);
	public boolean deleteViewHistory(int vh_id);
	public ArrayList<View_History> getViewHistoryById(int vh_id);
	public ArrayList<View_History> getViewHistoryByUserId(
			FilterViewHistory filter,
			Pagination pagination);
	public boolean deleteViewHistoryByUserId(int userId);
}