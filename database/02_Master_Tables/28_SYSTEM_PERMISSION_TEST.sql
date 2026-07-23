/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : SYSTEM_PERMISSION
File          : 28_SYSTEM_PERMISSION_TEST.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Verifies the SYSTEM_PERMISSION table, sequence,
trigger, indexes, comments, constraints,
foreign key relationships, and sample data.
=========================================================
*/

---------------------------------------------------------
-- Verify Table Structure
---------------------------------------------------------

DESC SYSTEM_PERMISSION;

---------------------------------------------------------
-- Display All Permissions
---------------------------------------------------------

SELECT *
FROM SYSTEM_PERMISSION
ORDER BY PERMISSION_ID;

---------------------------------------------------------
-- Total Permissions
---------------------------------------------------------

SELECT COUNT(*) AS TOTAL_PERMISSIONS
FROM SYSTEM_PERMISSION;

---------------------------------------------------------
-- Display Active Permissions
---------------------------------------------------------

SELECT PERMISSION_CODE,
       PERMISSION_NAME,
       PERMISSION_CATEGORY
FROM SYSTEM_PERMISSION
WHERE IS_ACTIVE = 'Y'
ORDER BY PERMISSION_CODE;

---------------------------------------------------------
-- Display Permissions with Module Name
---------------------------------------------------------

SELECT
    SM.MODULE_NAME,
    SP.PERMISSION_CATEGORY,
    SP.PERMISSION_CODE,
    SP.PERMISSION_NAME
FROM SYSTEM_PERMISSION SP
JOIN SYSTEM_MODULE SM
ON SP.MODULE_ID = SM.MODULE_ID
ORDER BY SM.MODULE_NAME,
         SP.PERMISSION_NAME;

---------------------------------------------------------
-- Verify Constraints
---------------------------------------------------------

SELECT CONSTRAINT_NAME,
       CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'SYSTEM_PERMISSION'
ORDER BY CONSTRAINT_NAME;

---------------------------------------------------------
-- Verify Indexes
---------------------------------------------------------

SELECT INDEX_NAME
FROM USER_INDEXES
WHERE TABLE_NAME = 'SYSTEM_PERMISSION'
ORDER BY INDEX_NAME;

---------------------------------------------------------
-- Verify Sequence
---------------------------------------------------------

SELECT *
FROM USER_SEQUENCES
WHERE SEQUENCE_NAME = 'SEQ_SYSTEM_PERMISSION';

---------------------------------------------------------
-- Verify Trigger
---------------------------------------------------------

SELECT TRIGGER_NAME,
       STATUS
FROM USER_TRIGGERS
WHERE TABLE_NAME = 'SYSTEM_PERMISSION';

---------------------------------------------------------
-- Verify Comments
---------------------------------------------------------

SELECT COMMENTS
FROM USER_TAB_COMMENTS
WHERE TABLE_NAME = 'SYSTEM_PERMISSION';

SELECT COLUMN_NAME,
       COMMENTS
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'SYSTEM_PERMISSION'
ORDER BY COLUMN_NAME;

---------------------------------------------------------
-- Trigger Test
---------------------------------------------------------

INSERT INTO SYSTEM_PERMISSION
(
    MODULE_ID,
    PERMISSION_CATEGORY,
    PERMISSION_CODE,
    PERMISSION_NAME,
    PERMISSION_DESCRIPTION
)
VALUES
(
    (SELECT MODULE_ID
     FROM SYSTEM_MODULE
     WHERE MODULE_CODE = 'SETTINGS'),
    'CONFIGURATION',
    'TEST_PERMISSION',
    'Test Permission',
    'Temporary permission used for testing.'
);

COMMIT;

SELECT *
FROM SYSTEM_PERMISSION
WHERE PERMISSION_CODE = 'TEST_PERMISSION';

DELETE FROM SYSTEM_PERMISSION
WHERE PERMISSION_CODE = 'TEST_PERMISSION';

COMMIT;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT SYSTEM_PERMISSION module tested successfully.
PROMPT ===========================================