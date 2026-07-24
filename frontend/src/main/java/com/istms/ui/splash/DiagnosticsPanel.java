package com.istms.ui.splash;

import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.application.Platform;
import javafx.beans.property.ReadOnlyStringProperty;
import javafx.beans.property.StringProperty;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.Label;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.util.Duration;

import java.util.ArrayList;
import java.util.List;

public class DiagnosticsPanel extends VBox {

    private final VBox textContainer;
    private final HBox progressBar;
    private final List<javafx.scene.shape.Rectangle> segments = new ArrayList<>();
    
    public DiagnosticsPanel() {
        setAlignment(Pos.CENTER_LEFT);
        setPadding(new Insets(40));
        setSpacing(20);
        setMaxWidth(800);
        
        textContainer = new VBox(5);
        textContainer.setAlignment(Pos.TOP_LEFT);
        
        progressBar = new HBox(5);
        progressBar.setAlignment(Pos.CENTER_LEFT);
        
        for (int i = 0; i < 5; i++) {
            javafx.scene.shape.Rectangle segment = new javafx.scene.shape.Rectangle(40, 8);
            segment.getStyleClass().add("diag-progress-segment");
            segments.add(segment);
            progressBar.getChildren().add(segment);
        }
        
        getChildren().addAll(textContainer, progressBar);
        setOpacity(0);
    }
    
    public void addDiagnosticLine(String text) {
        Platform.runLater(() -> {
            Label label = new Label("> " + text);
            label.getStyleClass().add("diag-text");
            textContainer.getChildren().add(label);
            
            // Auto scroll / keep only last 8 lines
            if (textContainer.getChildren().size() > 8) {
                textContainer.getChildren().remove(0);
            }
        });
    }

    public void bindToService(ReadOnlyStringProperty messageProperty, StringProperty phaseProperty) {
        messageProperty.addListener((obs, old, newVal) -> {
            if (newVal != null && !newVal.isEmpty()) {
                addDiagnosticLine(newVal);
            }
        });
        
        phaseProperty.addListener((obs, old, newVal) -> {
            if (newVal == null) return;
            Platform.runLater(() -> {
                int activeSegments = 0;
                switch (newVal) {
                    case "INITIALIZING": activeSegments = 1; break;
                    case "CONNECTING": activeSegments = 2; break;
                    case "LOADING": activeSegments = 3; break;
                    case "VERIFYING": activeSegments = 4; break;
                    case "AUTHENTICATING":
                    case "COMPLETE": activeSegments = 5; break;
                }
                
                for (int i = 0; i < segments.size(); i++) {
                    if (i < activeSegments) {
                        segments.get(i).getStyleClass().add("active");
                    }
                }
            });
        });
    }
    
    public void setNominalState() {
        for (javafx.scene.shape.Rectangle segment : segments) {
            segment.getStyleClass().remove("active");
            segment.getStyleClass().add("nominal");
        }
    }
}
