/*
=========================================================
Project       : Satellite Mission Control System
Module        : Audit Log
Object        : AUDIT_LOG Indexes
File          : 122_AUDIT_LOG_INDEX.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Indexes to improve audit log search performance.
=========================================================
*/

---------------------------------------------------------
-- User Index
---------------------------------------------------------

CREATE INDEX IDX_AUDIT_LOG_USER
ON AUDIT_LOG(USER_ID);

---------------------------------------------------------
-- Session Index
---------------------------------------------------------

CREATE INDEX IDX_AUDIT_LOG_SESSION
ON AUDIT_LOG(SESSION_ID);

---------------------------------------------------------
-- Event Time Index
---------------------------------------------------------

CREATE INDEX IDX_AUDIT_LOG_EVENT_TIME
ON AUDIT_LOG(EVENT_TIME);

---------------------------------------------------------
-- Event Type Index
---------------------------------------------------------

CREATE INDEX IDX_AUDIT_LOG_EVENT_TYPE
ON AUDIT_LOG(EVENT_TYPE);

---------------------------------------------------------
-- Module Index
---------------------------------------------------------

CREATE INDEX IDX_AUDIT_LOG_MODULE
ON AUDIT_LOG(MODULE_NAME);

---------------------------------------------------------
-- Status Index
---------------------------------------------------------

CREATE INDEX IDX_AUDIT_LOG_STATUS
ON AUDIT_LOG(EVENT_STATUS);

---------------------------------------------------------
-- Composite Index
---------------------------------------------------------

CREATE INDEX IDX_AUDIT_LOG_USER_TIME
ON AUDIT_LOG
(
    USER_ID,
    EVENT_TIME DESC
);

PROMPT ===========================================
PROMPT AUDIT_LOG indexes created successfully.
PROMPT ===========================================