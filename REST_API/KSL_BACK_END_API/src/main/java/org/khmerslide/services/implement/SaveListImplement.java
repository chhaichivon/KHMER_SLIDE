package org.khmerslide.services.implement;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.eclipse.jdt.internal.compiler.batch.Main;
import org.khmerslide.entities.Save_List;
import org.khmerslide.filter.FilterSaveList;
import org.khmerslide.model.InputSave_Doc;
import org.khmerslide.repositories.SaveListRepository;
import org.khmerslide.services.SaveListService;
import org.khmerslide.utilities.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class SaveListImplement implements  SaveListService {
	
	@Autowired
	private SaveListRepository  savelistRepository;
	@Override
	public ArrayList<Save_List> getSaveList(
			FilterSaveList filter,
			Pagination pagination) {
		return savelistRepository.getSaveList(filter,pagination);
	}

	@Override
	public boolean addSaveList(Save_List sl) {
		// 1.TODO ADD SAVELIST -> RETURN SAVELIST ID
		 savelistRepository.addSaveList(sl);
		 System.out.println(sl.getSl_id() + " " +  sl.getDoc().getDoc_id());
		 //2.TODO ADD TO DOC SAVELIST (  param savelist id , doc id)
		return   savelistRepository.addDocSaveList(sl.getSl_id(), sl.getDoc().getDoc_id());
	}


	@Override
	public boolean updateSaveList(Save_List sl) {
		//1.TODO UPDATE SAVE LIST
		return savelistRepository.updateSaveList(sl);
		//2.TODO UPDATE SAVE DOC (@Param("sl_id") int  sl_id ,
								//@Param("sd_id") int  sd_id,
								//@Param("doc_id") int doc_id)
		/*System.out.println("SL_ID "+sl.getSl_id() +" SD_ID "+sl.getSd().getSd_id() + " DOC_ID" + sl.getDoc().getDoc_id());
		return savelistRepository.updateDocSaveList(sl.getSl_id(), sl.getSd().getSd_id() , sl.getDoc().getDoc_id());*/
	}

	@Override
	public boolean deleteSaveList(int sl_id) {
		return savelistRepository.deleteSaveList(sl_id);
	}
	@Override
	public ArrayList<Save_List> getSaveListByUserId(
			 FilterSaveList filter,
			 Pagination pagination){
		System.out.println(filter + ", " + pagination);
		
		System.out.println("Size: " + savelistRepository.getSaveListByUserId(filter, pagination));
		return savelistRepository.getSaveListByUserId(filter, pagination);
	}

	@Override
	public ArrayList<Save_List> getDocumentSaveDocBySaveListId(
			FilterSaveList filter, 
			Pagination pagination) {
		return savelistRepository.getDocumentSaveDocBySaveListId(filter, pagination);
	}

	@Override
	public boolean saveDoc(InputSave_Doc saveDoc) {
		// TODO Auto-generated method stub
		return savelistRepository.saveDoc(saveDoc);
	}

	@Override
	public boolean deleteSaveDoc(int sd_id) {
		// TODO Auto-generated method stub
		return savelistRepository.deleteSaveDoc(sd_id);
	}
}