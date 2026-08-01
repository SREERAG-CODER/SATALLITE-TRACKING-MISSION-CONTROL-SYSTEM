/*
=========================================================
Project       : Satellite Mission Control System
Module        : Notification
Object        : NOTIFICATION Sample Data
File          : 108_NOTIFICATION_SAMPLE_DATA.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Sample notifications for testing and backend
development.
=========================================================
*/

---------------------------------------------------------
-- Broadcast Notification
---------------------------------------------------------

INSERT INTO NOTIFICATION
(
    USER_ID,
    TITLE,
    MESSAGE,
    NOTIFICATION_TYPE,
    PRIORITY
)
VALUES
(
    NULL,
    'Scheduled Maintenance',
    'Mission Control System maintenance begins at 23:00 UTC.',
    'SYSTEM',
    'HIGH'
);

---------------------------------------------------------
-- User Notification
---------------------------------------------------------

INSERT INTO NOTIFICATION
(
    USER_ID,
    TITLE,
    MESSAGE,
    NOTIFICATION_TYPE,
    PRIORITY
)
VALUES
(
    1,
    'Command Executed',
    'Solar panel deployment completed successfully.',
    'COMMAND',
    'MEDIUM'
);

---------------------------------------------------------
-- Critical Security Notification
---------------------------------------------------------

INSERT INTO NOTIFICATION
(
    USER_ID,
    TITLE,
    MESSAGE,
    NOTIFICATION_TYPE,
    PRIORITY
)
VALUES
(
    2,
    'Multiple Failed Login Attempts',
    'Your account recorded multiple unsuccessful login attempts.',
    'SECURITY',
    'CRITICAL'
);

---------------------------------------------------------
-- Telemetry Notification
---------------------------------------------------------

INSERT INTO NOTIFICATION
(
    USER_ID,
    TITLE,
    MESSAGE,
    NOTIFICATION_TYPE,
    PRIORITY
)
VALUES
(
    3,
    'Battery Voltage Warning',
    'Satellite battery voltage dropped below the operational threshold.',
    'TELEMETRY',
    'HIGH'
);

---------------------------------------------------------
-- Mission Notification
---------------------------------------------------------

INSERT INTO NOTIFICATION
(
    USER_ID,
    TITLE,
    MESSAGE,
    NOTIFICATION_TYPE,
    PRIORITY
)
VALUES
(
    1,
    'Mission Completed',
    'Mission M-102 completed successfully.',
    'MISSION',
    'LOW'
);

COMMIT;

PROMPT ===========================================
PROMPT Notification sample data inserted successfully.
PROMPT ===========================================