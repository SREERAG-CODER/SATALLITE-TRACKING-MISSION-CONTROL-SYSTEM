package com.istms;

import javafx.application.Application;
import javafx.stage.Stage;

public class Main extends Application {

    @Override
    public void start(Stage stage) {
        stage.setTitle("ISTMS - Satellite Tracking Mission Control System");
        BootSplashScreen.play(stage, () -> showLogin(stage));
    }

    private void showLogin(Stage stage) {
        javafx.scene.control.Label label = new javafx.scene.control.Label("LOGIN SCREEN PLACEHOLDER");
        label.setStyle("-fx-text-fill: #39ff88; -fx-font-size: 28px;");
        javafx.scene.layout.StackPane root = new javafx.scene.layout.StackPane(label);
        root.setStyle("-fx-background-color: #0a0e14;");
        javafx.scene.Scene loginScene = new javafx.scene.Scene(root);
        stage.setScene(loginScene);
    }

    public static void main(String[] args) {
        launch(args);
    }
}