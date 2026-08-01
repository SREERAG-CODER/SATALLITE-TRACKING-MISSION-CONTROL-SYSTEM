/*
=========================================================
Project       : Satellite Mission Control System
Module        : Security
Object        : USER_SESSION Test
File          : 102_USER_SESSION_TEST.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Tests USER_SESSION module.
=========================================================
*/

---------------------------------------------------------
-- Display All Sessions
---------------------------------------------------------

PROMPT
PROMPT ===== CURRENT USER SESSIONS =====

SELECT
    SESSION_ID,
    USER_ID,
    SESSION_STATUS,
    LOGIN_TIME,
    LAST_ACTIVITY_TIME,
    LOGOUT_TIME
FROM USER_SESSION;

---------------------------------------------------------
-- Test Activity Update
---------------------------------------------------------

BEGIN
    PKG_USER_SESSION.UPDATE_ACTIVITY(1);
END;
/

---------------------------------------------------------
-- Test Logout
---------------------------------------------------------

BEGIN
    PKG_USER_SESSION.LOGOUT_SESSION(2);
END;
/

---------------------------------------------------------
-- Verify Results
---------------------------------------------------------

PROMPT
PROMPT ===== VERIFY UPDATED RECORDS =====

SELECT
    SESSION_ID,
    SESSION_STATUS,
    LOGIN_TIME,
    LAST_ACTIVITY_TIME,
    LOGOUT_TIME
FROM USER_SESSION
ORDER BY SESSION_ID;

---------------------------------------------------------
-- Verify Objects
---------------------------------------------------------

PROMPT
PROMPT ===== VERIFY PACKAGE =====

SELECT OBJECT_NAME,
       STATUS
FROM USER_OBJECTS
WHERE OBJECT_NAME='PKG_USER_SESSION';

PROMPT
PROMPT ===== VERIFY TRIGGERS =====

SELECT TRIGGER_NAME,
       STATUS
FROM USER_TRIGGERS
WHERE TABLE_NAME='USER_SESSION';

PROMPT
PROMPT ===== VERIFY INDEXES =====

SELECT INDEX_NAME
FROM USER_INDEXES
WHERE TABLE_NAME='USER_SESSION';

PROMPT
PROMPT ===========================================
PROMPT USER_SESSION module tested successfully.
PROMPT ===========================================