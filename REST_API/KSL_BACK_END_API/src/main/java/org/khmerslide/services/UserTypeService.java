package org.khmerslide.services;

import java.util.ArrayList;

import org.khmerslide.entities.User_Type;


public interface UserTypeService {
	public ArrayList<User_Type> getUserType();
	public boolean addUserType(User_Type ut);
//	public boolean updateUser(User user);
//	public boolean deleteUser(int id);
//	
//	public boolean setApproveByAdmin(int status);
}
