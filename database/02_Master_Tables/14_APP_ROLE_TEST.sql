/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : APP_ROLE
File          : 14_APP_ROLE_TEST.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Verifies the APP_ROLE table, sequence, trigger,
constraints, comments and sample data.
=========================================================
*/

---------------------------------------------------------
-- Verify Table Structure
---------------------------------------------------------

DESC APP_ROLE;

---------------------------------------------------------
-- Display All Roles
---------------------------------------------------------

SELECT *
FROM APP_ROLE
ORDER BY APP_ROLE_ID;

---------------------------------------------------------
-- Total Roles
---------------------------------------------------------

SELECT COUNT(*) AS TOTAL_ROLES
FROM APP_ROLE;

---------------------------------------------------------
-- Active Roles
---------------------------------------------------------

SELECT *
FROM APP_ROLE
WHERE IS_ACTIVE = 'Y';

---------------------------------------------------------
-- Roles with Department Names
---------------------------------------------------------

SELECT
    AR.APP_ROLE_ID,
    D.DEPARTMENT_NAME,
    AR.APP_ROLE_NAME,
    AR.APP_ROLE_CODE,
    AR.IS_ACTIVE
FROM APP_ROLE AR
JOIN DEPARTMENT D
ON AR.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY D.DEPARTMENT_NAME,
         AR.APP_ROLE_NAME;

---------------------------------------------------------
-- Verify Constraints
---------------------------------------------------------

SELECT CONSTRAINT_NAME,
       CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='APP_ROLE'
ORDER BY CONSTRAINT_NAME;

---------------------------------------------------------
-- Verify Sequence
---------------------------------------------------------

SELECT *
FROM USER_SEQUENCES
WHERE SEQUENCE_NAME='SEQ_APP_ROLE';

---------------------------------------------------------
-- Verify Trigger
---------------------------------------------------------

SELECT TRIGGER_NAME,
       STATUS
FROM USER_TRIGGERS
WHERE TABLE_NAME='APP_ROLE';

---------------------------------------------------------
-- Verify Comments
---------------------------------------------------------

SELECT COMMENTS
FROM USER_TAB_COMMENTS
WHERE TABLE_NAME='APP_ROLE';

SELECT COLUMN_NAME,
       COMMENTS
FROM USER_COL_COMMENTS
WHERE TABLE_NAME='APP_ROLE'
ORDER BY COLUMN_NAME;

---------------------------------------------------------
-- Trigger Test
---------------------------------------------------------

INSERT INTO APP_ROLE
(
    DEPARTMENT_ID,
    APP_ROLE_CODE,
    APP_ROLE_NAME,
    APP_ROLE_DESCRIPTION
)
VALUES
(
    1,
    'TEST_ROLE',
    'Test Role',
    'Temporary role for trigger verification.'
);

COMMIT;

SELECT *
FROM APP_ROLE
WHERE APP_ROLE_CODE='TEST_ROLE';

DELETE FROM APP_ROLE
WHERE APP_ROLE_CODE='TEST_ROLE';

COMMIT;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT APP_ROLE module tested successfully.
PROMPT ===========================================