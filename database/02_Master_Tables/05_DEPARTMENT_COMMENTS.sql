/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : DEPARTMENT
File          : 05_DEPARTMENT_COMMENTS.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Adds descriptive comments to the DEPARTMENT table
and its columns for better documentation and
maintainability.
=========================================================
*/

---------------------------------------------------------
-- Table Comment
---------------------------------------------------------

COMMENT ON TABLE DEPARTMENT IS
'Stores all departments participating in the Satellite Mission Control System. Every user belongs to one department.';

---------------------------------------------------------
-- Column Comments
---------------------------------------------------------

COMMENT ON COLUMN DEPARTMENT.DEPARTMENT_ID IS
'Unique identifier for each department.';

COMMENT ON COLUMN DEPARTMENT.DEPARTMENT_CODE IS
'Short unique code representing the department.';

COMMENT ON COLUMN DEPARTMENT.DEPARTMENT_NAME IS
'Official name of the department.';

COMMENT ON COLUMN DEPARTMENT.DESCRIPTION IS
'Detailed description of the department and its responsibilities.';

COMMENT ON COLUMN DEPARTMENT.IS_ACTIVE IS
'Indicates whether the department is active (Y) or inactive (N).';

COMMENT ON COLUMN DEPARTMENT.CREATED_AT IS
'Timestamp when the department record was created.';

COMMENT ON COLUMN DEPARTMENT.UPDATED_AT IS
'Timestamp of the most recent update made to the department record.';

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT DEPARTMENT comments created successfully.
PROMPT ===========================================  

---------------------------------------------------------
-- Verification
---------------------------------------------------------

SELECT COMMENTS
FROM USER_TAB_COMMENTS
WHERE TABLE_NAME = 'DEPARTMENT';

SELECT COLUMN_NAME,
       COMMENTS
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'DEPARTMENT'
ORDER BY COLUMN_NAME;