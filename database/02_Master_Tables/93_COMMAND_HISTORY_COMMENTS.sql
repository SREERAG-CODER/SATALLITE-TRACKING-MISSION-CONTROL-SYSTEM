/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Operations
Object        : COMMAND_HISTORY
File          : 93_COMMAND_HISTORY_COMMENTS.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 24-JUL-2026
=========================================================
Description:
Adds descriptive comments to the
COMMAND_HISTORY table and its columns.
=========================================================
*/

---------------------------------------------------------
-- Table Comment
---------------------------------------------------------

COMMENT ON TABLE COMMAND_HISTORY IS
'Stores the audit trail of command status transitions throughout the command lifecycle.';

---------------------------------------------------------
-- Column Comments
---------------------------------------------------------

COMMENT ON COLUMN COMMAND_HISTORY.COMMAND_HISTORY_ID IS
'Unique identifier for each command history record.';

COMMENT ON COLUMN COMMAND_HISTORY.COMMAND_ID IS
'Reference to the command whose status changed.';

COMMENT ON COLUMN COMMAND_HISTORY.OLD_STATUS_ID IS
'Previous status of the command before the update.';

COMMENT ON COLUMN COMMAND_HISTORY.NEW_STATUS_ID IS
'New status assigned to the command after the update.';

COMMENT ON COLUMN COMMAND_HISTORY.CHANGED_AT IS
'Timestamp when the status transition occurred.';

COMMENT ON COLUMN COMMAND_HISTORY.CHANGED_BY IS
'User responsible for the status transition.';

COMMENT ON COLUMN COMMAND_HISTORY.CHANGE_REASON IS
'Business reason for the status change, if provided.';

COMMENT ON COLUMN COMMAND_HISTORY.REMARKS IS
'Additional notes related to the status transition.';

COMMENT ON COLUMN COMMAND_HISTORY.CREATED_AT IS
'Timestamp when the audit record was created.';

COMMENT ON COLUMN COMMAND_HISTORY.UPDATED_AT IS
'Timestamp of the most recent modification to the audit record.';

COMMENT ON COLUMN COMMAND_HISTORY.UPDATED_BY IS
'Application user who last modified the audit record.';

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT COMMAND_HISTORY comments created successfully.
PROMPT ===========================================

---------------------------------------------------------
-- Verification
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