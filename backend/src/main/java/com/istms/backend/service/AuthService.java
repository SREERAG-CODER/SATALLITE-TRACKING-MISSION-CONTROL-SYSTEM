package com.istms.backend.service;

import com.istms.backend.dto.request.LoginRequest;
import com.istms.backend.dto.response.CurrentUserResponse;
import com.istms.backend.dto.response.LoginResponse;

public interface AuthService {

    LoginResponse login(LoginRequest request);

    CurrentUserResponse getCurrentUser(String username);

}