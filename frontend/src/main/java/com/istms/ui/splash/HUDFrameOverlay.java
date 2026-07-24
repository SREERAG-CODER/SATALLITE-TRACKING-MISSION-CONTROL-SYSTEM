package com.istms.ui.splash;

import com.istms.config.ThemeConstants;
import javafx.animation.StrokeTransition;
import javafx.scene.effect.DropShadow;
import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import javafx.scene.shape.LineTo;
import javafx.scene.shape.MoveTo;
import javafx.scene.shape.Path;
import javafx.scene.shape.Polyline;
import javafx.util.Duration;

public class HUDFrameOverlay extends Pane {

    public HUDFrameOverlay(double width, double height) {
        setPrefSize(width, height);
        
        // Draw the corner brackets and border lines
        Color hudColor = Color.web(ThemeConstants.ACCENT_COLOR);
        DropShadow glow = new DropShadow(15, hudColor);
        
        double edgeOffset = 50;
        double bracketLen = 80;
        
        // Top Left
        Path tl = createBracket(edgeOffset, edgeOffset + bracketLen, edgeOffset, edgeOffset, edgeOffset + bracketLen, edgeOffset, hudColor, glow);
        // Top Right
        Path tr = createBracket(width - edgeOffset - bracketLen, edgeOffset, width - edgeOffset, edgeOffset, width - edgeOffset, edgeOffset + bracketLen, hudColor, glow);
        // Bottom Left
        Path bl = createBracket(edgeOffset, height - edgeOffset - bracketLen, edgeOffset, height - edgeOffset, edgeOffset + bracketLen, height - edgeOffset, hudColor, glow);
        // Bottom Right
        Path br = createBracket(width - edgeOffset, height - edgeOffset - bracketLen, width - edgeOffset, height - edgeOffset, width - edgeOffset - bracketLen, height - edgeOffset, hudColor, glow);

        // Add to pane
        getChildren().addAll(tl, tr, bl, br);
        
        // Add subtle grid or targeting lines in the center (optional)
        Polyline centerCrosshair = new Polyline(
            width/2, height/2 - 20,
            width/2, height/2 + 20
        );
        centerCrosshair.setStroke(hudColor.deriveColor(0,1,1,0.3));
        
        Polyline centerCrosshairH = new Polyline(
            width/2 - 20, height/2,
            width/2 + 20, height/2
        );
        centerCrosshairH.setStroke(hudColor.deriveColor(0,1,1,0.3));
        
        getChildren().addAll(centerCrosshair, centerCrosshairH);
    }

    private Path createBracket(double startX, double startY, double cornerX, double cornerY, double endX, double endY, Color color, DropShadow effect) {
        Path path = new Path();
        path.getElements().add(new MoveTo(startX, startY));
        path.getElements().add(new LineTo(cornerX, cornerY));
        path.getElements().add(new LineTo(endX, endY));
        
        path.setStroke(color);
        path.setStrokeWidth(2);
        path.setFill(Color.TRANSPARENT);
        path.setEffect(effect);
        
        // Setup for animation
        path.getStrokeDashArray().addAll(300.0, 300.0);
        path.setStrokeDashOffset(300.0);
        
        return path;
    }

    public void animateIn(Duration duration) {
        for (javafx.scene.Node node : getChildren()) {
            if (node instanceof Path) {
                Path path = (Path) node;
                javafx.animation.Timeline timeline = new javafx.animation.Timeline(
                    new javafx.animation.KeyFrame(Duration.ZERO, new javafx.animation.KeyValue(path.strokeDashOffsetProperty(), 300.0)),
                    new javafx.animation.KeyFrame(duration, new javafx.animation.KeyValue(path.strokeDashOffsetProperty(), 0.0))
                );
                timeline.play();
            }
        }
    }
    
    public void setNominalState() {
        Color nominalColor = Color.web(ThemeConstants.SUCCESS_COLOR);
        DropShadow nominalGlow = new DropShadow(20, nominalColor);
        for (javafx.scene.Node node : getChildren()) {
            if (node instanceof Path || node instanceof Polyline) {
                ((javafx.scene.shape.Shape)node).setStroke(nominalColor);
                node.setEffect(nominalGlow);
            }
        }
    }
}
