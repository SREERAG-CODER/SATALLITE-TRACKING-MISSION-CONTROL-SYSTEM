package com.istms.ui;

import javafx.animation.FadeTransition;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.util.Duration;

public class SceneManager {

    private static SceneManager instance;
    private Stage primaryStage;
    private Scene currentScene;

    private SceneManager() {}

    public static SceneManager getInstance() {
        if (instance == null) {
            instance = new SceneManager();
        }
        return instance;
    }

    public void init(Stage stage) {
        this.primaryStage = stage;
        // Enforce full screen styling for spaceship feel
        this.primaryStage.setFullScreenExitHint("");
        this.primaryStage.setFullScreen(true);
        // If not full screen, at least maximized and undecorated
        // this.primaryStage.initStyle(javafx.stage.StageStyle.UNDECORATED); 
    }

    public void setScene(Parent root) {
        if (currentScene == null) {
            currentScene = new Scene(root, 1920, 1080); // Default resolution
            loadStylesheets(currentScene);
            primaryStage.setScene(currentScene);
        } else {
            currentScene.setRoot(root);
        }
        
        primaryStage.setFullScreen(true);
        if (!primaryStage.isShowing()) {
            primaryStage.show();
        }
    }

    public void fadeTransitionTo(Parent newRoot) {
        if (currentScene == null) {
            setScene(newRoot);
            return;
        }

        Parent oldRoot = currentScene.getRoot();
        FadeTransition fadeOut = new FadeTransition(Duration.millis(500), oldRoot);
        fadeOut.setFromValue(1.0);
        fadeOut.setToValue(0.0);
        fadeOut.setOnFinished(e -> {
            setScene(newRoot);
            newRoot.setOpacity(0.0);
            FadeTransition fadeIn = new FadeTransition(Duration.millis(500), newRoot);
            fadeIn.setFromValue(0.0);
            fadeIn.setToValue(1.0);
            fadeIn.play();
        });
        fadeOut.play();
    }

    private void loadStylesheets(Scene scene) {
        String globalCss = getClass().getResource("/com/istms/css/global.css").toExternalForm();
        scene.getStylesheets().add(globalCss);
    }
}
