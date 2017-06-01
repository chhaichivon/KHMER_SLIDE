package org.khmerslide.repositories;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.Many;
import org.khmerslide.entities.User;
import org.khmerslide.model.FormUserUpdate;
import org.khmerslide.model.FormUserUpdateStatus;
import org.khmerslide.model.UpdateDocument;
import org.khmerslide.model.UpdateUserProfile;
import org.khmerslide.security.Role;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepositories {
	
	/*  Status 
	    1 active
		2.disactive
		3.delete
	*/
	String R_USER="SELECT"
				+" U.user_id,"
				+" U.user_name,"
				+" U.gender,"
				+" U.email,"
				+" U.password,"
				+" U.registered_date,"
				+" U.photo,"
				+" U.description,"
				+" U.status,"
				+" ut.role_name"
				+" FROM "
				+" ksl_user U"
				+" INNER JOIN ksl_user_type ut ON U.role_id = ut.role_id"
				+" WHERE U.status !=3";
	@Select(R_USER)
	@Results(value={
			@Result(property="role.role_name", column="role_name")
	})
	public ArrayList<User> getUser();
	
	String R_USERBYID="SELECT"
			+" U.user_id,"
			+" U.user_name,"
			+" U.gender,"
			+" U.email,"
			+" U.password,"
			+" U.registered_date,"
			+" U.photo,"
			+" U.description,"
			+" U.status,"
			+" ut.role_name,"
			+" ut.role_id"
			+" FROM "
			+" ksl_user U"
			+" INNER JOIN ksl_user_type ut ON U.role_id = ut.role_id"
			+" WHERE U.user_id =#{id}";
@Select(R_USERBYID)
@Results(value={
		@Result(property="role.role_id", column="role_id"),
		@Result(property="role.role_name", column="role_name")
})
public ArrayList<User> getUserById(int id);

	String C_USER="INSERT INTO "
					+ "ksl_user("
					+ "user_name,"
					+ "gender,"
					+ "email,"
					+ "password,"
					+ "photo,"
					+ "registered_date,"
					+ "status,"
					+ "role_id) "
					+ "VALUES("
					+ "#{user_name},"
					+ "#{gender},"
					+ "#{email},"
					+ "#{password},"
					+ "#{photo},"
					+ "#{registered_date},"
					+ "#{status},"
					+ "#{role.role_id})"; 
	@Insert(C_USER)
	public boolean addUser(User user);
	
	
	
	
	String UABA="UPDATE ksl_user "
			+ " SET"
			+ " status=#{status}"
			+ " WHERE user_id =#{user_id}";
	@Update(UABA)
//	@Results(value={
//			@Result(property="user_id", column="user_id"),
//			@Result(property="status", column="status")
//	})
	public boolean setChangeStatusUser(FormUserUpdateStatus status);
	
	
	String U_USER="UPDATE ksl_user "
					+ "SET "
					+ "user_name=#{user_name},"
					+ "gender=#{gender},"
//					+ "email=#{email},"
//					+ "registered_date=#{registered_date},"
//					+ "photo=#{photo},"
//					+ "description=#{description},"
					+ "password=#{password},"
					+ "status=#{status},"
					+ "role_id=#{role_id} "
					+ "WHERE "
					+ "user_id=#{user_id}";
	@Update(U_USER)
	@Results(value={
			@Result(property="role_id", column="role_id")
	})
	public boolean updateUser(FormUserUpdate user);
	
	//===================================Update User Profile Picture=============================================	
	String U_USERPRO="UPDATE ksl_user "
			+ "SET "
			+ "photo=#{photo} "
			+ "WHERE "
			+ "user_id=#{user_id}";
	@Update(U_USERPRO)
	public boolean updateUserProfilePicture(UpdateUserProfile user);

	String D_USER="DELETE FROM "
					+ "ksl_user "
					+ "WHERE "
					+ "user_id=#{id}";
	@Delete(D_USER)
	public boolean deleteUser(int id);
	
	
	

	/*
	 * 
	 * 
	 * USER LOGIN SECURITY
	 * 
	 * 
	 * 
	 */
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Select("SELECT"
			+" user_id,"
			+" user_name,"
			+" password,"
			+" email,"
			+" role_id, "
			+" status "
			+" FROM"
			+" ksl_user"
			+" WHERE"
			+" email= #{userEmail}")
	@Results(value = {
			@Result(property = "id" , column = "user_id"),
			@Result(property = "username" , column = "user_name"),
			@Result(property = "email" , column = "email"),
			@Result(property = "password" , column = "password"),
			@Result(property = "status" , column = "status"),
			@Result(property = "roles", column = "role_id",
				many = @Many(select = "findRolesByRoleId")
			)
	})
	public org.khmerslide.security.User findUserByEmail(@Param("userEmail") String userEmail);

	@Select("SELECT"
			+" role_id,"
			+" role_name"
			+" FROM"
			+" ksl_user_type"
			+" WHERE"
			+" role_id=#{role_id}")
	@Results(value = {
		@Result(property="id" , column="role_id"),
		@Result(property="roleName" , column="role_name")
	})
	public List<Role> findRolesByRoleId(@Param("role_id") int role_id);

	
}
