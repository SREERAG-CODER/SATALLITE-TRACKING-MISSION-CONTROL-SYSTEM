/*
=========================================================
Project       : Satellite Mission Control System
Module        : Relationship Tables
Object        : MISSION_GROUND_STATION
File          : 71_MISSION_GROUND_STATION_TEST.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Verifies the MISSION_GROUND_STATION table,
constraints, indexes, sequence, triggers,
comments and sample data.
=========================================================
*/

---------------------------------------------------------
-- Verify Table Structure
---------------------------------------------------------

DESC MISSION_GROUND_STATION;

---------------------------------------------------------
-- Display All Assignments
---------------------------------------------------------

SELECT *
FROM MISSION_GROUND_STATION
ORDER BY MISSION_GROUND_STATION_ID;

---------------------------------------------------------
-- Total Assignments
---------------------------------------------------------

SELECT COUNT(*) AS TOTAL_ASSIGNMENTS
FROM MISSION_GROUND_STATION;

---------------------------------------------------------
-- Active Assignments
---------------------------------------------------------

SELECT
    MGS.MISSION_GROUND_STATION_ID,
    M.MISSION_NAME,
    GS.STATION_NAME,
    MGS.STATION_ROLE,
    MGS.OPERATION_TYPE
FROM MISSION_GROUND_STATION MGS
JOIN MISSION M
ON MGS.MISSION_ID = M.MISSION_ID
JOIN GROUND_STATION GS
ON MGS.GROUND_STATION_ID = GS.GROUND_STATION_ID
WHERE MGS.STATUS = 'ACTIVE'
ORDER BY M.MISSION_NAME;

---------------------------------------------------------
-- Assignment History
---------------------------------------------------------

SELECT
    M.MISSION_NAME,
    GS.STATION_NAME,
    MGS.ASSIGNMENT_START_DATE,
    MGS.ASSIGNMENT_END_DATE,
    MGS.STATUS
FROM MISSION_GROUND_STATION MGS
JOIN MISSION M
ON MGS.MISSION_ID = M.MISSION_ID
JOIN GROUND_STATION GS
ON MGS.GROUND_STATION_ID = GS.GROUND_STATION_ID
ORDER BY M.MISSION_NAME,
         MGS.ASSIGNMENT_START_DATE;

---------------------------------------------------------
-- Verify Constraints
---------------------------------------------------------

SELECT
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'MISSION_GROUND_STATION'
ORDER BY CONSTRAINT_NAME;

---------------------------------------------------------
-- Verify Indexes
---------------------------------------------------------

SELECT INDEX_NAME
FROM USER_INDEXES
WHERE TABLE_NAME = 'MISSION_GROUND_STATION'
ORDER BY INDEX_NAME;

---------------------------------------------------------
-- Verify Sequence
---------------------------------------------------------

SELECT *
FROM USER_SEQUENCES
WHERE SEQUENCE_NAME = 'SEQ_MISSION_GROUND_STATION';

---------------------------------------------------------
-- Verify Triggers
---------------------------------------------------------

SELECT
    TRIGGER_NAME,
    STATUS
FROM USER_TRIGGERS
WHERE TABLE_NAME = 'MISSION_GROUND_STATION'
ORDER BY TRIGGER_NAME;

---------------------------------------------------------
-- Verify Comments
---------------------------------------------------------

SELECT COMMENTS
FROM USER_TAB_COMMENTS
WHERE TABLE_NAME = 'MISSION_GROUND_STATION';

SELECT
    COLUMN_NAME,
    COMMENTS
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'MISSION_GROUND_STATION'
ORDER BY COLUMN_NAME;

---------------------------------------------------------
-- Trigger Test
---------------------------------------------------------

INSERT INTO MISSION_GROUND_STATION
(
    MISSION_ID,
    GROUND_STATION_ID,
    STATION_ROLE,
    OPERATION_TYPE,
    STATUS,
    REMARKS
)
VALUES
(
    (SELECT MISSION_ID
       FROM MISSION
      WHERE MISSION_CODE = 'CH3'),

    (SELECT GROUND_STATION_ID
       FROM GROUND_STATION
      WHERE STATION_CODE = 'ISTRAC_BLR'),

    'BACKUP',

    'COMMAND',

    'ACTIVE',

    'Temporary assignment for trigger testing.'
);

COMMIT;

SELECT *
FROM MISSION_GROUND_STATION
WHERE REMARKS = 'Temporary assignment for trigger testing.';

---------------------------------------------------------
-- Update Trigger Test
---------------------------------------------------------

UPDATE MISSION_GROUND_STATION
SET REMARKS = 'Updated trigger test.'
WHERE REMARKS = 'Temporary assignment for trigger testing.';

COMMIT;

SELECT
    MISSION_GROUND_STATION_ID,
    UPDATED_AT
FROM MISSION_GROUND_STATION
WHERE REMARKS = 'Updated trigger test.';

---------------------------------------------------------
-- Cleanup
---------------------------------------------------------

DELETE FROM MISSION_GROUND_STATION
WHERE REMARKS = 'Updated trigger test.';

COMMIT;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT MISSION_GROUND_STATION module tested successfully.
PROMPT ===========================================