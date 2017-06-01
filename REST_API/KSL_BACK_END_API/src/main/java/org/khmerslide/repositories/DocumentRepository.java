package org.khmerslide.repositories;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.khmerslide.entities.Document;
import org.khmerslide.filter.DocumentSelectProvider;
import org.khmerslide.filter.DocumentSelectProviderTotalByType;
import org.khmerslide.filter.FilterDocumentId;
import org.khmerslide.filter.FilterDocumentRecomment;
import org.khmerslide.filter.FilterRecentPost;
import org.khmerslide.filter.FilterSearchCategoryAndDocumentName;
import org.khmerslide.filter.FilterTotalDocumentByType;
import org.khmerslide.model.UpdateDocument;
import org.khmerslide.model.UpdateLikeDocument;
import org.khmerslide.model.UpdateStatusDocument;
import org.khmerslide.model.UpdateViewDocument;
import org.khmerslide.utilities.Pagination;
import org.springframework.stereotype.Repository;

@Repository
public interface DocumentRepository {
	/*  Status 
    1 active
	2.disactive
	3.delete
	 */
	String G_DOC="SELECT" 
			+" d.doc_id,"
			+" d.doc_title,"
			+" d.uploaded_date,"
			+" d.url,"
			+" d.liked,"
			+" d.shared,"
			+" d.viewed,"
			+" d.description,"
			+" d.status,"
			+" d.doc_type_id,"
			+" u.user_name,"
			+" ct.cat_id,"
			+" ct.cat_name,"
			+" d.thumbnail" 
			+" FROM" 
			+" ksl_document d" 
			+" INNER JOIN ksl_category ct ON d.cat_id = ct.cat_id"
			+" INNER JOIN ksl_user u ON d.user_id = u.user_id"
			+" WHERE"
			+" d.status = 1"
			+" OR"
			+" d.status = 2";
	@Select(G_DOC)
	@Results(value={
			@Result(property="doc_title",column="doc_title"),
			@Result(property="user.user_name",column="user_name"),
			@Result(property="cat.cat_id",column="cat_id"),
			@Result(property="cat.cat_name",column="cat_name")
	})
	public ArrayList<Document> getDocument();

	

	/*====================================GET DOCUMENT BY ID====================================*/
	@SelectProvider(type = DocumentSelectProvider.class, method = "findDocumentById")
	@Results(value={
			@Result(property="user.user_id",column="user_id"),
			@Result(property="user.photo",column="photo"),
			@Result(property="user.user_name",column="user_name"),
			@Result(property="cat.cat_id",column="cat_id"),
			@Result(property="cat.cat_name",column="cat_name")
	})
	public ArrayList<Document> getDocumentById(
			@Param("filter") FilterDocumentId filter
			);
	
	/*====================================GET DOCUMENT TOTAL BY TYPE====================================*/
	@SelectProvider(type = DocumentSelectProviderTotalByType.class, method = "findAllDocumentTotalByDocType")
		@Results(value={
				/*@Result(property="doc_id",column="doc_id"),*/
				//@Result(property="doc_id",column="doc_id"),
				//@Result(property="uploaded_date",column="uploaded_date")
		})
	public Integer getDocumentTotalByType(
			@Param("filter") FilterTotalDocumentByType filter
			);
	
	/*====================================GET DOCUMENT POPULAR POST====================================*/
	@SelectProvider(type=DocumentSelectProvider.class,method="findAllDocumentPopularPost")
	@Results(value={
			/*@Result(property="doc_id",column="doc_id"),*/
			@Result(property="doc_title",column="doc_title"),
			@Result(property="user.user_name",column="user_name"),
			@Result(property="cat.cat_id",column="cat_id"),
			@Result(property="cat.cat_name",column="cat_name")
	})
	public ArrayList<Document> getAllDocumentPopularPost(
		/*	@Param("filter") FilterPopularPost filter,*/
			@Param("pagination") Pagination pagination
			);
	
	/*====================================GET DOCUMENT RECENT POST====================================*/
	@SelectProvider(type=DocumentSelectProvider.class,method="findAllDocumentRecentPost")
	@Results(value={
			/*@Result(property="doc_id",column="doc_id"),*/
			@Result(property="doc_title",column="doc_title"),
			@Result(property="user.user_name",column="user_name"),
			@Result(property="cat.cat_id",column="cat_id"),
			@Result(property="cat.cat_name",column="cat_name")
	})
	public ArrayList<Document> getAllDocumentRecentPost(
	/*	 	@Param("filter") FilterRecentPost filter,*/
			@Param("pagination") Pagination pagination
			);
	
	
	/*====================================GET DOCUMENT RECOMMENT====================================*/
	@SelectProvider(type=DocumentSelectProvider.class,method="findDocumentByRecomment")
	@Results(value={
			/*@Result(property="doc_id",column="doc_id"),*/
			@Result(property="doc_title",column="doc_title"),
			@Result(property="user.user_name",column="user_name"),
			@Result(property="cat.cat_id",column="cat_id"),
			@Result(property="cat.cat_name",column="cat_name")
	})
	public ArrayList<Document> getAllDocumentRecomment(
		 	@Param("filter") FilterDocumentRecomment filter,
			@Param("pagination") Pagination pagination
			);
	
	/*====================================GET DOCUMENT By Category ID====================================*/
	String GDBCID="SELECT"
			+" D.doc_id,"
			+" D.doc_title,"
			+" D.uploaded_date,"
			+" D.url,"
			+" D.liked,"
			+" D.shared,"
			+" D.viewed,"
			+" D.description,"
			+" D.status,"
			+" D.doc_type_id,"
			+" D.cat_id,"
			+" C.parent_id,"
			+" U.user_id,"
			+" U.user_name,"
			+" U.photo,"
			+" C.cat_id,"
			+" C.cat_name,"
			+" D.thumbnail,"
			+" D.source"
			+" FROM ksl_document D"
			+" INNER JOIN ksl_category C ON C.cat_id = D.cat_id"
			+" INNER JOIN ksl_user U ON U.user_id  = D.user_id"
			+" WHERE D.cat_id IN" 
				+" (SELECT A.cat_id"
				+" FROM ksl_category A"
				+" WHERE A.cat_id = #{filter.cat_id}"
			+" UNION"
				+" SELECT SubA.cat_id"
				+" FROM ksl_category A"
				+" LEFT JOIN ksl_category SubA ON A.cat_id = SubA.parent_id"
				+" WHERE"
				+" A.cat_id = #{filter.cat_id} )"
				+" OR"
				+" D.doc_type_id = #{filter.doc_type}"
				+" ORDER BY D.doc_id DESC OFFSET #{pagination.offset} LIMIT #{pagination.limit}";

				
	@Select(GDBCID)
	@Results(value={
			@Result(property="doc_id",column="doc_id"),
			@Result(property="doc_title",column="doc_title"),
			@Result(property="doc_liked",column="doc_liked"),
			@Result(property="doc_shared",column="doc_shared"),
			@Result(property="doc_viewed",column="doc_viewed"),
			@Result(property="thumbnail",column="thumbnail"),
			@Result(property="user.user_id",column="user_id"),
			@Result(property="user.user_name",column="user_name"),
			@Result(property="user.photo",column="photo"),
			@Result(property="cat.cat_id",column="cat_id"),
			//@Result(property="parent.cat_id",column="PARENT"),
			@Result(property="cat.cat_name",column="cat_name")
	})
	public ArrayList<Document> getDocumentByCateogryId(
			@Param("filter") FilterDocumentId filter,
			@Param("pagination") Pagination pagination
			);
	
	
	/*====================================GET DOCUMENT By Category ID And Document Type====================================*/
	String GDBCT="SELECT"
			+" D.doc_id,"
			+" D.doc_title,"
			+" D.uploaded_date,"
			+" D.url,"
			+" D.liked,"
			+" D.shared,"
			+" D.viewed,"
			+" D.description,"
			+" D.status,"
			+" D.doc_type_id,"
			+" D.cat_id,"
			+" C.parent_id,"
			+" U.user_id,"
			+" U.user_name,"
			+" U.photo,"
			+" C.cat_id,"
			+" C.cat_name,"
			+" D.thumbnail,"
			+" D.source"
			+" FROM ksl_document D"
			+" INNER JOIN ksl_category C ON C.cat_id = D.cat_id"
			+" INNER JOIN ksl_user U ON U.user_id  = D.user_id"
			+" WHERE D.cat_id IN" 
				+" (SELECT A.cat_id"
				+" FROM ksl_category A"
				+" WHERE A.cat_id = #{filter.cat_id}"
			+" UNION"
				+" SELECT SubA.cat_id"
				+" FROM ksl_category A"
				+" LEFT JOIN ksl_category SubA ON A.cat_id = SubA.parent_id"
				+" WHERE"
				+" A.cat_id = #{filter.cat_id} )"
				+" AND"
				+" D.doc_type_id = #{filter.doc_type}"
				+" ORDER BY D.doc_id DESC OFFSET #{pagination.offset} LIMIT #{pagination.limit}";

				
	@Select(GDBCT)
	@Results(value={
			@Result(property="doc_id",column="doc_id"),
			@Result(property="doc_title",column="doc_title"),
			@Result(property="doc_liked",column="doc_liked"),
			@Result(property="doc_shared",column="doc_shared"),
			@Result(property="doc_viewed",column="doc_viewed"),
			@Result(property="thumbnail",column="thumbnail"),
			@Result(property="user.user_id",column="user_id"),
			@Result(property="user.user_name",column="user_name"),
			@Result(property="user.photo",column="photo"),
			@Result(property="cat.cat_id",column="cat_id"),
			//@Result(property="parent.cat_id",column="PARENT"),
			@Result(property="cat.cat_name",column="cat_name")
	})
	public ArrayList<Document> getDocumentByCateogryAndType(
			@Param("filter") FilterDocumentId filter,
			@Param("pagination") Pagination pagination
			);
	
	/*====================================GET DOCUMENT BY USER ID====================================*/
	@SelectProvider(type=DocumentSelectProvider.class,method = "findDocumentByUserId")
	@Results(value={
			@Result(property="doc_id",column="doc_id"),
			@Result(property="doc_title",column="doc_title"),
			@Result(property="user.user_id",column="user_id"),
			@Result(property="user.user_name",column="user_name"),
			@Result(property="cat.cat_id",column="cat_id"),
			@Result(property="cat.cat_name",column="cat_name")
	})
	public ArrayList<Document> getDocumentByUserId(
			@Param("filter") FilterDocumentId filter,
			@Param("pagination") Pagination pagination);
	
	/*====================================GET DOCUMENT BY SEARCH====================================*/
	String GDBC="SELECT"
				+" D.doc_id,"
				+" D.doc_title,"
				+" D.uploaded_date,"
				+" D.url,"
				+" D.liked,"
				+" D.shared,"
				+" D.viewed,"
				+" D.description,"
				+" D.status,"
				+" D.doc_type_id,"
				+" D.cat_id,"
				+" C.parent_id,"
				+" U.user_name,"
				+" C.cat_name,"
				+" D.thumbnail,"
				+" D.source"
				+" FROM ksl_document D"
				+" INNER JOIN ksl_category C ON C.cat_id = D.cat_id"
				+" INNER JOIN ksl_user U ON U.user_id  = D.user_id"
					+" WHERE D.cat_id IN" 
					+" (SELECT A.cat_id"
					+" FROM ksl_category A"
					+" WHERE A.cat_name LIKE '%' || #{filter.search} || '%'"
					+" UNION"
					+" SELECT SubA.cat_id"
					+" FROM ksl_category A"
					+" LEFT JOIN ksl_category SubA ON A.cat_id = SubA.parent_id"
					+" WHERE"
					+" A.cat_name LIKE '%' || #{filter.search} || '%') "
					+" OR"
					+" D.doc_title LIKE '%' || #{filter.search} || '%'";
	@Select(GDBC)
	@Results(value={
			@Result(property="doc_title",column="doc_title"),
			@Result(property="user.user_id",column="user_id"),
			@Result(property="user.user_name",column="user_name"),
			@Result(property="cat.cat_id",column="cat_id"),
			@Result(property="cat.cat_name",column="cat_name")
	})
	public ArrayList<Document> getAllDocumentByCategory(
			@Param("filter") FilterSearchCategoryAndDocumentName filter,
			@Param("pagination") Pagination pagination
			);
	
	/*====================================ADD DOCUMENT====================================*/
	String A_DOC="INSERT INTO "
			+ "ksl_document("
			+ "doc_title,"
			+ "uploaded_date,"
			+ "url,"
			+ "description,"
			+ "status,"
			+ "doc_type_id,"
			+ "user_id,"
			+ "cat_id,"
			+ "source,"
			+ "thumbnail) "
			+ "VALUES("
			+ "#{doc_title},"
			+ "#{uploaded_date},"
			+ "#{url},"
			+ "#{description},"
			+ "#{status},"
			+ "#{doc_type_id},"
			+ "#{user.user_id},"
			+ "#{cat.cat_id},"
			+ "#{source},"
			+ "#{thumbnail})";

@Insert(A_DOC)
@Results(value={
		@Result(property="user.user_id",column="user_id"),
		@Result(property="cat.cat_id",column="cat_id"),
	//	@Result(property="cat.folder_google_drive",column="url")
})
public boolean addDocument(Document doc);



	
//===================================Update Document=============================================	
String U_DOC="UPDATE ksl_document "
		+ "SET "
		+ "doc_title=#{doc_title},"
		+ "description=#{description},"
		+ "status=#{status},"
		+ "cat_id=#{cat_id},"
		+ "thumbnail=#{thumbnail} "
		+ "WHERE "
		+ "doc_id=#{doc_id}";
@Update(U_DOC)
public boolean updateDocument(UpdateDocument document);
	
	
//	===============================Update Number View of Document================================	
	String U_VIEWDOC="UPDATE ksl_document "
			+ "SET "
			+ "viewed=#{viewed} "
			+ "WHERE "
			+ "doc_id=#{doc_id}";
	@Update(U_VIEWDOC)
	public boolean updateViewDocument(UpdateViewDocument doc);
	
//	===============================Update Number Like of Document================================	
	String U_LIKEDOC="UPDATE ksl_document "
			+ "SET "
			+ "liked=#{liked} "
			+ "WHERE "
			+ "doc_id=#{doc_id}";
	@Update(U_LIKEDOC)
	public boolean updateLikeDocument(UpdateLikeDocument doc);
	
	/*====================================DELETE DOCUMENT====================================*/
	String D_DOC="UPDATE ksl_document"
			+" SET"
			+" status=#{status}"
			+" WHERE "
			+" doc_id=#{doc_id}";
	@Delete(D_DOC)
	public boolean deleteDocument(UpdateStatusDocument updateStatus);
}
