package com.istms.service;

import javafx.concurrent.Service;
import javafx.concurrent.Task;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;
import java.util.logging.Logger;

public class BootSequenceService extends Service<Void> {

    private static final Logger LOGGER = Logger.getLogger(BootSequenceService.class.getName());

    public enum BootPhase {
        INITIALIZING, CONNECTING, LOADING, VERIFYING, AUTHENTICATING, COMPLETE
    }

    private final StringProperty bootPhase = new SimpleStringProperty(BootPhase.INITIALIZING.name());

    public StringProperty bootPhaseProperty() {
        return bootPhase;
    }

    @Override
    protected Task<Void> createTask() {
        return new Task<Void>() {
            @Override
            protected Void call() throws Exception {
                LOGGER.info("Starting boot sequence...");
                
                updateBootState("Initializing core systems...", BootPhase.INITIALIZING, 0, 5);
                Thread.sleep(600);

                updateBootState("Connecting to ISTRAC ground station link...", BootPhase.CONNECTING, 1, 5);
                Thread.sleep(700);

                updateBootState("Loading satellite catalog...", BootPhase.LOADING, 2, 5);
                Thread.sleep(600);

                updateBootState("Verifying mission database connection...", BootPhase.VERIFYING, 3, 5);
                Thread.sleep(700);

                updateBootState("Restoring authentication session...", BootPhase.AUTHENTICATING, 4, 5);
                Thread.sleep(600);

                updateBootState("All systems nominal.", BootPhase.COMPLETE, 5, 5);
                Thread.sleep(400);

                LOGGER.info("Boot sequence complete.");
                return null;
            }

            private void updateBootState(String message, BootPhase phase, int workDone, int max) {
                updateMessage(message);
                updateProgress(workDone, max);
                javafx.application.Platform.runLater(() -> bootPhase.set(phase.name()));
                LOGGER.info(message);
            }
        };
    }
}
