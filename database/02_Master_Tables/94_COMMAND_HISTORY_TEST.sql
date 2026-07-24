/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Operations
Object        : COMMAND_HISTORY
File          : 94_COMMAND_HISTORY_TEST.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 24-JUL-2026
=========================================================
Description:
Verifies the COMMAND_HISTORY module,
including triggers, indexes, comments,
and automatic audit logging.
=========================================================
*/

---------------------------------------------------------
-- Verify Table Structure
---------------------------------------------------------

DESC COMMAND_HISTORY;

---------------------------------------------------------
-- Display All History Records
---------------------------------------------------------

SELECT *
FROM COMMAND_HISTORY
ORDER BY COMMAND_HISTORY_ID;

---------------------------------------------------------
-- Total History Records
---------------------------------------------------------

SELECT COUNT(*) AS TOTAL_HISTORY
FROM COMMAND_HISTORY;

---------------------------------------------------------
-- Verify Constraints
---------------------------------------------------------

SELECT
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'COMMAND_HISTORY'
ORDER BY CONSTRAINT_NAME;

---------------------------------------------------------
-- Verify Indexes
---------------------------------------------------------

SELECT
    INDEX_NAME
FROM USER_INDEXES
WHERE TABLE_NAME = 'COMMAND_HISTORY'
ORDER BY INDEX_NAME;

---------------------------------------------------------
-- Verify Sequence
---------------------------------------------------------

SELECT *
FROM USER_SEQUENCES
WHERE SEQUENCE_NAME = 'SEQ_COMMAND_HISTORY';

---------------------------------------------------------
-- Verify Triggers
---------------------------------------------------------

SELECT
    TRIGGER_NAME,
    STATUS
FROM USER_TRIGGERS
WHERE TRIGGER_NAME IN
(
    'TRG_COMMAND_HISTORY_BI',
    'TRG_COMMAND_AUDIT_STATUS'
)
ORDER BY TRIGGER_NAME;

---------------------------------------------------------
-- Verify Comments
---------------------------------------------------------

SELECT COMMENTS
FROM USER_TAB_COMMENTS
WHERE TABLE_NAME = 'COMMAND_HISTORY';

SELECT
    COLUMN_NAME,
    COMMENTS
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'COMMAND_HISTORY'
ORDER BY COLUMN_NAME;

---------------------------------------------------------
-- Test Automatic Audit Logging
---------------------------------------------------------

UPDATE COMMAND
SET
    STATUS = 'APPROVED'
WHERE COMMAND_CODE = 'CMD-000001';

COMMIT;

---------------------------------------------------------
-- Verify History Record
---------------------------------------------------------

SELECT
    CH.COMMAND_HISTORY_ID,
    C.COMMAND_CODE,
    OS.STATUS_CODE AS OLD_STATUS,
    NS.STATUS_CODE AS NEW_STATUS,
    CH.CHANGED_AT,
    CH.CHANGED_BY
FROM COMMAND_HISTORY CH
JOIN COMMAND C
    ON CH.COMMAND_ID = C.COMMAND_ID
LEFT JOIN SYSTEM_STATUS OS
    ON CH.OLD_STATUS_ID = OS.STATUS_ID
JOIN SYSTEM_STATUS NS
    ON CH.NEW_STATUS_ID = NS.STATUS_ID
WHERE C.COMMAND_CODE = 'CMD-000001'
ORDER BY CH.CHANGED_AT DESC;

---------------------------------------------------------
-- Test Second Status Change
---------------------------------------------------------

UPDATE COMMAND
SET
    STATUS = 'QUEUED'
WHERE COMMAND_CODE = 'CMD-000001';

COMMIT;

---------------------------------------------------------
-- Verify Complete Audit Trail
---------------------------------------------------------

SELECT
    C.COMMAND_CODE,
    OS.STATUS_CODE AS OLD_STATUS,
    NS.STATUS_CODE AS NEW_STATUS,
    CH.CHANGED_AT
FROM COMMAND_HISTORY CH
JOIN COMMAND C
    ON CH.COMMAND_ID = C.COMMAND_ID
LEFT JOIN SYSTEM_STATUS OS
    ON CH.OLD_STATUS_ID = OS.STATUS_ID
JOIN SYSTEM_STATUS NS
    ON CH.NEW_STATUS_ID = NS.STATUS_ID
WHERE C.COMMAND_CODE = 'CMD-000001'
ORDER BY CH.CHANGED_AT;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT COMMAND_HISTORY module tested successfully.
PROMPT ===========================================