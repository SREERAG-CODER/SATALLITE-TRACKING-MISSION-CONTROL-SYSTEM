/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : APP_USER
File          : 34_APP_USER_COMMENTS.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Adds descriptive comments to the APP_USER table
and its columns for better documentation and
maintainability.
=========================================================
*/

---------------------------------------------------------
-- Table Comment
---------------------------------------------------------

COMMENT ON TABLE APP_USER IS
'Stores all application users who can access the Satellite Mission Control System. Each user belongs to one department and can be assigned one or more application roles.';

---------------------------------------------------------
-- Column Comments
---------------------------------------------------------

COMMENT ON COLUMN APP_USER.USER_ID IS
'Unique identifier for each application user.';

COMMENT ON COLUMN APP_USER.DEPARTMENT_ID IS
'References the department to which the user belongs.';

COMMENT ON COLUMN APP_USER.EMPLOYEE_ID IS
'Unique employee identifier assigned by the organization.';

COMMENT ON COLUMN APP_USER.USERNAME IS
'Unique username used to log in to the application.';

COMMENT ON COLUMN APP_USER.EMAIL IS
'Unique email address of the application user.';

COMMENT ON COLUMN APP_USER.PASSWORD_HASH IS
'Securely hashed password used for user authentication.';

COMMENT ON COLUMN APP_USER.FIRST_NAME IS
'First name of the user.';

COMMENT ON COLUMN APP_USER.LAST_NAME IS
'Last name of the user.';

COMMENT ON COLUMN APP_USER.PHONE_NUMBER IS
'Contact phone number of the user.';

COMMENT ON COLUMN APP_USER.PROFILE_IMAGE_URL IS
'Path or URL of the user profile image.';

COMMENT ON COLUMN APP_USER.LAST_LOGIN IS
'Timestamp of the user''s most recent successful login.';

COMMENT ON COLUMN APP_USER.IS_ACTIVE IS
'Indicates whether the user account is active (Y) or inactive (N).';

COMMENT ON COLUMN APP_USER.CREATED_AT IS
'Timestamp when the user account was created.';

COMMENT ON COLUMN APP_USER.UPDATED_AT IS
'Timestamp of the most recent update made to the user account.';

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT APP_USER comments created successfully.
PROMPT ===========================================

---------------------------------------------------------
-- Verification
---------------------------------------------------------

SELECT COMMENTS
FROM USER_TAB_COMMENTS
WHERE TABLE_NAME = 'APP_USER';

SELECT COLUMN_NAME,
       COMMENTS
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'APP_USER'
ORDER BY COLUMN_NAME;