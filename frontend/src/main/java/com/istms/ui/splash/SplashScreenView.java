package com.istms.ui.splash;

import com.istms.config.ThemeConstants;
import com.istms.service.BootSequenceService;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.scene.layout.StackPane;
import javafx.util.Duration;

public class SplashScreenView {

    private final StackPane root;
    private final ScanlineCanvas scanlineCanvas;
    private final ParticleCanvas particleCanvas;
    private final HUDFrameOverlay hudFrame;
    private final DiagnosticsPanel diagnosticsPanel;
    private final LogoRevealPane logoReveal;
    
    private final BootSequenceService bootService;
    private final Runnable onComplete;
    
    private boolean animationComplete = false;
    private boolean bootComplete = false;

    public SplashScreenView(double width, double height, Runnable onComplete) {
        this.onComplete = onComplete;
        
        root = new StackPane();
        root.getStyleClass().add("splash-root");
        
        scanlineCanvas = new ScanlineCanvas(width, height);
        particleCanvas = new ParticleCanvas(width, height);
        hudFrame = new HUDFrameOverlay(width, height);
        diagnosticsPanel = new DiagnosticsPanel();
        logoReveal = new LogoRevealPane();
        
        root.getChildren().addAll(scanlineCanvas, particleCanvas, hudFrame, diagnosticsPanel, logoReveal);
        
        bootService = new BootSequenceService();
        diagnosticsPanel.bindToService(bootService.messageProperty(), bootService.bootPhaseProperty());
        
        bootService.setOnSucceeded(e -> {
            bootComplete = true;
            checkCompletion();
        });
    }
    
    public StackPane getRoot() {
        return root;
    }
    
    public void play() {
        scanlineCanvas.startAnimation();
        bootService.start(); // Start background task immediately
        
        Timeline timeline = new Timeline();
        
        // Phase 1: Power Surge
        timeline.getKeyFrames().add(new KeyFrame(ThemeConstants.PHASE_0_BLACKOUT, e -> {
            scanlineCanvas.setFlickerIntensity(0.8);
            particleCanvas.startAnimation();
        }));
        
        // Phase 2: HUD Frame
        Duration p2Time = ThemeConstants.PHASE_0_BLACKOUT.add(ThemeConstants.PHASE_1_SURGE);
        timeline.getKeyFrames().add(new KeyFrame(p2Time, e -> {
            scanlineCanvas.setFlickerIntensity(0.1); // settle down
            hudFrame.animateIn(ThemeConstants.PHASE_2_HUD);
        }));
        
        // Phase 3: Diagnostics
        Duration p3Time = p2Time.add(ThemeConstants.PHASE_2_HUD);
        timeline.getKeyFrames().add(new KeyFrame(p3Time, e -> {
            diagnosticsPanel.setOpacity(1);
        }));
        
        // Phase 4: Logo Reveal
        Duration p4Time = p3Time.add(ThemeConstants.PHASE_3_DIAGNOSTICS);
        timeline.getKeyFrames().add(new KeyFrame(p4Time, e -> {
            diagnosticsPanel.setOpacity(0.3); // Fade diagnostics back
            logoReveal.animateReveal(ThemeConstants.PHASE_4_LOGO);
        }));
        
        // Phase 5: Systems Nominal
        Duration p5Time = p4Time.add(ThemeConstants.PHASE_4_LOGO);
        timeline.getKeyFrames().add(new KeyFrame(p5Time, e -> {
            hudFrame.setNominalState();
            diagnosticsPanel.setNominalState();
            diagnosticsPanel.setOpacity(1);
            diagnosticsPanel.addDiagnosticLine("ALL SYSTEMS NOMINAL");
        }));
        
        // Phase 6: Transition
        Duration p6Time = p5Time.add(ThemeConstants.PHASE_5_NOMINAL);
        timeline.getKeyFrames().add(new KeyFrame(p6Time, e -> {
            animationComplete = true;
            checkCompletion();
        }));
        
        timeline.play();
    }
    
    private void checkCompletion() {
        if (animationComplete && bootComplete) {
            // Stop rendering loops
            scanlineCanvas.stopAnimation();
            particleCanvas.stopAnimation();
            
            // Wait for phase 6 duration, then call callback
            Timeline finishTimeline = new Timeline(new KeyFrame(ThemeConstants.PHASE_6_TRANSITION, e -> {
                if (onComplete != null) onComplete.run();
            }));
            finishTimeline.play();
        }
    }
}
