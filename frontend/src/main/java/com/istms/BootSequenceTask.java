package com.istms;

import javafx.concurrent.Task;

public class BootSequenceTask extends Task<Void> {

    @Override
    protected Void call() throws Exception {
        updateMessage("Initializing core systems...");
        updateProgress(0, 5);
        Thread.sleep(400);

        updateMessage("Connecting to ISTRAC ground station link...");
        updateProgress(1, 5);
        Thread.sleep(500);

        updateMessage("Loading satellite catalog...");
        updateProgress(2, 5);
        Thread.sleep(400);

        updateMessage("Verifying mission database connection...");
        updateProgress(3, 5);
        Thread.sleep(500);

        updateMessage("Restoring authentication session...");
        updateProgress(4, 5);
        Thread.sleep(400);

        updateMessage("All systems nominal.");
        updateProgress(5, 5);
        Thread.sleep(300);

        return null;
    }
}