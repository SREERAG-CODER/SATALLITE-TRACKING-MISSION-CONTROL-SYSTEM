package com.istms.ui.splash;

import com.istms.config.ThemeConstants;
import javafx.animation.AnimationTimer;
import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.paint.Color;
import java.util.Random;

public class ScanlineCanvas extends Canvas {

    private AnimationTimer timer;
    private final Random random = new Random();
    private boolean isAnimating = false;
    private double flickerIntensity = 0.0;
    private double scanlineOffset = 0.0;
    
    private final Color scanlineColor = Color.web(ThemeConstants.ACCENT_COLOR).deriveColor(0, 1, 1, 0.03); // Faint blue

    public ScanlineCanvas(double width, double height) {
        super(width, height);
        setupAnimation();
    }

    public void setFlickerIntensity(double intensity) {
        this.flickerIntensity = intensity;
    }

    private void setupAnimation() {
        timer = new AnimationTimer() {
            @Override
            public void handle(long now) {
                updateAndDraw();
            }
        };
    }

    public void startAnimation() {
        if (!isAnimating) {
            timer.start();
            isAnimating = true;
        }
    }

    public void stopAnimation() {
        if (isAnimating) {
            timer.stop();
            isAnimating = false;
        }
    }

    private void updateAndDraw() {
        GraphicsContext gc = getGraphicsContext2D();
        gc.clearRect(0, 0, getWidth(), getHeight());

        // Draw Scanlines
        scanlineOffset += 0.5;
        if (scanlineOffset > 4) {
            scanlineOffset = 0;
        }

        gc.setStroke(scanlineColor);
        gc.setLineWidth(2);
        for (double y = scanlineOffset; y < getHeight(); y += 4) {
            gc.strokeLine(0, y, getWidth(), y);
        }

        // Apply Flicker Overlay if intensity > 0
        if (flickerIntensity > 0) {
            double randAlpha = random.nextDouble() * flickerIntensity;
            // Draw a subtle dark overlay that flickers
            gc.setFill(Color.rgb(2, 6, 17, randAlpha));
            gc.fillRect(0, 0, getWidth(), getHeight());
            
            // Random horizontal glitch lines
            if (random.nextDouble() < flickerIntensity * 0.5) {
                double glY = random.nextDouble() * getHeight();
                double glH = random.nextDouble() * 10 + 2;
                gc.setFill(Color.web(ThemeConstants.PRIMARY_COLOR).deriveColor(0, 1, 1, 0.1));
                gc.fillRect(0, glY, getWidth(), glH);
            }
        }
    }
}
