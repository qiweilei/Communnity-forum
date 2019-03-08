package com.webproject.feeds.service;

public interface SecurityService {
    String findLoggedInEmail();

    void autologin(String username, String password);
}
