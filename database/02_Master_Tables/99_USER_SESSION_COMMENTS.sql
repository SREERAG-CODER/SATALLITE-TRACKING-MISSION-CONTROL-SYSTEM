/*
=========================================================
Project       : Satellite Mission Control System
Module        : Security
Object        : USER_SESSION Comments
File          : 99_USER_SESSION_COMMENTS.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Adds documentation comments to the USER_SESSION
table and its columns.
=========================================================
*/

---------------------------------------------------------
-- Table Comment
---------------------------------------------------------

COMMENT ON TABLE USER_SESSION IS
'Stores user login sessions for authentication, auditing and activity tracking.';

---------------------------------------------------------
-- Column Comments
---------------------------------------------------------

COMMENT ON COLUMN USER_SESSION.SESSION_ID IS
'Unique identifier for the user session.';

COMMENT ON COLUMN USER_SESSION.USER_ID IS
'Reference to the authenticated user.';

COMMENT ON COLUMN USER_SESSION.SESSION_TOKEN IS
'Unique authentication token associated with the session.';

COMMENT ON COLUMN USER_SESSION.LOGIN_TIME IS
'Timestamp when the user logged in.';

COMMENT ON COLUMN USER_SESSION.LAST_ACTIVITY_TIME IS
'Timestamp of the most recent user activity.';

COMMENT ON COLUMN USER_SESSION.LOGOUT_TIME IS
'Timestamp when the session ended.';

COMMENT ON COLUMN USER_SESSION.CLIENT_IP IS
'IP address of the client device.';

COMMENT ON COLUMN USER_SESSION.DEVICE_NAME IS
'Name of the client device.';

COMMENT ON COLUMN USER_SESSION.OPERATING_SYSTEM IS
'Operating system of the client device.';

COMMENT ON COLUMN USER_SESSION.CLIENT_APPLICATION IS
'Application used to establish the session.';

COMMENT ON COLUMN USER_SESSION.SESSION_STATUS IS
'Current status of the session.';

COMMENT ON COLUMN USER_SESSION.CREATED_AT IS
'Record creation timestamp.';

COMMENT ON COLUMN USER_SESSION.UPDATED_AT IS
'Record last modification timestamp.';

COMMENT ON COLUMN USER_SESSION.UPDATED_BY IS
'User responsible for the latest modification.';

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT USER_SESSION comments added successfully.
PROMPT ===========================================