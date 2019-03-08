package com.webproject.feeds.service;

import com.webproject.feeds.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
    User findByEmail(String email);
    User findByConfirmationToken(String confirmationToken);
    User findById(long id);
    
    int updateUserSetStatusForName( boolean enabled, String email);
    int updateUserInformation(String username,String firstname,String lastname,String phoneNumber,String email,byte[] photo);
}
