package com.istms.ui;

import javafx.animation.FadeTransition;
import javafx.beans.value.ChangeListener;
import javafx.scene.Cursor;
import javafx.scene.ImageCursor;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonBase;
import javafx.scene.control.Hyperlink;
import javafx.scene.control.TextInputControl;
import javafx.scene.image.Image;
import javafx.stage.Stage;
import javafx.util.Duration;

import java.io.InputStream;

public class SceneManager {

    private static SceneManager instance;
    private Stage primaryStage;
    private Scene currentScene;
    private ImageCursor customCursor;

    private SceneManager() {
        loadCustomCursor();
    }

    public static SceneManager getInstance() {
        if (instance == null) {
            instance = new SceneManager();
        }
        return instance;
    }

    /**
     * Returns the custom ImageCursor so other parts of the app can use it.
     */
    public ImageCursor getCustomCursor() {
        return customCursor;
    }

    private void loadCustomCursor() {
        try {
            InputStream stream = getClass().getResourceAsStream("/com/istms/images/custom_cursor.png");
            if (stream != null) {
                Image cursorImg = new Image(stream);
                // Hotspot positioned at top tip (x=6, y=6)
                this.customCursor = new ImageCursor(cursorImg, 6, 6);
            }
        } catch (Exception e) {
            System.err.println("Could not load custom cursor image: " + e.getMessage());
        }
    }

    public void init(Stage stage) {
        this.primaryStage = stage;
        // Enforce full screen styling for spaceship feel
        this.primaryStage.setFullScreenExitHint("");
        this.primaryStage.setFullScreen(true);
    }

    public void setScene(Parent root) {
        if (currentScene == null) {
            currentScene = new Scene(root, 1920, 1080); // Default resolution
            loadStylesheets(currentScene);
            primaryStage.setScene(currentScene);
        } else {
            currentScene.setRoot(root);
        }

        // Always apply the custom cursor on the scene level
        applyCustomCursor(currentScene);

        // Walk the scene graph and attach cursor handlers to interactive controls
        applyCursorHandlersRecursively(root);

        // Listen for future children changes so dynamically added nodes also get handlers
        listenForNewChildren(root);

        primaryStage.setFullScreen(true);
        if (!primaryStage.isShowing()) {
            primaryStage.show();
        }
    }

    /**
     * Sets the custom ImageCursor as the scene-level default cursor.
     */
    public void applyCustomCursor(Scene scene) {
        if (scene != null && customCursor != null) {
            scene.setCursor(customCursor);
        }
    }

    /**
     * Recursively walks the scene graph and attaches mouse enter/exit handlers
     * to interactive controls (buttons, text inputs, hyperlinks) so:
     *   - Hovering a button/hyperlink → Cursor.HAND
     *   - Hovering a text input → Cursor.TEXT
     *   - Leaving → back to custom ImageCursor
     */
    private void applyCursorHandlersRecursively(Node node) {
        if (node == null) return;

        // Buttons & hyperlinks → HAND on hover, custom on exit
        if (node instanceof ButtonBase || node instanceof Hyperlink) {
            // Clear any CSS -fx-cursor so it doesn't interfere
            node.setCursor(null);

            node.setOnMouseEntered(e -> {
                if (currentScene != null) {
                    currentScene.setCursor(Cursor.HAND);
                }
            });
            node.setOnMouseExited(e -> {
                applyCustomCursor(currentScene);
            });
        }
        // Text inputs → TEXT on hover, custom on exit
        else if (node instanceof TextInputControl) {
            node.setCursor(null);

            node.setOnMouseEntered(e -> {
                if (currentScene != null) {
                    currentScene.setCursor(Cursor.TEXT);
                }
            });
            node.setOnMouseExited(e -> {
                applyCustomCursor(currentScene);
            });
        }

        // Recurse into children
        if (node instanceof Parent parent) {
            for (Node child : parent.getChildrenUnmodifiable()) {
                applyCursorHandlersRecursively(child);
            }
        }
    }

    /**
     * Listens for children being added to a Parent (and its descendants),
     * so dynamically created nodes also get cursor handlers.
     */
    private void listenForNewChildren(Parent parent) {
        parent.getChildrenUnmodifiable().addListener(
            (javafx.collections.ListChangeListener<Node>) change -> {
                while (change.next()) {
                    if (change.wasAdded()) {
                        for (Node added : change.getAddedSubList()) {
                            applyCursorHandlersRecursively(added);
                            if (added instanceof Parent p) {
                                listenForNewChildren(p);
                            }
                        }
                    }
                }
            }
        );
        // Also listen on existing children that are parents
        for (Node child : parent.getChildrenUnmodifiable()) {
            if (child instanceof Parent p) {
                listenForNewChildren(p);
            }
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
