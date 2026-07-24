/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Operations
Object        : COMMAND
File          : 79_COMMAND_TEST.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 24-JUL-2026
=========================================================
Description:
Verifies the COMMAND table, constraints,
indexes, sequence, triggers, comments,
and sample data.
=========================================================
*/

---------------------------------------------------------
-- Verify Table Structure
---------------------------------------------------------

DESC COMMAND;

---------------------------------------------------------
-- Display All Commands
---------------------------------------------------------

SELECT *
FROM COMMAND
ORDER BY COMMAND_ID;

---------------------------------------------------------
-- Total Commands
---------------------------------------------------------

SELECT COUNT(*) AS TOTAL_COMMANDS
FROM COMMAND;

---------------------------------------------------------
-- Commands by Status
---------------------------------------------------------

SELECT
    STATUS,
    COUNT(*) AS TOTAL_COMMANDS
FROM COMMAND
GROUP BY STATUS
ORDER BY STATUS;

---------------------------------------------------------
-- Commands by Priority
---------------------------------------------------------

SELECT
    PRIORITY,
    COUNT(*) AS TOTAL_COMMANDS
FROM COMMAND
GROUP BY PRIORITY
ORDER BY PRIORITY;

---------------------------------------------------------
-- Mission Command Summary
---------------------------------------------------------

SELECT
    M.MISSION_NAME,
    COUNT(C.COMMAND_ID) AS TOTAL_COMMANDS
FROM COMMAND C
JOIN MISSION M
ON C.MISSION_ID = M.MISSION_ID
GROUP BY M.MISSION_NAME
ORDER BY M.MISSION_NAME;

---------------------------------------------------------
-- Satellite Command Summary
---------------------------------------------------------

SELECT
    S.SATELLITE_NAME,
    COUNT(C.COMMAND_ID) AS TOTAL_COMMANDS
FROM COMMAND C
JOIN SATELLITE S
ON C.SATELLITE_ID = S.SATELLITE_ID
GROUP BY S.SATELLITE_NAME
ORDER BY S.SATELLITE_NAME;

---------------------------------------------------------
-- Pending Commands
---------------------------------------------------------

SELECT
    COMMAND_CODE,
    COMMAND_NAME,
    STATUS,
    PRIORITY,
    SCHEDULED_TIME
FROM COMMAND
WHERE STATUS IN
(
    'DRAFT',
    'VALIDATED',
    'APPROVED',
    'QUEUED'
)
ORDER BY PRIORITY,
         SCHEDULED_TIME;

---------------------------------------------------------
-- Completed Commands
---------------------------------------------------------

SELECT
    COMMAND_CODE,
    COMMAND_NAME,
    EXECUTED_TIME
FROM COMMAND
WHERE STATUS = 'COMPLETED'
ORDER BY EXECUTED_TIME DESC;

---------------------------------------------------------
-- Failed Commands
---------------------------------------------------------

SELECT
    COMMAND_CODE,
    COMMAND_NAME,
    RETRY_COUNT,
    EXECUTION_RESULT
FROM COMMAND
WHERE STATUS = 'FAILED';

---------------------------------------------------------
-- Verify Constraints
---------------------------------------------------------

SELECT
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'COMMAND'
ORDER BY CONSTRAINT_NAME;

---------------------------------------------------------
-- Verify Indexes
---------------------------------------------------------

SELECT
    INDEX_NAME
FROM USER_INDEXES
WHERE TABLE_NAME = 'COMMAND'
ORDER BY INDEX_NAME;

---------------------------------------------------------
-- Verify Sequence
---------------------------------------------------------

SELECT *
FROM USER_SEQUENCES
WHERE SEQUENCE_NAME = 'SEQ_COMMAND';

---------------------------------------------------------
-- Verify Triggers
---------------------------------------------------------

SELECT
    TRIGGER_NAME,
    STATUS
FROM USER_TRIGGERS
WHERE TABLE_NAME = 'COMMAND'
ORDER BY TRIGGER_NAME;

---------------------------------------------------------
-- Verify Comments
---------------------------------------------------------

SELECT COMMENTS
FROM USER_TAB_COMMENTS
WHERE TABLE_NAME = 'COMMAND';

SELECT
    COLUMN_NAME,
    COMMENTS
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'COMMAND'
ORDER BY COLUMN_NAME;

---------------------------------------------------------
-- Trigger Test
---------------------------------------------------------

INSERT INTO COMMAND
(
    COMMAND_CODE,
    MISSION_ID,
    SATELLITE_ID,
    MISSION_GROUND_STATION_ID,
    COMMAND_NAME,
    COMMAND_TYPE,
    COMMAND_PAYLOAD,
    STATUS
)
VALUES
(
    'CMD-TEST-001',

    (SELECT MISSION_ID
       FROM MISSION
      WHERE MISSION_CODE='CH3'),

    (SELECT SATELLITE_ID
       FROM SATELLITE
      WHERE SATELLITE_CODE='CH3_PM'),

    (SELECT MISSION_GROUND_STATION_ID
       FROM MISSION_GROUND_STATION
      WHERE MISSION_ID =
      (
          SELECT MISSION_ID
          FROM MISSION
          WHERE MISSION_CODE='CH3'
      )
      AND ROWNUM = 1),

    'Trigger Test Command',

    'SYSTEM',

    '{"test":"true"}',

    'DRAFT'
);

COMMIT;

SELECT
    COMMAND_ID,
    COMMAND_CODE,
    CREATED_AT
FROM COMMAND
WHERE COMMAND_CODE = 'CMD-TEST-001';

---------------------------------------------------------
-- Update Trigger Test
---------------------------------------------------------

UPDATE COMMAND
SET COMMAND_NAME = 'Updated Trigger Test Command'
WHERE COMMAND_CODE = 'CMD-TEST-001';

COMMIT;

SELECT
    COMMAND_CODE,
    UPDATED_AT
FROM COMMAND
WHERE COMMAND_CODE = 'CMD-TEST-001';

---------------------------------------------------------
-- Cleanup
---------------------------------------------------------

DELETE FROM COMMAND
WHERE COMMAND_CODE = 'CMD-TEST-001';

COMMIT;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT COMMAND module tested successfully.
PROMPT ===========================================