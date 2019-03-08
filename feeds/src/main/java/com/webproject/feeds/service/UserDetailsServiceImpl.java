package com.webproject.feeds.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webproject.feeds.model.Role;
import com.webproject.feeds.model.User;
import com.webproject.feeds.repository.UserRepository;

import java.util.HashSet;
import java.util.Set;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
	@Autowired
	private UserRepository userRepository;
	boolean accountNonExpired = true;
	boolean credentialsNonExpired = true;
	boolean accountNonLocked = true;

	@Override
	@Transactional(readOnly = true)
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		System.out.println("the user email is "+email);
		User user = userRepository.findByEmail(email);
		System.out.println("the user email is "+user.getEmail());
		Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
		for (Role role : user.getRoles()) {
			grantedAuthorities.add(new SimpleGrantedAuthority(role.getName()));
		}

		return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(),
				user.isEnabled(), accountNonExpired, credentialsNonExpired, accountNonLocked, grantedAuthorities);
	}
}
