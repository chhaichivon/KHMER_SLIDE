package org.khmerslide.repositories;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.khmerslide.entities.Save_List;
import org.khmerslide.filter.DocumentSelectProvider;
import org.khmerslide.filter.FilterSaveList;
import org.khmerslide.filter.SaveListSelectProvider;
import org.khmerslide.model.InputSave_Doc;
import org.khmerslide.utilities.Pagination;
import org.springframework.stereotype.Repository;
@Repository
public interface SaveListRepository {
	/*  Status 
    	1 NOT DELETE
		2.DELETE
	 */
	
	/*====================================GET ALL SAVELIST====================================*/
	@SelectProvider(type = SaveListSelectProvider.class, method = "findAndManagementSaveList")
	@Results(value={
			@Result(property="user.user_id",column="user_id"),
			@Result(property="user.user_name",column="user_name"),
			@Result(property="user.gender",column="gender"),
			@Result(property="user.email",column="email"),
			@Result(property="sl.sl_id",column="sl_id"),
			@Result(property="sl.sl_name",column="sl_name"),
			@Result(property="sl.saved_date",column="saved_date"),
			@Result(property="sl.status",column="status"),
			@Result(property="sd.sd_id",column="sd_id"),
			@Result(property="doc.doc_id",column="doc_id"),
			@Result(property="doc.doc_title",column="doc_title"),
			@Result(property="doc.uploaded_date",column="uploaded_date"),
			@Result(property="doc.url",column="url"),
			@Result(property="doc.liked",column="liked"),
			@Result(property="doc.shared",column="shared"),
			@Result(property="doc.viewed",column="viewed"),
			@Result(property="doc.description",column="D.description"),
			@Result(property="doc.status",column="status"),
			@Result(property="doc.doc_type_id",column="doc_type_id"),
			@Result(property="doc.thumbnail",column="thumbnail"),
			@Result(property="doc.source",column="source")
	})
	public ArrayList<Save_List> getSaveList(
			@Param("filter") FilterSaveList filter,
			@Param("pagination") Pagination pagination
			
			);
	/*====================================GET SAVE LIST BY USER  ID====================================*/
	
	@SelectProvider(type=SaveListSelectProvider.class,method="getSaveListByUserId")
	@Results(value={
			@Result(property="user.user_id",column="user_id"),
			@Result(property="user.user_name",column="user_name"),
			@Result(property="user.gender",column="gender"),
			@Result(property="user.email",column="email"),
			@Result(property="sd.sd_id",column="sd_id"),
			@Result(property="doc.doc_id",column="doc_id"),
			@Result(property="doc.doc_title",column="doc_title"),
			@Result(property="doc.uploaded_date",column="uploaded_date"),
			@Result(property="doc.url",column="url"),
			@Result(property="doc.liked",column="liked"),
			@Result(property="doc.shared",column="shared"),
			@Result(property="doc.viewed",column="viewed"),
			@Result(property="doc.description",column="D.description"),
			@Result(property="doc.status",column="status"),
			@Result(property="doc.doc_type_id",column="doc_type_id"),
			@Result(property="doc.thumbnail",column="thumbnail"),
			@Result(property="doc.source",column="source")	
	})
	public ArrayList<Save_List> getSaveListByUserId(
			@Param("filter") FilterSaveList filter,
			@Param("pagination") Pagination pagination
			);
	
	/*====================================GET SAVE DOC BY SAVE LIST  ID====================================*/
	@SelectProvider(type=SaveListSelectProvider.class,method="getDocumentSaveDocBySaveListId")
	@Results(value={
			@Result(property="sd.sd_id",column="sd_id"),
			@Result(property="doc.cat.cat_id",column="cat_id"),
			@Result(property="doc.doc_id",column="doc_id"),
			@Result(property="doc.doc_title",column="doc_title"),
			@Result(property="doc.uploaded_date",column="uploaded_date"),
			@Result(property="doc.url",column="url"),
			@Result(property="doc.liked",column="liked"),
			@Result(property="doc.shared",column="shared"),
			@Result(property="doc.viewed",column="viewed"),
			@Result(property="doc.description",column="D.description"),
			@Result(property="doc.status",column="status"),
			@Result(property="doc.doc_type_id",column="doc_type_id"),
			@Result(property="doc.thumbnail",column="thumbnail"),
			@Result(property="doc.source",column="source")	
	})
	public ArrayList<Save_List> getDocumentSaveDocBySaveListId(
			@Param("filter") FilterSaveList filter,
			@Param("pagination") Pagination pagination);
	
	/*====================================ADD SAVELIST====================================*/
	String A_SL="INSERT INTO"
				+" ksl_save_list("
				+" sl_name,"
				+" saved_date,"
				+" status,"
				+" user_id,"
				+" description)"
				+" VALUES("
				+" #{sl_name},"
				+" #{saved_date},"
				+" #{status},"
				+" #{user.user_id},"
				+" #{description})";
	@Insert(A_SL)
	@Results(value={
			@Result(property="user.user_id",column="user_id"),
			@Result(property="doc.doc_id",column="doc_id")
	})
	@SelectKey(statement="SELECT last_value FROM ksl_save_list_sl_id_seq", keyProperty="sl_id", keyColumn="last_value", before=false, resultType=int.class)
	public boolean addSaveList(Save_List savelist);
	
		String ADD_DOC_SAVE_LIST="INSERT INTO"
								+" ksl_save_doc("
								+" sl_id,"
								+" status,"
								+" doc_id)"
								+" VALUES("
								+" #{sl_id},"
								+" 1,"
								+" #{doc_id})";
	@Insert(ADD_DOC_SAVE_LIST)
	public boolean addDocSaveList(@Param("sl_id") int  sl_id , @Param("doc_id") int doc_id);
	
	String SAVE_DOC="INSERT INTO"
			+" ksl_save_doc("
			+" sl_id,"
			+" status,"
			+" doc_id)"
			+" VALUES("
			+" #{sl_id},"
			+" #{status},"
			+" #{doc_id})";
@Insert(SAVE_DOC)
public boolean saveDoc(InputSave_Doc saveDoc);

	
	
	/*====================================UPDATE SAVELIST====================================*/
	String UPDATE_SAVE_LIST="UPDATE"
							+" ksl_save_list"
							+" SET"
							+" sl_name=#{sl_name},"
							+" status=#{status},"
							+" description=#{description}"
							+" WHERE"
							+" sl_id=#{sl_id}";
	@Update(UPDATE_SAVE_LIST)
	public boolean updateSaveList(Save_List savelist);
	
	static final String UPDATE_DOC_SAVE_LIST="UPDATE"
											+" ksl_save_doc"
											+" SET"
											+" doc_id =#{doc_id}"
											+" WHERE"
											+" sl_id  = #{sl_id}"
											+" AND"
											+" sd_id = #{sd_id}";
	
	@Update(UPDATE_DOC_SAVE_LIST)
	/*@Results(value={
			@Result(property="doc.doc_id",column="doc_id")
	})*/
	public boolean updateDocSaveList(@Param("sl_id") int  sl_id , @Param("sd_id") int sd_id, @Param("doc_id") int doc_id);

	/*====================================DELETE SAVELIST====================================*/
	String D_SL="UPDATE ksl_save_list"
			+" SET"
			+" status=3"
			+" WHERE"
			+" sl_id=#{sl_id}";
	@Delete(D_SL)
	public boolean deleteSaveList(int savelist);
	
	/*====================================DELETE SAVELIST====================================*/
	String D_SD="UPDATE ksl_save_doc"
			+" SET"
			+" status=3"
			+" WHERE"
			+" sd_id=#{sd_id}";
	@Delete(D_SD)
	public boolean deleteSaveDoc(int saveDoc);
	
	
}