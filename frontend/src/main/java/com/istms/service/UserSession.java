package com.istms.service;

import com.istms.service.model.LoginResponse;

public class UserSession {

    private static UserSession instance;

    private String username;
    private String fullName;
    private String role;
    private String token;

    private UserSession(LoginResponse response) {
        this.username = response.getUsername();
        this.fullName = response.getFullName();
        this.role = response.getRole();
        this.token = response.getToken();
    }

    public static synchronized void createSession(LoginResponse response) {
        instance = new UserSession(response);
    }

    public static synchronized UserSession getInstance() {
        return instance;
    }

    public static synchronized void cleanUserSession() {
        instance = null;
    }

    public String getUsername() { return username; }
    public String getFullName() { return fullName; }
    public String getRole() { return role; }
    public String getToken() { return token; }

    public boolean isLoggedIn() {
        return token != null && !token.isEmpty();
    }
}
