
package org.khmerslide.services.implement;

import java.util.ArrayList;

import org.khmerslide.entities.View_History;
import org.khmerslide.filter.FilterViewHistory;
import org.khmerslide.repositories.ViewHistoryRepository;
import org.khmerslide.services.ViewHistoryService;
import org.khmerslide.utilities.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ViewHistoryServiceImplement implements ViewHistoryService {
	@Autowired
	private ViewHistoryRepository  viewhistoryRepository;
	@Override
	public ArrayList<View_History> getViewHistory(
			Pagination pagination
			) {
		return viewhistoryRepository.getViewHistory(pagination);
	}

	@Override
	public boolean addViewHistory(View_History vh) {
		return viewhistoryRepository.addViewHistory(vh);
	}

	@Override
	public boolean updateViewHistory(View_History vh) {
		return viewhistoryRepository.updateViewHistory(vh);
	}

	@Override
	public boolean deleteViewHistory(int vh_id) {
		return viewhistoryRepository.deleteViewHistory(vh_id);
	}

	@Override
	public ArrayList<View_History> getViewHistoryById(int vh_id) {
		return viewhistoryRepository.getViewHistoryById(vh_id);
	}

	@Override
	public ArrayList<View_History> getViewHistoryByUserId(FilterViewHistory filter, Pagination pagination) {
		return viewhistoryRepository.getViewHistoryByUserId(filter,pagination);
	}

	@Override
	public boolean deleteViewHistoryByUserId(int userId) {
		return viewhistoryRepository.deleteViewHistoryByUserId(userId);
	}

}