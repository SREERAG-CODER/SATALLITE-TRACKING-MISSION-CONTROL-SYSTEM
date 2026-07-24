package com.istms.config;

import javafx.util.Duration;

public class ThemeConstants {
    // ISRO / Deep Space Theme Colors
    public static final String PRIMARY_COLOR = "#FF9933"; // ISRO Saffron
    public static final String ACCENT_COLOR = "#4DA6FF"; // Space Blue Highlight
    public static final String BACKGROUND_COLOR = "#020611"; // Deep Space Navy
    public static final String SURFACE_COLOR = "#001530"; // ISRO Dark Blue
    public static final String TEXT_PRIMARY = "#FFFFFF";
    public static final String TEXT_TERMINAL = "#FFB366"; // Amber/Saffron tint for terminal
    public static final String SUCCESS_COLOR = "#39ff88"; // Nominal Green
    public static final String DANGER_COLOR = "#ff3d5a"; // Alert Red

    // Animation Durations (Matches 7-phase sequence)
    public static final Duration PHASE_0_BLACKOUT = Duration.seconds(0.5);
    public static final Duration PHASE_1_SURGE = Duration.seconds(1.3); // 0.5 to 1.8
    public static final Duration PHASE_2_HUD = Duration.seconds(1.4); // 1.8 to 3.2
    public static final Duration PHASE_3_DIAGNOSTICS = Duration.seconds(2.3); // 3.2 to 5.5
    public static final Duration PHASE_4_LOGO = Duration.seconds(1.3); // 5.5 to 6.8
    public static final Duration PHASE_5_NOMINAL = Duration.seconds(0.7); // 6.8 to 7.5
    public static final Duration PHASE_6_TRANSITION = Duration.seconds(0.7); // 7.5 to 8.2
}
