package com.istms.backend.service.impl;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import com.istms.backend.dto.request.LoginRequest;
import com.istms.backend.dto.response.CurrentUserResponse;
import com.istms.backend.dto.response.LoginResponse;
import com.istms.backend.entity.AppRole;
import com.istms.backend.entity.AppUser;
import com.istms.backend.repository.AppUserRepository;
import com.istms.backend.service.AuthService;
import com.istms.backend.service.jwt.JwtService;

@Service
public class AuthServiceImpl implements AuthService {

    private final AppUserRepository appUserRepository;
    private final AuthenticationManager authenticationManager;
    private final JwtService jwtService;

    public AuthServiceImpl(AppUserRepository appUserRepository,
                           AuthenticationManager authenticationManager,
                           JwtService jwtService) {

        this.appUserRepository = appUserRepository;
        this.authenticationManager = authenticationManager;
        this.jwtService = jwtService;
    }

    @Override
    public LoginResponse login(LoginRequest request) {

        // Authenticate the user. This will throw BadCredentialsException if invalid.
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        request.getUsername(),
                        request.getPassword()
                )
        );

        AppUser user = (AppUser) authentication.getPrincipal();

        String fullName =
                (user.getFirstName() == null ? "" : user.getFirstName()) +
                (user.getLastName() == null ? "" : " " + user.getLastName());

        // Generate JWT (roles are embedded via getAuthorities())
        String token = jwtService.generateToken(user);

        // Get the primary role name from the database
        String roleName = user.getRoles() != null && !user.getRoles().isEmpty()
                ? user.getRoles().iterator().next().getAppRoleName()
                : "Unknown";

        return LoginResponse.builder()
                .username(user.getUsername())
                .fullName(fullName.trim())
                .role(roleName)
                .token(token)
                .message("Login Successful")
                .build();
    }

    @Override
    public CurrentUserResponse getCurrentUser(String username) {

        AppUser user = appUserRepository
                .findByUsername(username)
                .orElseThrow(() ->
                        new RuntimeException("User not found"));

        String fullName =
                (user.getFirstName() == null ? "" : user.getFirstName()) +
                (user.getLastName() == null ? "" : " " + user.getLastName());

        // Get real role name from database
        String roleName = user.getRoles() != null && !user.getRoles().isEmpty()
                ? user.getRoles().iterator().next().getAppRoleName()
                : "Unknown";

        // Get real department name from database
        String departmentName = user.getDepartment() != null
                ? user.getDepartment().getDepartmentName()
                : "Unknown";

        return CurrentUserResponse.builder()
                .username(user.getUsername())
                .fullName(fullName.trim())
                .employeeId(user.getEmployeeId())
                .department(departmentName)
                .role(roleName)
                .build();
    }
}