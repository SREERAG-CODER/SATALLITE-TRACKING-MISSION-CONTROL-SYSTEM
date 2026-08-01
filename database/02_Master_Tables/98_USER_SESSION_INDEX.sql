/*
=========================================================
Project       : Satellite Mission Control System
Module        : Security
Object        : USER_SESSION Indexes
File          : 98_USER_SESSION_INDEX.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Indexes to improve USER_SESSION query performance.
=========================================================
*/

---------------------------------------------------------
-- USER_ID Index
---------------------------------------------------------

CREATE INDEX IDX_USER_SESSION_USER
ON USER_SESSION (USER_ID);

---------------------------------------------------------
-- Session Status Index
---------------------------------------------------------

CREATE INDEX IDX_USER_SESSION_STATUS
ON USER_SESSION (SESSION_STATUS);

---------------------------------------------------------
-- Login Time Index
---------------------------------------------------------

CREATE INDEX IDX_USER_SESSION_LOGIN_TIME
ON USER_SESSION (LOGIN_TIME);

---------------------------------------------------------
-- Last Activity Index
---------------------------------------------------------

CREATE INDEX IDX_USER_SESSION_ACTIVITY
ON USER_SESSION (LAST_ACTIVITY_TIME);

---------------------------------------------------------
-- Session Token Index
---------------------------------------------------------

CREATE UNIQUE INDEX IDX_USER_SESSION_TOKEN
ON USER_SESSION (SESSION_TOKEN);

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT USER_SESSION indexes created successfully.
PROMPT ===========================================