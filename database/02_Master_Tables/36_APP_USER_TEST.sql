/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : APP_USER
File          : 36_APP_USER_TEST.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Verifies the APP_USER table, sequence,
trigger, indexes, comments, constraints,
foreign key relationships, and sample data.
=========================================================
*/

---------------------------------------------------------
-- Verify Table Structure
---------------------------------------------------------

DESC APP_USER;

---------------------------------------------------------
-- Display All Users
---------------------------------------------------------

SELECT *
FROM APP_USER
ORDER BY USER_ID;

---------------------------------------------------------
-- Total Users
---------------------------------------------------------

SELECT COUNT(*) AS TOTAL_USERS
FROM APP_USER;

---------------------------------------------------------
-- Display Active Users
---------------------------------------------------------

SELECT
    USERNAME,
    FIRST_NAME,
    LAST_NAME,
    EMAIL
FROM APP_USER
WHERE IS_ACTIVE = 'Y'
ORDER BY USERNAME;

---------------------------------------------------------
-- Display Users with Department
---------------------------------------------------------

SELECT
    AU.USER_ID,
    AU.EMPLOYEE_ID,
    AU.USERNAME,
    AU.FIRST_NAME || ' ' || AU.LAST_NAME AS FULL_NAME,
    D.DEPARTMENT_NAME,
    AU.EMAIL,
    AU.IS_ACTIVE
FROM APP_USER AU
JOIN DEPARTMENT D
ON AU.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY D.DEPARTMENT_NAME,
         AU.FIRST_NAME;

---------------------------------------------------------
-- Verify Constraints
---------------------------------------------------------

SELECT
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'APP_USER'
ORDER BY CONSTRAINT_NAME;

---------------------------------------------------------
-- Verify Indexes
---------------------------------------------------------

SELECT
    INDEX_NAME
FROM USER_INDEXES
WHERE TABLE_NAME = 'APP_USER'
ORDER BY INDEX_NAME;

---------------------------------------------------------
-- Verify Sequence
---------------------------------------------------------

SELECT *
FROM USER_SEQUENCES
WHERE SEQUENCE_NAME = 'SEQ_APP_USER';

---------------------------------------------------------
-- Verify Trigger
---------------------------------------------------------

SELECT
    TRIGGER_NAME,
    STATUS
FROM USER_TRIGGERS
WHERE TABLE_NAME = 'APP_USER';

---------------------------------------------------------
-- Verify Comments
---------------------------------------------------------

SELECT COMMENTS
FROM USER_TAB_COMMENTS
WHERE TABLE_NAME = 'APP_USER';

SELECT
    COLUMN_NAME,
    COMMENTS
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'APP_USER'
ORDER BY COLUMN_NAME;

---------------------------------------------------------
-- Trigger Test
---------------------------------------------------------

INSERT INTO APP_USER
(
    DEPARTMENT_ID,
    EMPLOYEE_ID,
    USERNAME,
    EMAIL,
    PASSWORD_HASH,
    FIRST_NAME,
    LAST_NAME,
    PHONE_NUMBER,
    PROFILE_IMAGE_URL
)
VALUES
(
    (SELECT DEPARTMENT_ID
     FROM DEPARTMENT
     WHERE DEPARTMENT_CODE = 'ADMIN'),

    'EMP999',
    'test_user',
    'test.user@satmission.com',
    '$2B$TEST_HASH',
    'Test',
    'User',
    '9999999999',
    '/images/test.png'
);

COMMIT;

SELECT *
FROM APP_USER
WHERE USERNAME = 'test_user';

DELETE FROM APP_USER
WHERE USERNAME = 'test_user';

COMMIT;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT APP_USER module tested successfully.
PROMPT ===========================================