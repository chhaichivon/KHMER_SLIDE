package org.khmerslide.repositories;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.khmerslide.entities.Category;
import org.khmerslide.model.UpdateCategory;
import org.khmerslide.utilities.Pagination;
import org.springframework.stereotype.Repository;
@Repository
public interface CategoryRepository {
	/*Status 
      1 active
	  2.disactive
	  3.delete
	 */
//	==============================Get All Category===============================
	String G_C="SELECT" 
			 +" CB.cat_id," 
			 +" CB.cat_name," 
			 +" C.cat_name AS PARENT," 
			 +" CB.created_date," 
			 +" CB.status," 
			 +" U.user_name," 
			 +" CB.description," 
			 +" CB.icon,"
			 +" CB.folder_google_drive" 
			 +" FROM  ksl_category C" 
			 +" FULL JOIN ksl_category CB ON C.cat_id = CB.parent_id" 
			 +" FULL JOIN ksl_user U ON U.user_id= CB.user_id" 
			 +" WHERE CB.status !=3";
//			 + "LIMIT #{pagination.limit} "
//			 + "OFFSET #{pagination.offset}";
	@Select(G_C)
	@Results(value={
			@Result(property="user.user_name", column="user_name"),
			@Result(property="parent.cat_name", column="PARENT")
	})
	public ArrayList<Category> getCategory();
	
	
//	============================Get Category By ID================================	
	String G_CBI="SELECT"
			 +" CB.cat_id,"
			 +" CB.cat_name," 
			 +" C.cat_name AS PARENT," 
			 +" CB.created_date," 
			 +" CB.status," 
			 +" U.user_name," 
			 +" CB.description," 
			 +" CB.icon" 
			 +" FROM  ksl_category C" 
			 +" FULL JOIN ksl_category CB ON C.cat_id = CB.parent_id" 
			 +" FULL JOIN ksl_user U ON U.user_id= CB.user_id" 
			 +" WHERE CB.status !=3"
			 +" AND"
			 +" CB.cat_id=#{id}";
	@Select(G_CBI)
	@Results(value={
			@Result(property="user.user_name", column="user_name"),
			@Result(property="parent.cat_name", column="PARENT")
	})
	public ArrayList<Category> getCategoryById(int id);
	
	
//	=========================Get Main Category=================================	
	String G_MCATEGORY="SELECT"
			 +" C.cat_id,"
			 +" C.cat_name,"  
			 +" C.icon,"
			 +" C.description" 
			 +" FROM  ksl_category C" 
			 +" WHERE C.status = 1"
			 +" AND"
			 +" C.parent_id= 0";
	@Select(G_MCATEGORY)
	public ArrayList<Category> getMainCategory();
	
	
//	=======================Get Sub Category========================================	
	String G_SCATEGORY="SELECT"
			 +" DISTINCT(C.cat_id),"
			 +" C.parent_id,"
			 +" C.cat_name" 
			 +" FROM  ksl_category C" 
			 +" WHERE C.status = 1"
			 +" AND"
			 +" C.parent_id= #{id}";
	@Results(value={
			@Result(property="parent.cat_id", column="parent_id")
	})
	@Select(G_SCATEGORY)
	public ArrayList<Category> getSubCategoryByParentId(int id);
	
	
//	======================================Add Category=================================	
	String A_C="INSERT INTO"
			+" ksl_category("
			+" parent_id,"
			+" cat_name,"
			+" created_date,"
			+" status,"
			+" user_id,"
			+" description,"
			+" folder_google_drive,"
			+" icon)"
			+" VALUES("
			+" #{parent.cat_id},"
			+" #{cat_name},"
			+" #{created_date},"
			+" #{status},"
			+" #{user.user_id},"
			+" #{description},"
			+" #{folder_google_drive},"
			+ "#{icon})";
	@Insert(A_C)
	@Results(value={
			@Result(property="user.user_id", column="user_id")
	})
	public boolean addCategory(Category category);
	
	Category  Cate = new Category();
	//catch value by id in row table cateogry
	String SQL="SELECT"
			+" parent_id,"
			+" cate_name,"
			+" status,"
			+" description,"
			+" icon,"
			+" FROM"
			+" ksl_category,"
			+" WHERE"
			+" cate_id=#{cate_id}";
	
			
//	=====================================Update Category==========================	
	String U_C="UPDATE ksl_category SET"
			+" parent_id=#{parent_id},"
			+" cat_name=#{cat_name},"
			+" status=#{status},"
			+" description=#{description},"
			+" icon=#{icon}"
			+" WHERE"
			+" cat_id=#{cat_id}";
	@Update(U_C)
	public boolean updateCategory(UpdateCategory category);
			
	
	
	String D_C="UPDATE ksl_category"
			 +" SET"
			 +" status=3"
			 +" WHERE"
			 +" cat_id=#{cat_id}";
	@Delete(D_C)
	public boolean deleteCategory(int cat_id);
}
