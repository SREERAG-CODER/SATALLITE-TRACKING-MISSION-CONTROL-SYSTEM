package com.istms.ui.splash;

import javafx.geometry.Pos;
import javafx.scene.control.Label;
import javafx.scene.layout.VBox;
import javafx.scene.layout.StackPane;
import javafx.scene.effect.DropShadow;
import javafx.scene.effect.Bloom;
import javafx.scene.paint.Color;
import com.istms.config.ThemeConstants;
import javafx.animation.ScaleTransition;
import javafx.animation.FadeTransition;
import javafx.animation.ParallelTransition;
import javafx.util.Duration;

public class LogoRevealPane extends StackPane {

    private final Label title;
    private final Label subtitle;
    
    public LogoRevealPane() {
        setAlignment(Pos.CENTER);
        
        VBox container = new VBox(15);
        container.setAlignment(Pos.CENTER);
        
        title = new Label("ISTMS");
        title.getStyleClass().add("logo-title");
        
        DropShadow glow = new DropShadow(30, Color.web(ThemeConstants.PRIMARY_COLOR));
        Bloom bloom = new Bloom(0.3);
        glow.setInput(bloom);
        title.setEffect(glow);
        
        subtitle = new Label("SATELLITE TRACKING & MISSION CONTROL");
        subtitle.getStyleClass().add("logo-subtitle");
        
        container.getChildren().addAll(title, subtitle);
        getChildren().add(container);
        
        setOpacity(0);
        title.setScaleX(0.5);
        title.setScaleY(0.5);
        subtitle.setOpacity(0);
    }
    
    public void animateReveal(Duration duration) {
        setOpacity(1);
        
        ScaleTransition scale = new ScaleTransition(duration, title);
        scale.setToX(1.0);
        scale.setToY(1.0);
        scale.setInterpolator(javafx.animation.Interpolator.EASE_OUT);
        
        FadeTransition fadeTitle = new FadeTransition(duration.divide(2), title);
        fadeTitle.setFromValue(0);
        fadeTitle.setToValue(1);
        
        FadeTransition fadeSub = new FadeTransition(duration.divide(2), subtitle);
        fadeSub.setFromValue(0);
        fadeSub.setToValue(1);
        fadeSub.setDelay(duration.divide(2));
        
        ParallelTransition pt = new ParallelTransition(scale, fadeTitle, fadeSub);
        pt.play();
    }
}
