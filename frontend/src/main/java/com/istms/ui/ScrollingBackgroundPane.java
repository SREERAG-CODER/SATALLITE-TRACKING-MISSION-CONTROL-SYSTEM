package com.istms.ui;

import javafx.animation.AnimationTimer;
import javafx.scene.image.Image;
import javafx.scene.layout.Pane;
import javafx.scene.paint.ImagePattern;
import javafx.scene.shape.Rectangle;

public class ScrollingBackgroundPane extends Pane {

    private final Rectangle backgroundRect;
    private final ImagePattern imagePattern;
    private double offsetX = 0;
    private double offsetY = 0;
    
    private final AnimationTimer timer;

    public ScrollingBackgroundPane(double width, double height) {
        setPrefSize(width, height);
        
        // Load the image pattern
        String imagePath = getClass().getResource("/com/istms/images/stars-bg.png").toExternalForm();
        Image bgImage = new Image(imagePath);
        
        // We use 0,0,width,height relative to the shape for repeating
        imagePattern = new ImagePattern(bgImage, 0, 0, bgImage.getWidth(), bgImage.getHeight(), false);
        
        backgroundRect = new Rectangle(width, height);
        backgroundRect.setFill(imagePattern);
        
        getChildren().add(backgroundRect);
        
        // Handle resizing
        widthProperty().addListener((obs, oldVal, newVal) -> backgroundRect.setWidth(newVal.doubleValue()));
        heightProperty().addListener((obs, oldVal, newVal) -> backgroundRect.setHeight(newVal.doubleValue()));
        
        // Animation loop
        timer = new AnimationTimer() {
            @Override
            public void handle(long now) {
                updateBackground();
            }
        };
    }
    
    private void updateBackground() {
        // Move diagonally like the CSS @keyframes moveStars
        offsetX -= 0.5; // adjust speed
        offsetY -= 0.5;
        
        // Create a new ImagePattern with updated offset (x, y, width, height, proportional)
        ImagePattern updatedPattern = new ImagePattern(imagePattern.getImage(), offsetX, offsetY, imagePattern.getImage().getWidth(), imagePattern.getImage().getHeight(), false);
        backgroundRect.setFill(updatedPattern);
    }
    
    public void startAnimation() {
        timer.start();
    }
    
    public void stopAnimation() {
        timer.stop();
    }
}
