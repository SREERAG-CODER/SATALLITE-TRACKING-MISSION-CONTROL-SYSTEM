/*
=========================================================
Project       : Satellite Mission Control System
Module        : Audit Log
Object        : AUDIT_LOG Test
File          : 126_AUDIT_LOG_TEST.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Tests the Audit Log module.
=========================================================
*/

---------------------------------------------------------
-- Display Current Audit Records
---------------------------------------------------------

PROMPT
PROMPT ===== CURRENT AUDIT LOG =====

SELECT
    AUDIT_ID,
    USER_ID,
    EVENT_TYPE,
    MODULE_NAME,
    ACTION_NAME,
    EVENT_STATUS,
    EVENT_TIME
FROM AUDIT_LOG
ORDER BY AUDIT_ID;

---------------------------------------------------------
-- Test Write Audit
---------------------------------------------------------

BEGIN

    PKG_AUDIT_LOG.WRITE_AUDIT
    (
        1,
        'SYSTEM',
        'DATABASE',
        'PACKAGE_TEST',
        'PKG_AUDIT_LOG',
        NULL,
        'Audit package executed successfully.',
        NULL,
        NULL,
        '127.0.0.1',
        'Development Machine',
        1,
        'REQ-999999',
        'SUCCESS'
    );

END;
/

---------------------------------------------------------
-- Test Function
---------------------------------------------------------

PROMPT
PROMPT ===== TOTAL AUDIT RECORDS =====

SELECT
    PKG_AUDIT_LOG.GET_AUDIT_COUNT AS TOTAL_AUDIT_RECORDS
FROM DUAL;

---------------------------------------------------------
-- Verify Package
---------------------------------------------------------

PROMPT
PROMPT ===== PACKAGE STATUS =====

SELECT
    OBJECT_NAME,
    STATUS
FROM USER_OBJECTS
WHERE OBJECT_NAME='PKG_AUDIT_LOG';

---------------------------------------------------------
-- Verify Triggers
---------------------------------------------------------

PROMPT
PROMPT ===== TRIGGERS =====

SELECT
    TRIGGER_NAME,
    STATUS
FROM USER_TRIGGERS
WHERE TABLE_NAME='AUDIT_LOG';

---------------------------------------------------------
-- Verify Indexes
---------------------------------------------------------

PROMPT
PROMPT ===== INDEXES =====

SELECT
    INDEX_NAME
FROM USER_INDEXES
WHERE TABLE_NAME='AUDIT_LOG';

---------------------------------------------------------
-- Final Verification
---------------------------------------------------------

PROMPT
PROMPT ===== FINAL AUDIT LOG =====

SELECT
    AUDIT_ID,
    EVENT_TYPE,
    MODULE_NAME,
    ACTION_NAME,
    EVENT_STATUS
FROM AUDIT_LOG
ORDER BY AUDIT_ID;

PROMPT ===========================================
PROMPT AUDIT_LOG module tested successfully.
PROMPT ===========================================