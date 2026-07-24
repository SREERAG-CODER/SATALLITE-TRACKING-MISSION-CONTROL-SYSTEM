package com.istms.app;

import com.istms.ui.SceneManager;
import com.istms.ui.auth.LoginView;
import com.istms.ui.splash.SplashScreenView;
import javafx.application.Application;
import javafx.geometry.Rectangle2D;
import javafx.stage.Screen;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

public class ISTMSApplication extends Application {

    @Override
    public void start(Stage primaryStage) {
        primaryStage.setTitle("ISTMS - Mission Control");
        
        // Remove OS window decorations for a true fullscreen spaceship feel
        primaryStage.initStyle(StageStyle.UNDECORATED);

        SceneManager.getInstance().init(primaryStage);

        Rectangle2D screenBounds = Screen.getPrimary().getBounds();
        
        LoginView loginView = new LoginView(screenBounds.getWidth(), screenBounds.getHeight());
        SceneManager.getInstance().setScene(loginView);
    }

    public static void main(String[] args) {
        launch(args);
    }
}
