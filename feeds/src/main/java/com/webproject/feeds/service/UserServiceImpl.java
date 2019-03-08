package com.webproject.feeds.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.webproject.feeds.model.User;
import com.webproject.feeds.repository.RoleRepository;
import com.webproject.feeds.repository.UserRepository;
import java.util.Arrays;
import java.util.HashSet;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(new HashSet<>(Arrays.asList(roleRepository.findByName("ROLE_USER"))));
        userRepository.save(user);
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
    @Override
    public User findByConfirmationToken(String confirmationToken){
		return userRepository.findByConfirmationToken(confirmationToken);
    	
    }
    @Override
    @Transactional
    public int updateUserSetStatusForName(boolean enabled, String email){
    	
    	return userRepository.updateUserSetStatusForName(enabled, email);
    }
    @Override
    @Transactional
    public int updateUserInformation(String username,String firstname,String lastname,String phoneNumber,String email,byte[] photo){
    	return userRepository.updateUserInformation(username,firstname, lastname, phoneNumber, email,photo);
    }

	@Override
	public User findByEmail(String email) {
		// TODO Auto-generated method stub
		return userRepository.findByEmail(email);
	}

	@Override
	public User findById(long id) {
		// TODO Auto-generated method stub
		return userRepository.findById(id);
	}
    
}
