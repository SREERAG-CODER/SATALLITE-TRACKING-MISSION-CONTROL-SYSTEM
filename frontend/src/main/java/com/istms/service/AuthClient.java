package com.istms.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.istms.service.model.LoginRequest;
import com.istms.service.model.LoginResponse;
import javafx.application.Platform;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;
import java.util.concurrent.CompletableFuture;
import java.util.function.Consumer;

public class AuthClient {

    private static final String API_URL = "http://localhost:9090/api/auth/login";
    private static final HttpClient httpClient = HttpClient.newBuilder()
            .connectTimeout(Duration.ofSeconds(10))
            .build();
    private static final ObjectMapper mapper = new ObjectMapper();

    public static void login(String username, String password, 
                             Consumer<LoginResponse> onSuccess, 
                             Consumer<String> onError) {
        
        try {
            LoginRequest requestObj = new LoginRequest(username, password);
            String requestBody = mapper.writeValueAsString(requestObj);

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(API_URL))
                    .header("Content-Type", "application/json")
                    .POST(HttpRequest.BodyPublishers.ofString(requestBody))
                    .build();

            httpClient.sendAsync(request, HttpResponse.BodyHandlers.ofString())
                    .thenApply(response -> {
                        try {
                            if (response.statusCode() == 200) {
                                LoginResponse loginResponse = mapper.readValue(response.body(), LoginResponse.class);
                                Platform.runLater(() -> onSuccess.accept(loginResponse));
                            } else if (response.statusCode() == 401) {
                                Platform.runLater(() -> onError.accept("Invalid username or password"));
                            } else {
                                Platform.runLater(() -> onError.accept("Server Error: " + response.statusCode()));
                            }
                        } catch (Exception e) {
                            Platform.runLater(() -> onError.accept("Error parsing response: " + e.getMessage()));
                        }
                        return response;
                    })
                    .exceptionally(ex -> {
                        Platform.runLater(() -> onError.accept("Connection Failed: " + ex.getMessage()));
                        return null;
                    });

        } catch (Exception e) {
            Platform.runLater(() -> onError.accept("Error creating request: " + e.getMessage()));
        }
    }
}
