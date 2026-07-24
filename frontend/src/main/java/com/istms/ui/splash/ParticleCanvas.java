package com.istms.ui.splash;

import com.istms.config.ThemeConstants;
import javafx.animation.AnimationTimer;
import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.paint.Color;

import java.util.Random;

public class ParticleCanvas extends Canvas {

    private static final int PARTICLE_COUNT = 150;
    private final Particle[] particles = new Particle[PARTICLE_COUNT];
    private final Random random = new Random();
    private boolean isAnimating = false;
    private AnimationTimer timer;

    public ParticleCanvas(double width, double height) {
        super(width, height);
        initParticles();
        setupAnimation();
    }

    private void initParticles() {
        for (int i = 0; i < PARTICLE_COUNT; i++) {
            particles[i] = new Particle(
                random.nextDouble() * getWidth(),
                random.nextDouble() * getHeight(),
                random.nextDouble() * 2.5 + 0.5, // size
                random.nextDouble() * 0.8 + 0.1, // speed
                random.nextBoolean() ? Color.web(ThemeConstants.TEXT_PRIMARY) : Color.web(ThemeConstants.PRIMARY_COLOR) // white or orange
            );
        }
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

        for (Particle p : particles) {
            p.y -= p.speed; // drift upwards slowly
            if (p.y < 0) {
                p.y = getHeight();
                p.x = random.nextDouble() * getWidth();
            }

            gc.setFill(p.color.deriveColor(0, 1, 1, p.opacity));
            gc.fillOval(p.x, p.y, p.size, p.size);
            
            // Twinkle effect
            p.opacity += (random.nextDouble() - 0.5) * 0.05;
            if (p.opacity > 0.9) p.opacity = 0.9;
            if (p.opacity < 0.2) p.opacity = 0.2;
        }
    }

    private static class Particle {
        double x, y, size, speed, opacity;
        Color color;

        Particle(double x, double y, double size, double speed, Color color) {
            this.x = x;
            this.y = y;
            this.size = size;
            this.speed = speed;
            this.color = color;
            this.opacity = 0.5;
        }
    }
}
