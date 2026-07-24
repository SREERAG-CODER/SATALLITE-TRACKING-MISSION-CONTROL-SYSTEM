package com.istms.ui.auth;

import com.istms.ui.ScrollingBackgroundPane;
import javafx.animation.FadeTransition;
import javafx.animation.TranslateTransition;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.Hyperlink;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.scene.layout.Region;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.scene.shape.SVGPath;
import javafx.util.Duration;

public class LoginView extends StackPane {

    private final ScrollingBackgroundPane scrollingBackground;

    public LoginView(double width, double height) {
        setAlignment(Pos.CENTER);
        getStyleClass().add("login-root");

        String css = getClass().getResource("/com/istms/css/login.css").toExternalForm();
        getStylesheets().add(css);

        // 1. Dynamic Background (From user's CSS translation)
        scrollingBackground = new ScrollingBackgroundPane(width, height);
        scrollingBackground.startAnimation();

        // 2. Login Card
        StackPane cardContainer = new StackPane();
        cardContainer.setMaxWidth(480); // Wider card
        cardContainer.getStyleClass().add("login-card");
        
        VBox cardContent = new VBox(15);
        cardContent.setAlignment(Pos.CENTER);
        cardContent.setPadding(new Insets(20, 30, 20, 30));

        String logoPath = getClass().getResource("/com/istms/images/isro-logo.png").toExternalForm();
        ImageView logoView = new ImageView(new Image(logoPath));
        logoView.setFitWidth(150);
        logoView.setPreserveRatio(true);
        logoView.getStyleClass().add("login-logo");
        
        Label istmsTitle = new Label("ISTMS");
        istmsTitle.getStyleClass().add("login-title");

        // Username Field with Icon
        HBox userBox = createInputBox("M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z", "Authorized Personnel ID", false);
        TextField username = (TextField) userBox.getChildren().get(1);

        // Password Field with Icon
        HBox passBox = createInputBox("M18 8h-1V6c0-2.76-2.24-5-5-5S7 3.24 7 6v2H6c-1.1 0-2 .9-2 2v10c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V10c0-1.1-.9-2-2-2zM9 6c0-1.66 1.34-3 3-3s3 1.34 3 3v2H9V6zm9 14H6V10h12v10zm-6-3c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2z", "Security Credential", true);
        PasswordField password = (PasswordField) passBox.getChildren().get(1);

        Button loginBtn = new Button("AUTHENTICATE ACCESS");
        loginBtn.getStyleClass().add("login-button");
        loginBtn.setMaxWidth(Double.MAX_VALUE);

        cardContent.getChildren().addAll(logoView, istmsTitle, userBox, passBox, loginBtn);
        
        // UTC Clock
        Label timeLabel = new Label();
        timeLabel.getStyleClass().add("utc-clock");
        StackPane.setAlignment(timeLabel, Pos.TOP_RIGHT);
        StackPane.setMargin(timeLabel, new Insets(10, 10, 0, 0));
        
        javafx.animation.Timeline clock = new javafx.animation.Timeline(new javafx.animation.KeyFrame(javafx.util.Duration.ZERO, e -> {
            java.time.ZonedDateTime now = java.time.ZonedDateTime.now(java.time.ZoneId.of("Asia/Kolkata"));
            java.time.format.DateTimeFormatter formatter = java.time.format.DateTimeFormatter.ofPattern("HH:mm:ss 'IST'");
            timeLabel.setText(now.format(formatter));
        }), new javafx.animation.KeyFrame(javafx.util.Duration.seconds(1)));
        clock.setCycleCount(javafx.animation.Animation.INDEFINITE);
        clock.play();
        
        cardContainer.getChildren().addAll(cardContent, timeLabel);

        Label footer = new Label("SATELLITE TRACKING AND MISSION OPERATIONS SYSTEM — VERSION 1.0.0\nCLASSIFIED ACCESS ONLY");
        footer.getStyleClass().add("login-footer");
        
        VBox contentOverlay = new VBox(30);
        contentOverlay.setAlignment(Pos.CENTER);
        contentOverlay.getChildren().addAll(cardContainer, footer);

        getChildren().addAll(scrollingBackground, contentOverlay);
        
        // 3. Entry Animations
        animateEntry(cardContainer, footer);
    }
    
    private HBox createInputBox(String svgData, String prompt, boolean isPassword) {
        HBox box = new HBox(15);
        box.setAlignment(Pos.CENTER_LEFT);
        box.getStyleClass().add("input-box");
        
        SVGPath icon = new SVGPath();
        icon.setContent(svgData);
        icon.getStyleClass().add("input-icon");
        
        TextField field = isPassword ? new PasswordField() : new TextField();
        field.setPromptText(prompt);
        field.getStyleClass().add("login-field");
        HBox.setHgrow(field, Priority.ALWAYS);
        
        field.focusedProperty().addListener((obs, oldVal, newVal) -> {
            if (newVal) {
                box.getStyleClass().add("focused");
            } else {
                box.getStyleClass().remove("focused");
            }
        });
        
        box.getChildren().addAll(icon, field);
        return box;
    }

    private void animateEntry(StackPane cardContainer, Label footer) {
        cardContainer.setOpacity(0);
        cardContainer.setTranslateY(30);
        footer.setOpacity(0);
        
        FadeTransition ftCard = new FadeTransition(Duration.millis(800), cardContainer);
        ftCard.setFromValue(0);
        ftCard.setToValue(1);
        
        TranslateTransition ttCard = new TranslateTransition(Duration.millis(800), cardContainer);
        ttCard.setFromY(30);
        ttCard.setToY(0);
        ttCard.setInterpolator(javafx.animation.Interpolator.EASE_OUT);
        
        FadeTransition ftFooter = new FadeTransition(Duration.millis(1000), footer);
        ftFooter.setFromValue(0);
        ftFooter.setToValue(1);
        ftFooter.setDelay(Duration.millis(400));
        
        ftCard.play();
        ttCard.play();
        ftFooter.play();
    }
}
