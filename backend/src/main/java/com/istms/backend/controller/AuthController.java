package com.istms.backend.controller;

import com.istms.backend.dto.request.LoginRequest;
import com.istms.backend.dto.response.CurrentUserResponse;
import com.istms.backend.dto.response.LoginResponse;
import com.istms.backend.service.AuthService;
import com.istms.backend.entity.AppUser;
import jakarta.validation.Valid;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "*")
public class AuthController {

    private final AuthService authService;

    public AuthController(AuthService authService) {
        this.authService = authService;
    }

    /**
     * User Login
     */
    @PostMapping("/login")
    public ResponseEntity<LoginResponse> login(
            @Valid @RequestBody LoginRequest request) {

        LoginResponse response = authService.login(request);
        return ResponseEntity.ok(response);
    }

    /**
     * Get Current Logged-in User
     */
    @GetMapping("/me")
    public ResponseEntity<CurrentUserResponse> getCurrentUser(
            Authentication authentication) {

        AppUser user = (AppUser) authentication.getPrincipal();

        CurrentUserResponse response =
                authService.getCurrentUser(user.getUsername());

    return ResponseEntity.ok(response);
}
}