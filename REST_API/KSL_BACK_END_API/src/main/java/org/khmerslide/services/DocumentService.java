package org.khmerslide.services;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.khmerslide.entities.Document;
import org.khmerslide.filter.FilterDocumentId;
import org.khmerslide.filter.FilterDocumentRecomment;
import org.khmerslide.filter.FilterSearchCategoryAndDocumentName;
import org.khmerslide.filter.FilterTotalDocumentByType;
import org.khmerslide.model.UpdateDocument;
import org.khmerslide.model.UpdateLikeDocument;
import org.khmerslide.model.UpdateStatusDocument;
import org.khmerslide.model.UpdateViewDocument;
import org.khmerslide.utilities.Pagination;

public interface DocumentService {
	public ArrayList<Document> getDocument();
	public ArrayList<Document> getDocumentById(
			@Param("filter") FilterDocumentId filter
			);
	public ArrayList<Document> getDocumnetByUserId(
			@Param("filter") FilterDocumentId filter,
			@Param("pagination") Pagination pagination);
	public boolean addDocument(Document document);
	public boolean updateDocument(UpdateDocument document);
//	public boolean deleteDocument(int doc_id);
	public boolean deleteDocument(UpdateStatusDocument updateStatus);
	public ArrayList<Document> getDocumentPopularPost(
			@Param("pagination") Pagination pagination
			);
	public ArrayList<Document> getDocumentRecentPost(
			@Param("pagination") Pagination pagination
			);
	public ArrayList<Document> getAllDocumentRecomment(
			@Param("filter") FilterDocumentRecomment filter,
			@Param("pagination") Pagination pagination
			);
	public boolean updateViewDocument(UpdateViewDocument document);
	public boolean updateLikeocument(UpdateLikeDocument document);
//	public ArrayList<Document> getAllDocumentByCatId(
//		 	@Param("filter") FilterDocumentRecomment filter,
//			@Param("pagination") Pagination pagination
//			);
	public ArrayList<Document> getDocumentByCategoryId(
			@Param("filter") FilterDocumentId filter,
			@Param("pagination") Pagination pagination
			);
	public ArrayList<Document> getDocumentByCategoryAndType(
			@Param("filter") FilterDocumentId filter,
			@Param("pagination") Pagination pagination
			);
	public ArrayList<Document> getDocumentBySearch(
			@Param("filter") FilterSearchCategoryAndDocumentName filter,
			@Param("pagination") Pagination pagination
			);
	
	public Integer getDocumentTotalByType(
			@Param("filter") FilterTotalDocumentByType filter
			);
}
