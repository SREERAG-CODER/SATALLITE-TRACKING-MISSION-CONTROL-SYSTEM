package com.istms;

import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.control.ProgressBar;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class BootSplashScreen {

    public static void play(Stage stage, Runnable onFinished) {
        Label title = new Label("ISTMS");
        title.getStyleClass().add("splash-title");

        Label subtitle = new Label("Satellite Tracking & Mission Control System");
        subtitle.getStyleClass().add("splash-subtitle");

        Label statusLabel = new Label("Starting up...");
        statusLabel.getStyleClass().add("splash-status");

        ProgressBar progressBar = new ProgressBar(0);
        progressBar.getStyleClass().add("splash-progress");
        progressBar.setPrefWidth(420);

        VBox root = new VBox(14, title, subtitle, statusLabel, progressBar);
        root.setAlignment(Pos.CENTER);
        root.setPadding(new Insets(40));
        root.getStyleClass().add("splash-root");

        Scene scene = new Scene(root);
        scene.getStylesheets().add(BootSplashScreen.class.getResource("/com/istms/style.css").toExternalForm());

        stage.setScene(scene);
        stage.setFullScreenExitHint("");
        //stage.setFullScreen(true);

        BootSequenceTask task = new BootSequenceTask();
        statusLabel.textProperty().bind(task.messageProperty());
        progressBar.progressProperty().bind(task.progressProperty());

        task.setOnSucceeded(e -> onFinished.run());
        task.setOnFailed(e -> {
            statusLabel.textProperty().unbind();
            statusLabel.setText("Startup failed: " + task.getException().getMessage());
        });

        Thread thread = new Thread(task, "boot-sequence");
        thread.setDaemon(true);
        thread.start();
    }
}