/*
=========================================================
Project       : Satellite Mission Control System
Module        : Security
Object        : USER_SESSION Sample Data
File          : 100_USER_SESSION_SAMPLE_DATA.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Inserts sample USER_SESSION records for testing.
=========================================================
*/

---------------------------------------------------------
-- Sample Session 1
---------------------------------------------------------

INSERT INTO USER_SESSION
(
    USER_ID,
    SESSION_TOKEN,
    LOGIN_TIME,
    LAST_ACTIVITY_TIME,
    CLIENT_IP,
    DEVICE_NAME,
    OPERATING_SYSTEM,
    CLIENT_APPLICATION,
    SESSION_STATUS
)
VALUES
(
    1,
    'JWT_SESSION_TOKEN_001',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    '192.168.1.10',
    'Mission Console 01',
    'Windows 11',
    'Mission Control Desktop',
    'ACTIVE'
);

---------------------------------------------------------
-- Sample Session 2
---------------------------------------------------------

INSERT INTO USER_SESSION
(
    USER_ID,
    SESSION_TOKEN,
    LOGIN_TIME,
    LAST_ACTIVITY_TIME,
    LOGOUT_TIME,
    CLIENT_IP,
    DEVICE_NAME,
    OPERATING_SYSTEM,
    CLIENT_APPLICATION,
    SESSION_STATUS
)
VALUES
(
    2,
    'JWT_SESSION_TOKEN_002',
    CURRENT_TIMESTAMP - INTERVAL '2' HOUR,
    CURRENT_TIMESTAMP - INTERVAL '1' HOUR,
    CURRENT_TIMESTAMP,
    '192.168.1.11',
    'Mission Console 02',
    'Ubuntu 24.04',
    'Mission Control Desktop',
    'LOGGED_OUT'
);

---------------------------------------------------------
-- Sample Session 3
---------------------------------------------------------

INSERT INTO USER_SESSION
(
    USER_ID,
    SESSION_TOKEN,
    LOGIN_TIME,
    LAST_ACTIVITY_TIME,
    CLIENT_IP,
    DEVICE_NAME,
    OPERATING_SYSTEM,
    CLIENT_APPLICATION,
    SESSION_STATUS
)
VALUES
(
    3,
    'JWT_SESSION_TOKEN_003',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    '192.168.1.12',
    'Telemetry Workstation',
    'Windows 11',
    'Mission Control Desktop',
    'ACTIVE'
);

COMMIT;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT USER_SESSION sample data inserted successfully.
PROMPT ===========================================