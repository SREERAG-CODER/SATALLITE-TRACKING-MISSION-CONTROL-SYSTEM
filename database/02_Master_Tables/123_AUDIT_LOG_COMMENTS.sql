/*
=========================================================
Project       : Satellite Mission Control System
Module        : Audit Log
Object        : AUDIT_LOG Comments
File          : 123_AUDIT_LOG_COMMENTS.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Adds descriptive comments to the AUDIT_LOG table
and its columns.
=========================================================
*/

---------------------------------------------------------
-- Table Comment
---------------------------------------------------------

COMMENT ON TABLE AUDIT_LOG IS
'Stores immutable audit records for user, security, configuration and system events.';

---------------------------------------------------------
-- Column Comments
---------------------------------------------------------

COMMENT ON COLUMN AUDIT_LOG.AUDIT_ID IS
'Unique identifier for the audit record.';

COMMENT ON COLUMN AUDIT_LOG.USER_ID IS
'User responsible for the audited event.';

COMMENT ON COLUMN AUDIT_LOG.EVENT_TYPE IS
'High-level classification of the event.';

COMMENT ON COLUMN AUDIT_LOG.MODULE_NAME IS
'Application module that generated the event.';

COMMENT ON COLUMN AUDIT_LOG.ACTION_NAME IS
'Specific action performed.';

COMMENT ON COLUMN AUDIT_LOG.OBJECT_NAME IS
'Database or application object affected.';

COMMENT ON COLUMN AUDIT_LOG.OBJECT_ID IS
'Identifier of the affected object.';

COMMENT ON COLUMN AUDIT_LOG.EVENT_DESCRIPTION IS
'Detailed description of the event.';

COMMENT ON COLUMN AUDIT_LOG.OLD_VALUE IS
'Previous value before modification.';

COMMENT ON COLUMN AUDIT_LOG.NEW_VALUE IS
'New value after modification.';

COMMENT ON COLUMN AUDIT_LOG.CLIENT_IP IS
'Client IP address.';

COMMENT ON COLUMN AUDIT_LOG.DEVICE_NAME IS
'Client device name.';

COMMENT ON COLUMN AUDIT_LOG.SESSION_ID IS
'Associated application session.';

COMMENT ON COLUMN AUDIT_LOG.CORRELATION_ID IS
'Identifier used to correlate related audit events.';

COMMENT ON COLUMN AUDIT_LOG.EVENT_TIME IS
'Timestamp when the event occurred.';

COMMENT ON COLUMN AUDIT_LOG.EVENT_STATUS IS
'Outcome of the audited operation.';

COMMENT ON COLUMN AUDIT_LOG.CREATED_AT IS
'Record creation timestamp.';

COMMENT ON COLUMN AUDIT_LOG.UPDATED_AT IS
'Last modification timestamp.';

COMMENT ON COLUMN AUDIT_LOG.UPDATED_BY IS
'User responsible for the last modification.';

PROMPT ===========================================
PROMPT AUDIT_LOG comments added successfully.
PROMPT ===========================================