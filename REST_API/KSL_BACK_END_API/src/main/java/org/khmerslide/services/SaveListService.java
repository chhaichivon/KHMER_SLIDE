package org.khmerslide.services;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.khmerslide.entities.Save_List;
import org.khmerslide.entities.User;
import org.khmerslide.filter.FilterSaveList;
import org.khmerslide.model.InputSave_Doc;
import org.khmerslide.utilities.Pagination;

public interface SaveListService {
	public ArrayList<Save_List> getSaveList(
			FilterSaveList filter,
			Pagination pagination);
	public boolean addSaveList(Save_List  sl);
	public boolean saveDoc(InputSave_Doc  saveDoc);
	public boolean deleteSaveList(int  sl_id);
	public boolean deleteSaveDoc(int sd_id);
	public boolean updateSaveList(Save_List sl);
	public ArrayList<Save_List> getSaveListByUserId(
			@Param("filter") FilterSaveList filter,
			@Param("pagination") Pagination pagination
			);
	public ArrayList<Save_List> getDocumentSaveDocBySaveListId(
			@Param("filter") FilterSaveList filter,
			@Param("pagination") Pagination pagination
			);
}