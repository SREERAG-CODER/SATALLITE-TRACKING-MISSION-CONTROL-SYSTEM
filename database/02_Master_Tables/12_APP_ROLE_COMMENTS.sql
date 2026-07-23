/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : APP_ROLE
File          : 12_APP_ROLE_COMMENTS.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Adds descriptive comments to the APP_ROLE table
and its columns for better documentation and
maintainability.
=========================================================
*/

---------------------------------------------------------
-- Table Comment
---------------------------------------------------------

COMMENT ON TABLE APP_ROLE IS
'Stores all application roles used for Role-Based Access Control (RBAC). Each role belongs to a department and defines the responsibilities assigned to users.';

---------------------------------------------------------
-- Column Comments
---------------------------------------------------------

COMMENT ON COLUMN APP_ROLE.APP_ROLE_ID IS
'Unique identifier for each application role.';

COMMENT ON COLUMN APP_ROLE.DEPARTMENT_ID IS
'References the department to which this role belongs.';

COMMENT ON COLUMN APP_ROLE.APP_ROLE_CODE IS
'Short unique code representing the application role.';

COMMENT ON COLUMN APP_ROLE.APP_ROLE_NAME IS
'Display name of the application role.';

COMMENT ON COLUMN APP_ROLE.APP_ROLE_DESCRIPTION IS
'Detailed description of the application role and its responsibilities.';

COMMENT ON COLUMN APP_ROLE.IS_ACTIVE IS
'Indicates whether the application role is active (Y) or inactive (N).';

COMMENT ON COLUMN APP_ROLE.CREATED_AT IS
'Timestamp when the application role was created.';

COMMENT ON COLUMN APP_ROLE.UPDATED_AT IS
'Timestamp of the most recent update made to the application role.';

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT APP_ROLE comments created successfully.
PROMPT ===========================================

---------------------------------------------------------
-- Verification
---------------------------------------------------------

SELECT COMMENTS
FROM USER_TAB_COMMENTS
WHERE TABLE_NAME = 'APP_ROLE';

SELECT COLUMN_NAME,
       COMMENTS
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'APP_ROLE'
ORDER BY COLUMN_NAME;