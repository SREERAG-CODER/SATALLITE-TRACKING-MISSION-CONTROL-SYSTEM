/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : SYSTEM_MODULE
File          : 21_SYSTEM_MODULE_TEST.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Verifies the SYSTEM_MODULE table, sequence,
trigger, indexes, comments, constraints,
hierarchy, and sample data.
=========================================================
*/

---------------------------------------------------------
-- Verify Table Structure
---------------------------------------------------------

DESC SYSTEM_MODULE;

---------------------------------------------------------
-- Display All Modules
---------------------------------------------------------

SELECT *
FROM SYSTEM_MODULE
ORDER BY MODULE_ID;

---------------------------------------------------------
-- Total Modules
---------------------------------------------------------

SELECT COUNT(*) AS TOTAL_MODULES
FROM SYSTEM_MODULE;

---------------------------------------------------------
-- Display Active Modules
---------------------------------------------------------

SELECT MODULE_ID,
       MODULE_NAME,
       MODULE_TYPE
FROM SYSTEM_MODULE
WHERE IS_ACTIVE = 'Y'
ORDER BY DISPLAY_ORDER;

---------------------------------------------------------
-- Display Root Modules
---------------------------------------------------------

SELECT MODULE_ID,
       MODULE_NAME
FROM SYSTEM_MODULE
WHERE PARENT_MODULE_ID IS NULL
ORDER BY DISPLAY_ORDER;

---------------------------------------------------------
-- Display Sub-Modules
---------------------------------------------------------

SELECT
    C.MODULE_ID,
    P.MODULE_NAME AS PARENT_MODULE,
    C.MODULE_NAME AS SUB_MODULE
FROM SYSTEM_MODULE C
JOIN SYSTEM_MODULE P
ON C.PARENT_MODULE_ID = P.MODULE_ID
ORDER BY P.MODULE_NAME,
         C.DISPLAY_ORDER;

---------------------------------------------------------
-- Display Menu Modules
---------------------------------------------------------

SELECT MODULE_NAME,
       ROUTE_PATH
FROM SYSTEM_MODULE
WHERE IS_MENU = 'Y'
ORDER BY DISPLAY_ORDER;

---------------------------------------------------------
-- Verify Constraints
---------------------------------------------------------

SELECT CONSTRAINT_NAME,
       CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'SYSTEM_MODULE'
ORDER BY CONSTRAINT_NAME;

---------------------------------------------------------
-- Verify Indexes
---------------------------------------------------------

SELECT INDEX_NAME
FROM USER_INDEXES
WHERE TABLE_NAME = 'SYSTEM_MODULE'
ORDER BY INDEX_NAME;

---------------------------------------------------------
-- Verify Sequence
---------------------------------------------------------

SELECT *
FROM USER_SEQUENCES
WHERE SEQUENCE_NAME = 'SEQ_SYSTEM_MODULE';

---------------------------------------------------------
-- Verify Trigger
---------------------------------------------------------

SELECT TRIGGER_NAME,
       STATUS
FROM USER_TRIGGERS
WHERE TABLE_NAME = 'SYSTEM_MODULE';

---------------------------------------------------------
-- Verify Comments
---------------------------------------------------------

SELECT COMMENTS
FROM USER_TAB_COMMENTS
WHERE TABLE_NAME = 'SYSTEM_MODULE';

SELECT COLUMN_NAME,
       COMMENTS
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'SYSTEM_MODULE'
ORDER BY COLUMN_NAME;

---------------------------------------------------------
-- Trigger Test
---------------------------------------------------------

INSERT INTO SYSTEM_MODULE
(
    MODULE_LEVEL,
    MODULE_TYPE,
    MODULE_CODE,
    MODULE_NAME,
    MODULE_DESCRIPTION,
    ROUTE_PATH,
    ICON_NAME,
    DISPLAY_ORDER,
    IS_MENU
)
VALUES
(
    1,
    'UTILITY',
    'TEST_MODULE',
    'Test Module',
    'Temporary module used for testing.',
    '/test-module',
    'build',
    99,
    'N'
);

COMMIT;

SELECT *
FROM SYSTEM_MODULE
WHERE MODULE_CODE = 'TEST_MODULE';

DELETE FROM SYSTEM_MODULE
WHERE MODULE_CODE = 'TEST_MODULE';

COMMIT;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT SYSTEM_MODULE module tested successfully.
PROMPT ===========================================