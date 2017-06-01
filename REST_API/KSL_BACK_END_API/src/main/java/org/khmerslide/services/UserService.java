package org.khmerslide.services;

import java.util.ArrayList;
import java.util.List;

import org.khmerslide.entities.User;
import org.khmerslide.model.FormUserUpdate;
import org.khmerslide.model.FormUserUpdateStatus;
import org.khmerslide.model.UpdateUserProfile;
import org.khmerslide.security.Role;


public interface UserService {
	public ArrayList<User> getUser();
	public ArrayList<User> getUserById(int id);
	public boolean addUser(User user);
	public boolean updateUser(FormUserUpdate user);
	public boolean updateUserProfilePicture(UpdateUserProfile user);
	public boolean deleteUser(int id);
	
	public boolean setChangeStatusUser(FormUserUpdateStatus status);
	
	

	/*
	 * 
	 * SECURITY USER
	 * 
	 */
	public org.khmerslide.security.User findUserByEmail(String userEmail);
	public List<Role> findUserRolesByUserId( int roleId);
}
