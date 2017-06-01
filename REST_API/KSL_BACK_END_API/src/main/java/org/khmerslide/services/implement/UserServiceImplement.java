package org.khmerslide.services.implement;

import java.util.ArrayList;
import java.util.List;

import org.khmerslide.entities.User;
import org.khmerslide.model.FormUserUpdate;
import org.khmerslide.model.FormUserUpdateStatus;
import org.khmerslide.model.UpdateUserProfile;
import org.khmerslide.repositories.UserRepositories;
import org.khmerslide.security.Role;
import org.khmerslide.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImplement implements UserService{
	@Autowired 
	private UserRepositories userRepository;
	@Override
	public ArrayList<User> getUser() {
		return userRepository.getUser();
	}
	@Override
	public boolean addUser(User user) {
		
		return userRepository.addUser(user);
	}
	@Override
	public boolean updateUser(FormUserUpdate user) {
		return userRepository.updateUser(user);
	}
	@Override
	public boolean deleteUser(int id) {
		return userRepository.deleteUser(id);
	}

	@Override
	public ArrayList<User> getUserById(int id) {
		// TODO Auto-generated method stub
		return userRepository.getUserById(id);
	}
	@Override
	public boolean setChangeStatusUser(FormUserUpdateStatus status) {
		// TODO Auto-generated method stub
		return userRepository.setChangeStatusUser(status);
	}
	
	/*
	 * 
	 * USER SECURITY
	 * 
	 */ 
	 
	
	@Override
	public org.khmerslide.security.User findUserByEmail(String userEmail) {
		// TODO Auto-generated method stub
		return userRepository.findUserByEmail(userEmail);
	}

	@Override
	public List<Role> findUserRolesByUserId(int roleId) {
		// TODO Auto-generated method stub
		return userRepository.findRolesByRoleId(roleId);
	}
	@Override
	public boolean updateUserProfilePicture(UpdateUserProfile user) {
		return userRepository.updateUserProfilePicture(user);
	}

}
