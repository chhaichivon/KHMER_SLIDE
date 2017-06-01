package org.khmerslide.services.implement;

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
import org.khmerslide.repositories.DocumentRepository;
import org.khmerslide.services.DocumentService;
import org.khmerslide.utilities.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DocumentServiceImplement implements DocumentService {
	@Autowired
	private DocumentRepository documentRepository;

	@Override
	public ArrayList<Document> getDocument() {
		return documentRepository.getDocument();
	}
	@Override
	public boolean addDocument(Document document) {
		return documentRepository.addDocument(document);
	}
	
	@Override
	public ArrayList<Document> getDocumnetByUserId(
			FilterDocumentId filter,
			Pagination pagination) {
		// TODO Auto-generated method stub
		return documentRepository.getDocumentByUserId(filter, pagination);
	}

	@Override
	public boolean updateDocument(UpdateDocument document) {
		return documentRepository.updateDocument(document);
	}

//	@Override
//	public boolean deleteDocument(int doc_id) {
//		return documentRepository.deleteDocument(doc_id);
//	}
	@Override
	public ArrayList<Document> getDocumentPopularPost(Pagination pagination) {
		// TODO Auto-generated method stub
		return documentRepository.getAllDocumentPopularPost(pagination);
	}
	@Override
	public ArrayList<Document> getDocumentRecentPost(Pagination pagination) {
		// TODO Auto-generated method stub
		return documentRepository.getAllDocumentRecentPost(pagination);
	}
	@Override
	public ArrayList<Document> getDocumentById(FilterDocumentId filter) {
		// TODO Auto-generated method stub
		return documentRepository.getDocumentById(filter);
	}
	
	@Override
	public ArrayList<Document> getAllDocumentRecomment(
			FilterDocumentRecomment filter,
			Pagination pagination) {
		
		// TODO Auto-generated method stub
		return documentRepository.getAllDocumentRecomment(filter, pagination);
	}
	@Override
	public boolean updateViewDocument(UpdateViewDocument doc) {
		// TODO Auto-generated method stub
		return documentRepository.updateViewDocument(doc);
	}
	@Override
	public ArrayList<Document> getDocumentByCategoryId(
			FilterDocumentId filter, 
			Pagination pagination) {
		// TODO Auto-generated method stub
		return documentRepository.getDocumentByCateogryId(filter, pagination);
	}
	@Override
	public ArrayList<Document> getDocumentByCategoryAndType(
			FilterDocumentId filter, 
			Pagination pagination) {
		// TODO Auto-generated method stub
		return documentRepository.getDocumentByCateogryAndType(filter, pagination);
	}
	@Override
	public boolean deleteDocument(UpdateStatusDocument updateStatus) {
		return documentRepository.deleteDocument(updateStatus);
	}

	@Override
	public ArrayList<Document> getDocumentBySearch(
			FilterSearchCategoryAndDocumentName filter,
			Pagination pagination) {
		// TODO Auto-generated method stub
		System.out.println(filter);
		return documentRepository.getAllDocumentByCategory(filter, pagination);
	}
	
	@Override
	public Integer getDocumentTotalByType(
			@Param("filter") FilterTotalDocumentByType filter
			) {
		return documentRepository.getDocumentTotalByType(filter);
	}
	@Override
	public boolean updateLikeocument(UpdateLikeDocument document) {
		// TODO Auto-generated method stub
		return documentRepository.updateLikeDocument(document);
	}

}
