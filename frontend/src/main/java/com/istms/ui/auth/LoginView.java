package com.istms.ui.auth;

import com.istms.service.AuthClient;
import com.istms.ui.ScrollingBackgroundPane;
import javafx.animation.FadeTransition;
import javafx.animation.TranslateTransition;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.scene.shape.SVGPath;
import javafx.util.Duration;

public class LoginView extends StackPane {

    private final ScrollingBackgroundPane scrollingBackground;
    private VBox contentOverlay;
    private StackPane cardContainer;
    private Label footer;

    public LoginView(double width, double height) {
        setAlignment(Pos.CENTER);
        getStyleClass().add("login-root");

        String css = getClass().getResource("/com/istms/css/login.css").toExternalForm();
        getStylesheets().add(css);

        // 1. Dynamic Background (From user's CSS translation)
        scrollingBackground = new ScrollingBackgroundPane(width, height);
        scrollingBackground.startAnimation();

        // 2. Login Card
        cardContainer = new StackPane();
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
        VBox.setMargin(istmsTitle, new Insets(-25, 0, 10, 0)); // Reduce space between logo and title

        // Username Field with Icon
        HBox userBox = createInputBox("M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z", "Personnel ID", false);
        TextField username = (TextField) userBox.getChildren().get(1);

        HBox passBox = createInputBox("M18 8h-1V6c0-2.76-2.24-5-5-5S7 3.24 7 6v2H6c-1.1 0-2 .9-2 2v10c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V10c0-1.1-.9-2-2-2zM9 6c0-1.66 1.34-3 3-3s3 1.34 3 3v2H9V6zm9 14H6V10h12v10zm-6-3c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2z", "Password", true);
        PasswordField password = (PasswordField) passBox.getChildren().get(1);

        Button loginBtn = new Button("AUTHENTICATE ACCESS");
        loginBtn.getStyleClass().add("login-button");
        loginBtn.setMaxWidth(Double.MAX_VALUE);

        // API Authentication Logic
        loginBtn.setOnAction(e -> {
            String user = username.getText();
            String pass = password.getText();
            
            if (user == null || user.trim().isEmpty() || pass == null || pass.trim().isEmpty()) {
                AnimatedPopup.show(this, "MISSING CREDENTIALS\nPlease enter username and password", false);
                return;
            }

            loginBtn.setDisable(true);
            loginBtn.setText("AUTHENTICATING...");

            AuthClient.login(user, pass,
                // On Success
                response -> {
                    loginBtn.setDisable(false);
                    loginBtn.setText("AUTHENTICATE ACCESS");

                    // Save session state
                    com.istms.service.UserSession.createSession(response);

                    AnimatedPopup.show(this, "WELCOME\n" + (response.getFullName() != null && !response.getFullName().isEmpty() ? response.getFullName().toUpperCase() : response.getUsername().toUpperCase()), true);
                    
                    // Trigger Shatter and Dashboard transition immediately
                    transitionToDashboard();
                },
                // On Error
                errorMsg -> {
                    loginBtn.setDisable(false);
                    loginBtn.setText("AUTHENTICATE ACCESS");
                    AnimatedPopup.show(this, "INCORRECT PASSWORD\n" + errorMsg, false);
                }
            );
        });

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

        footer = new Label("SATELLITE TRACKING AND MISSION OPERATIONS SYSTEM — VERSION 1.0.0\nCLASSIFIED ACCESS ONLY");
        footer.getStyleClass().add("login-footer");
        
        contentOverlay = new VBox(30);
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

    private void transitionToDashboard() {
        // Hide footer immediately
        FadeTransition ftFooter = new FadeTransition(Duration.millis(300), footer);
        ftFooter.setToValue(0);
        ftFooter.play();

        // 1. Take snapshot of JUST the cardContainer (the grey box) with transparent background
        javafx.scene.SnapshotParameters params = new javafx.scene.SnapshotParameters();
        params.setFill(javafx.scene.paint.Color.TRANSPARENT);
        javafx.scene.image.WritableImage snapshot = cardContainer.snapshot(params, null);
        
        // 2. Hide the actual cardContainer
        cardContainer.setVisible(false);

        // 3. Create a shatter/fold effect grid
        javafx.scene.Group shatterGroup = new javafx.scene.Group();
        int cols = 15;
        int rows = 15;
        double width = snapshot.getWidth();
        double height = snapshot.getHeight();
        double cellWidth = width / cols;
        double cellHeight = height / rows;

        // Determine exact position of cardContainer inside LoginView
        javafx.geometry.Bounds bounds = cardContainer.localToScene(cardContainer.getBoundsInLocal());
        
        // Disable StackPane centering for shatterGroup so translates match scene bounds exactly
        StackPane.setAlignment(shatterGroup, Pos.TOP_LEFT);
        shatterGroup.setTranslateX(bounds.getMinX());
        shatterGroup.setTranslateY(bounds.getMinY());

        javafx.animation.ParallelTransition shatterAnim = new javafx.animation.ParallelTransition();

        for (int i = 0; i < cols; i++) {
            for (int j = 0; j < rows; j++) {
                ImageView piece = new ImageView(snapshot);
                piece.setViewport(new javafx.geometry.Rectangle2D(i * cellWidth, j * cellHeight, cellWidth, cellHeight));
                piece.setTranslateX(i * cellWidth);
                piece.setTranslateY(j * cellHeight);
                shatterGroup.getChildren().add(piece);

                // They fold onto each other towards the top left corner (0,0)
                double animDuration = 700; // Slowed down from 400
                
                TranslateTransition tt = new TranslateTransition(Duration.millis(animDuration), piece);
                // Move towards top-left (relative to its current position, which is 0,0 of the group)
                tt.setToX(0);
                tt.setToY(0);

                FadeTransition ft = new FadeTransition(Duration.millis(animDuration), piece);
                ft.setToValue(0);
                
                javafx.animation.ScaleTransition st = new javafx.animation.ScaleTransition(Duration.millis(animDuration), piece);
                st.setToX(0);
                st.setToY(0);

                javafx.animation.ParallelTransition pieceAnim = new javafx.animation.ParallelTransition(tt, ft, st);
                
                // Delay based on distance from top-left (so bottom-right moves first, top-left moves last)
                double delayMs = ((cols - 1 - i) * 50) + ((rows - 1 - j) * 50); // Increased delay between pieces from 30 to 50
                pieceAnim.setDelay(Duration.millis(delayMs)); 
                
                shatterAnim.getChildren().add(pieceAnim);
            }
        }

        // Add shatter group to scene
        getChildren().add(shatterGroup);

        // When shatter completes, show dashboard
        shatterAnim.setOnFinished(e -> {
            getChildren().remove(shatterGroup);
            contentOverlay.setVisible(false);
            showDashboardPanel();
        });
        
        shatterAnim.play();
    }

    private void showDashboardPanel() {
        // Transparent light blue panel taking 80% screen
        StackPane dashboardPanel = new StackPane();
        dashboardPanel.setStyle(
            "-fx-background-color: rgba(0, 150, 255, 0.15);" +
            "-fx-border-color: rgba(0, 200, 255, 0.5);" +
            "-fx-border-width: 2px;" +
            "-fx-border-radius: 4px;" +
            "-fx-background-radius: 4px;" +
            "-fx-effect: dropshadow(three-pass-box, rgba(0, 150, 255, 0.4), 30, 0, 0, 0);"
        );
        
        // Size it to 90% of window
        dashboardPanel.prefWidthProperty().bind(widthProperty().multiply(0.9));
        dashboardPanel.prefHeightProperty().bind(heightProperty().multiply(0.9));
        dashboardPanel.setMaxWidth(javafx.scene.layout.Region.USE_PREF_SIZE);
        dashboardPanel.setMaxHeight(javafx.scene.layout.Region.USE_PREF_SIZE);
        
        // Add a placeholder label for now
        Label placeholder = new Label("DASHBOARD INITIALIZING...");
        placeholder.setStyle("-fx-text-fill: white; -fx-font-family: 'Inter'; -fx-font-size: 24px; -fx-font-weight: bold; -fx-letter-spacing: 4px;");
        dashboardPanel.getChildren().add(placeholder);

        dashboardPanel.setOpacity(0);
        dashboardPanel.setScaleX(0);
        dashboardPanel.setScaleY(0);

        getChildren().add(dashboardPanel);

        // Entrance animation for dashboard (fast scale and fade from center)
        FadeTransition ft = new FadeTransition(Duration.millis(350), dashboardPanel);
        ft.setToValue(1);

        javafx.animation.ScaleTransition st = new javafx.animation.ScaleTransition(Duration.millis(350), dashboardPanel);
        st.setToX(1);
        st.setToY(1);
        st.setInterpolator(javafx.animation.Interpolator.EASE_OUT);

        ft.play();
        st.play();
    }
}
