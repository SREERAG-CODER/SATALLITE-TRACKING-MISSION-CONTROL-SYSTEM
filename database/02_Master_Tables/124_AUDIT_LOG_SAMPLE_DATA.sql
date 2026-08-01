/*
=========================================================
Project       : Satellite Mission Control System
Module        : Audit Log
Object        : AUDIT_LOG Sample Data
File          : 124_AUDIT_LOG_SAMPLE_DATA.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Inserts representative audit records.
=========================================================
*/

---------------------------------------------------------
-- Successful Login
---------------------------------------------------------

INSERT INTO AUDIT_LOG
(
    USER_ID,
    EVENT_TYPE,
    MODULE_NAME,
    ACTION_NAME,
    EVENT_DESCRIPTION,
    CLIENT_IP,
    DEVICE_NAME,
    SESSION_ID,
    CORRELATION_ID,
    EVENT_STATUS
)
VALUES
(
    1,
    'AUTHENTICATION',
    'LOGIN',
    'USER_LOGIN',
    'User logged in successfully.',
    '192.168.1.20',
    'Mission Console 01',
    1,
    'REQ-000001',
    'SUCCESS'
);

---------------------------------------------------------
-- Configuration Change
---------------------------------------------------------

INSERT INTO AUDIT_LOG
(
    USER_ID,
    EVENT_TYPE,
    MODULE_NAME,
    ACTION_NAME,
    OBJECT_NAME,
    OBJECT_ID,
    EVENT_DESCRIPTION,
    OLD_VALUE,
    NEW_VALUE,
    CORRELATION_ID,
    EVENT_STATUS
)
VALUES
(
    1,
    'CONFIGURATION',
    'SYSTEM_CONFIGURATION',
    'UPDATE_CONFIGURATION',
    'SYSTEM_CONFIGURATION',
    'SESSION_TIMEOUT',
    'Session timeout updated.',
    '30',
    '45',
    'REQ-000002',
    'SUCCESS'
);

---------------------------------------------------------
-- Command Execution
---------------------------------------------------------

INSERT INTO AUDIT_LOG
(
    USER_ID,
    EVENT_TYPE,
    MODULE_NAME,
    ACTION_NAME,
    EVENT_DESCRIPTION,
    SESSION_ID,
    CORRELATION_ID,
    EVENT_STATUS
)
VALUES
(
    2,
    'COMMAND',
    'COMMAND_CENTER',
    'EXECUTE_COMMAND',
    'Executed satellite orientation command.',
    2,
    'REQ-000003',
    'SUCCESS'
);

---------------------------------------------------------
-- Failed Login
---------------------------------------------------------

INSERT INTO AUDIT_LOG
(
    EVENT_TYPE,
    MODULE_NAME,
    ACTION_NAME,
    EVENT_DESCRIPTION,
    CLIENT_IP,
    CORRELATION_ID,
    EVENT_STATUS
)
VALUES
(
    'SECURITY',
    'LOGIN',
    'FAILED_LOGIN',
    'Invalid credentials supplied.',
    '192.168.1.50',
    'REQ-000004',
    'FAILED'
);

COMMIT;

PROMPT ===========================================
PROMPT AUDIT_LOG sample data inserted successfully.
PROMPT ===========================================