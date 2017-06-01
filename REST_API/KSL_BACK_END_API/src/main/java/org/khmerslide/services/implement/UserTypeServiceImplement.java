package org.khmerslide.services.implement;

import java.util.ArrayList;

import org.khmerslide.entities.User_Type;
import org.khmerslide.repositories.UserTypeRepositories;
import org.khmerslide.services.UserTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserTypeServiceImplement implements UserTypeService{
	@Autowired 
	private UserTypeRepositories userTypeRepository;

	@Override
	public ArrayList<User_Type> getUserType() {
		return userTypeRepository.getUserType();
	}

	@Override
	public boolean addUserType(User_Type ut) {
		return userTypeRepository.addUserType(ut);
	}

}
