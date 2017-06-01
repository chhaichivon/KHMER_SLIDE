package org.khmerslide.services;

import java.util.List;

import org.khmerslide.model.*;


public interface UserServices {
	
	

	/*login user*/
	public User findUserByEmail(String userEmail);
	public List<Role> findUserRolesByUserId( int roleId);
}
