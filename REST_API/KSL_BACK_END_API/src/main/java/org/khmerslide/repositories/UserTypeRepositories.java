package org.khmerslide.repositories;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.khmerslide.entities.User_Type;
import org.springframework.stereotype.Repository;

@Repository
public interface UserTypeRepositories {
	
	/*  1 active
		2.disactive
		3.delete
	*/
	
	
	
	
	String R_USERTYPE="SELECT "
				+" ut.role_id,"
				+" ut.role_name,"
				+" ut.description,"
				+" ut.status"
				+" FROM"
				+" ksl_user_type ut"
				+" WHERE ut.status != 3";
	@Select(R_USERTYPE)
	public ArrayList<User_Type> getUserType();
	
/*	String SUTA="SELECT "
			+" U.user_id,"
			+" U.user_name,"
			+" U.gender,"
			+" U.email,"
			+" U.password,"
			+" U.registered_date,"
			+" U.photo,"
			+" U.description,"
			+" U.status,"
			+" ut.role_name "
			+" FROM"
			+" ksl_user U" 
			+" INNER JOIN ksl_user_type ut ON U.role_id = ut.role_id" 
			+" WHERE U.status = ";
	@Select(SUTA)
	public boolean selectUserThatActive(int status);*/
	

	String C_USER="INSERT INTO "
			+ "ksl_user_type("
			+ "role_name,"
			+ "description,"
			+ "status "
			+ "VALUES("
			+ "#{role_name},"
			+ "#{description},"
			+ "#{status})"; 
@Insert(C_USER)
public boolean addUserType(User_Type ut);
//	
//	
//	
//	
//	String UABA="UPDATE ksl_user "
//			+ " SET"
//			+ " status=#{status}"
//			+ " WHERE stutus = 2 "
//			+ " AND"
//			+ " user_id =#{user_id}";
//	@Update(UABA)
//	public boolean setApproveByAdmin(int status);
//	
//	
//	String U_USER="UPDATE ksl_user "
//					+ "SET "
//					+ "user_name=#{user_name},"
//					+ "gender=#{gender},"
//					+ "email=#{email},"
//					+ "registered_date=#{registered_date},"
//					+ "photo=#{photo},"
//					+ "description=#{description},"
//					+ "status=#{status},"
//					+ "role_id=#{role_id.role_id} "
//					+ "WHERE "
//					+ "user_id=#{user_id}";
//	@Update(U_USER)
//	public boolean updateUser(User user);
//
//	String D_USER="DELETE FROM "
//					+ "ksl_user "
//					+ "WHERE "
//					+ "user_id=#{id}";
//	@Delete(D_USER)
//	public boolean deleteUser(int id);

	
}