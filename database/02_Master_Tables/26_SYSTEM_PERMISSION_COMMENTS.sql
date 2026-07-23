/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : SYSTEM_PERMISSION
File          : 26_SYSTEM_PERMISSION_COMMENTS.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Adds descriptive comments to the SYSTEM_PERMISSION
table and its columns for better documentation
and maintainability.
=========================================================
*/

---------------------------------------------------------
-- Table Comment
---------------------------------------------------------

COMMENT ON TABLE SYSTEM_PERMISSION IS
'Stores all permissions associated with application modules. Permissions are assigned to application roles through the ROLE_PERMISSION table.';

---------------------------------------------------------
-- Column Comments
---------------------------------------------------------

COMMENT ON COLUMN SYSTEM_PERMISSION.PERMISSION_ID IS
'Unique identifier for each permission.';

COMMENT ON COLUMN SYSTEM_PERMISSION.MODULE_ID IS
'References the system module to which the permission belongs.';

COMMENT ON COLUMN SYSTEM_PERMISSION.PERMISSION_CATEGORY IS
'Categorizes the permission, such as CRUD, COMMAND, APPROVAL, REPORTING, ANALYTICS, CONFIGURATION, or SECURITY.';

COMMENT ON COLUMN SYSTEM_PERMISSION.PERMISSION_CODE IS
'Short unique code representing the permission.';

COMMENT ON COLUMN SYSTEM_PERMISSION.PERMISSION_NAME IS
'Display name of the permission.';

COMMENT ON COLUMN SYSTEM_PERMISSION.PERMISSION_DESCRIPTION IS
'Detailed description of the permission and its purpose.';

COMMENT ON COLUMN SYSTEM_PERMISSION.IS_ACTIVE IS
'Indicates whether the permission is active (Y) or inactive (N).';

COMMENT ON COLUMN SYSTEM_PERMISSION.CREATED_AT IS
'Timestamp when the permission record was created.';

COMMENT ON COLUMN SYSTEM_PERMISSION.UPDATED_AT IS
'Timestamp of the most recent update made to the permission record.';

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT SYSTEM_PERMISSION comments created successfully.
PROMPT ===========================================

---------------------------------------------------------
-- Verification
---------------------------------------------------------

SELECT COMMENTS
FROM USER_TAB_COMMENTS
WHERE TABLE_NAME = 'SYSTEM_PERMISSION';

SELECT COLUMN_NAME,
       COMMENTS
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'SYSTEM_PERMISSION'
ORDER BY COLUMN_NAME;