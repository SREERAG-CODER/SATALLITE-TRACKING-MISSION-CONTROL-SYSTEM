package com.istms.backend.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordGenerator {

    public static void main(String[] args) {

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        System.out.println("admin123      -> " + encoder.encode("admin123"));
        System.out.println("mission123    -> " + encoder.encode("mission123"));
        System.out.println("engineer123   -> " + encoder.encode("engineer123"));
        System.out.println("telemetry123  -> " + encoder.encode("telemetry123"));
        System.out.println("ai123         -> " + encoder.encode("ai123"));

    }
}