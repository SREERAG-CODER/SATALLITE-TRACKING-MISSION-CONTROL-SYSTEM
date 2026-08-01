/*
=========================================================
Project       : Satellite Mission Control System
Module        : Notification
Object        : NOTIFICATION Test
File          : 110_NOTIFICATION_TEST.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Tests Notification module functionality.
=========================================================
*/

---------------------------------------------------------
-- Display Existing Notifications
---------------------------------------------------------

PROMPT
PROMPT ===== CURRENT NOTIFICATIONS =====

SELECT
    NOTIFICATION_ID,
    USER_ID,
    TITLE,
    PRIORITY,
    IS_READ,
    CREATED_TIME
FROM NOTIFICATION
ORDER BY CREATED_TIME DESC;

---------------------------------------------------------
-- Test Send Notification
---------------------------------------------------------

BEGIN

    PKG_NOTIFICATION.SEND_NOTIFICATION
    (
        1,
        'Database Test',
        'Notification package test executed successfully.',
        'SYSTEM',
        'LOW'
    );

END;
/

---------------------------------------------------------
-- Test Mark As Read
---------------------------------------------------------

BEGIN
    PKG_NOTIFICATION.MARK_AS_READ(1);
END;
/

---------------------------------------------------------
-- Test Mark All As Read
---------------------------------------------------------

BEGIN
    PKG_NOTIFICATION.MARK_ALL_AS_READ(2);
END;
/

---------------------------------------------------------
-- Test Delete Expired Notifications
---------------------------------------------------------

BEGIN
    PKG_NOTIFICATION.DELETE_EXPIRED_NOTIFICATIONS;
END;
/

---------------------------------------------------------
-- Verify Package
---------------------------------------------------------

PROMPT
PROMPT ===== PACKAGE STATUS =====

SELECT
    OBJECT_NAME,
    STATUS
FROM USER_OBJECTS
WHERE OBJECT_NAME='PKG_NOTIFICATION';

---------------------------------------------------------
-- Verify Triggers
---------------------------------------------------------

PROMPT
PROMPT ===== TRIGGERS =====

SELECT
    TRIGGER_NAME,
    STATUS
FROM USER_TRIGGERS
WHERE TABLE_NAME='NOTIFICATION';

---------------------------------------------------------
-- Verify Indexes
---------------------------------------------------------

PROMPT
PROMPT ===== INDEXES =====

SELECT
    INDEX_NAME
FROM USER_INDEXES
WHERE TABLE_NAME='NOTIFICATION';

---------------------------------------------------------
-- Display Final Data
---------------------------------------------------------

PROMPT
PROMPT ===== FINAL NOTIFICATION DATA =====

SELECT
    NOTIFICATION_ID,
    USER_ID,
    TITLE,
    PRIORITY,
    IS_READ,
    READ_TIME
FROM NOTIFICATION
ORDER BY NOTIFICATION_ID;

PROMPT ===========================================
PROMPT Notification module tested successfully.
PROMPT ===========================================