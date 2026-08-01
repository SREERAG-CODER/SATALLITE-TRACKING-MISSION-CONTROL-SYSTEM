package com.istms.ui.auth;

import javafx.animation.FadeTransition;
import javafx.animation.PauseTransition;
import javafx.animation.TranslateTransition;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.Label;
import javafx.scene.layout.HBox;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.scene.shape.Circle;
import javafx.util.Duration;

public class AnimatedPopup {

    private static StackPane activeContainer = null;
    private static HBox      activePopupBox  = null;
    private static PauseTransition activePause = null;

    public static void show(StackPane rootPane, String message, boolean isSuccess) {
        // Parse the title and subtitle from the message if a newline is present
        String titleText = message;
        String subtitleText = "";
        if (message.contains("\n")) {
            int idx = message.indexOf("\n");
            titleText = message.substring(0, idx).trim();
            subtitleText = message.substring(idx + 1).trim();
        }

        // ── If a popup is already on-screen, update it in place ──
        if (activeContainer != null && rootPane.getChildren().contains(activeContainer)) {
            if (activePause != null) {
                activePause.stop();
            }

            // Update styling of the existing popup box
            applyBoxStyle(activePopupBox, isSuccess);

            // Find and update the icon, title, and subtitle
            if (activePopupBox.getChildren().size() >= 2) {
                // Update Icon Container
                if (activePopupBox.getChildren().get(0) instanceof StackPane iconContainer) {
                    applyIconStyle(iconContainer, isSuccess);
                }
                
                // Update Texts
                if (activePopupBox.getChildren().get(1) instanceof VBox textContainer) {
                    if (textContainer.getChildren().size() >= 2) {
                        Label titleLabel = (Label) textContainer.getChildren().get(0);
                        Label subtitleLabel = (Label) textContainer.getChildren().get(1);
                        
                        titleLabel.setText(titleText);
                        subtitleLabel.setText(subtitleText);
                        subtitleLabel.setVisible(!subtitleText.isEmpty());
                        subtitleLabel.setManaged(!subtitleText.isEmpty());
                    }
                }
            }

            // Restore visibility
            activeContainer.setOpacity(1.0);
            activePopupBox.setTranslateX(0);

            scheduleDismiss(rootPane, activeContainer, activePopupBox);
            return;
        }

        // ── Otherwise, build a fresh popup layout ──

        // 1. Icon component (Left side)
        StackPane iconContainer = new StackPane();
        iconContainer.setPrefSize(32, 32);
        iconContainer.setMaxSize(32, 32);
        applyIconStyle(iconContainer, isSuccess);

        // 2. Text layout component (Right side)
        VBox textContainer = new VBox(2);
        textContainer.setAlignment(Pos.CENTER_LEFT);

        Label titleLabel = new Label(titleText);
        titleLabel.setStyle(
            "-fx-text-fill: white;" +
            "-fx-font-family: 'Segoe UI', -apple-system, sans-serif;" +
            "-fx-font-size: 13px;" +
            "-fx-font-weight: 700;" +
            "-fx-letter-spacing: 0.5px;"
        );
        titleLabel.setWrapText(true);

        Label subtitleLabel = new Label(subtitleText);
        subtitleLabel.setStyle(
            "-fx-text-fill: rgba(255, 255, 255, 0.65);" +
            "-fx-font-family: 'Segoe UI', -apple-system, sans-serif;" +
            "-fx-font-size: 11.5px;" +
            "-fx-font-weight: 500;"
        );
        subtitleLabel.setWrapText(true);
        subtitleLabel.setVisible(!subtitleText.isEmpty());
        subtitleLabel.setManaged(!subtitleText.isEmpty());

        textContainer.getChildren().addAll(titleLabel, subtitleLabel);

        // 3. Horizontal layout (HBox)
        HBox popupBox = new HBox(12);
        popupBox.setAlignment(Pos.CENTER_LEFT);
        popupBox.setPrefWidth(320);
        popupBox.setMaxWidth(320);
        popupBox.setMinHeight(HBox.USE_PREF_SIZE);
        popupBox.setMaxHeight(HBox.USE_PREF_SIZE);
        popupBox.setPadding(new Insets(12, 16, 12, 16));
        applyBoxStyle(popupBox, isSuccess);

        popupBox.getChildren().addAll(iconContainer, textContainer);

        // 4. Position and margin in Root
        StackPane container = new StackPane(popupBox);
        container.setAlignment(Pos.TOP_LEFT);
        StackPane.setMargin(popupBox, new Insets(20, 0, 0, 20));
        container.setPickOnBounds(false);

        activeContainer = container;
        activePopupBox  = popupBox;

        rootPane.getChildren().add(container);

        // 5. Entrance Animation
        popupBox.setTranslateX(-350);
        container.setOpacity(0);

        FadeTransition fadeIn = new FadeTransition(Duration.millis(150), container);
        fadeIn.setToValue(1.0);

        TranslateTransition slideIn = new TranslateTransition(Duration.millis(180), popupBox);
        slideIn.setToX(0);
        slideIn.setInterpolator(javafx.animation.Interpolator.EASE_OUT);

        fadeIn.play();
        slideIn.play();

        slideIn.setOnFinished(e -> scheduleDismiss(rootPane, container, popupBox));
    }

    private static void applyBoxStyle(HBox box, boolean isSuccess) {
        String borderColor = isSuccess ? "rgba(11, 213, 231, 0.4)" : "rgba(255, 60, 60, 0.4)";
        String bgColor     = isSuccess ? "rgba(10, 25, 45, 0.85)"  : "rgba(35, 10, 15, 0.85)";
        box.setStyle(
            "-fx-background-color: " + bgColor + ";" +
            "-fx-border-color: " + borderColor + ";" +
            "-fx-border-width: 1px;" +
            "-fx-border-radius: 8px;" +
            "-fx-background-radius: 8px;" +
            "-fx-effect: dropshadow(three-pass-box, rgba(0,0,0,0.5), 15, 0, 0, 4);"
        );
    }

    private static void applyIconStyle(StackPane container, boolean isSuccess) {
        container.getChildren().clear();

        javafx.scene.shape.SVGPath symbol = new javafx.scene.shape.SVGPath();
        if (isSuccess) {
            symbol.setContent("M 9,15.5 L 13.5,19.5 L 22.5,10");
            symbol.setStyle(
                "-fx-stroke: #0bd5e7;" +
                "-fx-stroke-width: 2.2px;" +
                "-fx-stroke-line-cap: round;" +
                "-fx-stroke-line-join: round;" +
                "-fx-fill: transparent;" +
                "-fx-effect: dropshadow(three-pass-box, rgba(11,213,231,0.6), 8, 0, 0, 0);"
            );
        } else {
            // Precision warning sign with centered exclamation mark
            symbol.setContent(
                "M 16,6.5 L 26.5,23.5 L 5.5,23.5 Z " + // Outer triangle
                "M 16,11.5 L 16,17.5 " +               // Warning line
                "M 16,20.5 L 16,21.5"                  // Warning dot
            );
            symbol.setStyle(
                "-fx-stroke: #ff3c3c;" +
                "-fx-stroke-width: 1.6px;" +
                "-fx-stroke-line-cap: round;" +
                "-fx-stroke-line-join: round;" +
                "-fx-fill: rgba(255, 60, 60, 0.1);" +
                "-fx-effect: dropshadow(three-pass-box, rgba(255,60,60,0.6), 8, 0, 0, 0);"
            );
        }

        container.getChildren().add(symbol);
    }

    private static void scheduleDismiss(StackPane rootPane, StackPane container, HBox popupBox) {
        if (activePause != null) {
            activePause.stop();
        }

        PauseTransition pause = new PauseTransition(Duration.seconds(3));
        activePause = pause;

        pause.setOnFinished(e -> {
            if (activeContainer != container) return;

            FadeTransition fadeOut = new FadeTransition(Duration.millis(180), container);
            fadeOut.setToValue(0);

            TranslateTransition slideOut = new TranslateTransition(Duration.millis(180), popupBox);
            slideOut.setToX(-350);
            slideOut.setInterpolator(javafx.animation.Interpolator.EASE_IN);

            fadeOut.setOnFinished(ev -> {
                rootPane.getChildren().remove(container);
                activeContainer = null;
                activePopupBox  = null;
                activePause     = null;
            });

            fadeOut.play();
            slideOut.play();
        });

        pause.play();
    }
}
