/*
=========================================================
Project       : Satellite Mission Control System
Module        : Notification
Object        : NOTIFICATION Indexes
File          : 106_NOTIFICATION_INDEX.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Indexes to improve notification retrieval
performance.
=========================================================
*/

---------------------------------------------------------
-- USER_ID Index
---------------------------------------------------------

CREATE INDEX IDX_NOTIFICATION_USER
ON NOTIFICATION(USER_ID);

---------------------------------------------------------
-- Notification Type Index
---------------------------------------------------------

CREATE INDEX IDX_NOTIFICATION_TYPE
ON NOTIFICATION(NOTIFICATION_TYPE);

---------------------------------------------------------
-- Priority Index
---------------------------------------------------------

CREATE INDEX IDX_NOTIFICATION_PRIORITY
ON NOTIFICATION(PRIORITY);

---------------------------------------------------------
-- Read Status Index
---------------------------------------------------------

CREATE INDEX IDX_NOTIFICATION_READ
ON NOTIFICATION(IS_READ);

---------------------------------------------------------
-- Created Time Index
---------------------------------------------------------

CREATE INDEX IDX_NOTIFICATION_CREATED
ON NOTIFICATION(CREATED_TIME);

---------------------------------------------------------
-- Expiry Time Index
---------------------------------------------------------

CREATE INDEX IDX_NOTIFICATION_EXPIRY
ON NOTIFICATION(EXPIRY_TIME);

---------------------------------------------------------
-- Composite Index
---------------------------------------------------------

CREATE INDEX IDX_NOTIFICATION_USER_INBOX
ON NOTIFICATION
(
    USER_ID,
    IS_READ,
    CREATED_TIME DESC
);

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT NOTIFICATION indexes created successfully.
PROMPT ===========================================