/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : DEPARTMENT
File          : 07_DEPARTMENT_TEST.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Verifies the DEPARTMENT table, sequence, trigger,
constraints, comments and sample data.
=========================================================
*/

---------------------------------------------------------
-- Verify Table Structure
---------------------------------------------------------

DESC DEPARTMENT;

---------------------------------------------------------
-- Display All Departments
---------------------------------------------------------

SELECT *
FROM DEPARTMENT
ORDER BY DEPARTMENT_ID;

---------------------------------------------------------
-- Verify Total Number of Departments
---------------------------------------------------------

SELECT COUNT(*) AS TOTAL_DEPARTMENTS
FROM DEPARTMENT;

---------------------------------------------------------
-- Verify Active Departments
---------------------------------------------------------

SELECT *
FROM DEPARTMENT
WHERE IS_ACTIVE = 'Y';

---------------------------------------------------------
-- Verify Primary Key
---------------------------------------------------------

SELECT CONSTRAINT_NAME,
       CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'DEPARTMENT'
AND CONSTRAINT_TYPE = 'P';

---------------------------------------------------------
-- Verify Unique Constraints
---------------------------------------------------------

SELECT CONSTRAINT_NAME,
       CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'DEPARTMENT'
AND CONSTRAINT_TYPE = 'U';

---------------------------------------------------------
-- Verify Check Constraints
---------------------------------------------------------

SELECT CONSTRAINT_NAME,
       SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'DEPARTMENT'
AND CONSTRAINT_TYPE = 'C';

---------------------------------------------------------
-- Verify Sequence
---------------------------------------------------------

SELECT SEQUENCE_NAME,
       MIN_VALUE,
       INCREMENT_BY,
       LAST_NUMBER
FROM USER_SEQUENCES
WHERE SEQUENCE_NAME = 'SEQ_DEPARTMENT';

---------------------------------------------------------
-- Verify Trigger
---------------------------------------------------------

SELECT TRIGGER_NAME,
       STATUS
FROM USER_TRIGGERS
WHERE TABLE_NAME = 'DEPARTMENT';

---------------------------------------------------------
-- Verify Indexes
---------------------------------------------------------

SELECT INDEX_NAME
FROM USER_INDEXES
WHERE TABLE_NAME = 'DEPARTMENT';

---------------------------------------------------------
-- Verify Table Comment
---------------------------------------------------------

SELECT COMMENTS
FROM USER_TAB_COMMENTS
WHERE TABLE_NAME = 'DEPARTMENT';

---------------------------------------------------------
-- Verify Column Comments
---------------------------------------------------------

SELECT COLUMN_NAME,
       COMMENTS
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'DEPARTMENT'
ORDER BY COLUMN_NAME;

---------------------------------------------------------
-- Trigger Test
---------------------------------------------------------

INSERT INTO DEPARTMENT
(
    DEPARTMENT_CODE,
    DEPARTMENT_NAME,
    DESCRIPTION
)
VALUES
(
    'TEST',
    'Test Department',
    'Department created to verify trigger functionality.'
);

COMMIT;

---------------------------------------------------------
-- Verify Trigger Generated Department ID
---------------------------------------------------------

SELECT *
FROM DEPARTMENT
WHERE DEPARTMENT_CODE = 'TEST';

---------------------------------------------------------
-- Cleanup Test Record
---------------------------------------------------------

DELETE FROM DEPARTMENT
WHERE DEPARTMENT_CODE = 'TEST';

COMMIT;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT DEPARTMENT module tested successfully.
PROMPT ===========================================