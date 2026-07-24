/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Operations
Object        : TELEMETRY
File          : 87_TELEMETRY_TEST.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 24-JUL-2026
=========================================================
Description:
Verifies the TELEMETRY table, constraints,
indexes, sequence, triggers, comments,
and sample data.
=========================================================
*/

---------------------------------------------------------
-- Verify Table Structure
---------------------------------------------------------

DESC TELEMETRY;

---------------------------------------------------------
-- Display All Telemetry
---------------------------------------------------------

SELECT *
FROM TELEMETRY
ORDER BY TELEMETRY_ID;

---------------------------------------------------------
-- Total Telemetry Records
---------------------------------------------------------

SELECT COUNT(*) AS TOTAL_TELEMETRY
FROM TELEMETRY;

---------------------------------------------------------
-- Telemetry by Mission
---------------------------------------------------------

SELECT
    M.MISSION_NAME,
    COUNT(T.TELEMETRY_ID) AS TOTAL_RECORDS
FROM TELEMETRY T
JOIN MISSION M
ON T.MISSION_ID = M.MISSION_ID
GROUP BY M.MISSION_NAME
ORDER BY M.MISSION_NAME;

---------------------------------------------------------
-- Telemetry by Satellite
---------------------------------------------------------

SELECT
    S.SATELLITE_NAME,
    COUNT(T.TELEMETRY_ID) AS TOTAL_RECORDS
FROM TELEMETRY T
JOIN SATELLITE S
ON T.SATELLITE_ID = S.SATELLITE_ID
GROUP BY S.SATELLITE_NAME
ORDER BY S.SATELLITE_NAME;

---------------------------------------------------------
-- Telemetry by Quality
---------------------------------------------------------

SELECT
    QUALITY_FLAG,
    COUNT(*) AS TOTAL_RECORDS
FROM TELEMETRY
GROUP BY QUALITY_FLAG
ORDER BY QUALITY_FLAG;

---------------------------------------------------------
-- Latest Telemetry
---------------------------------------------------------

SELECT
    PARAMETER_NAME,
    PARAMETER_VALUE,
    UNIT,
    RECORDED_AT
FROM TELEMETRY
ORDER BY RECORDED_AT DESC;

---------------------------------------------------------
-- Critical Telemetry
---------------------------------------------------------

SELECT
    PARAMETER_NAME,
    PARAMETER_VALUE,
    UNIT,
    QUALITY_FLAG
FROM TELEMETRY
WHERE QUALITY_FLAG = 'CRITICAL';

---------------------------------------------------------
-- Telemetry Linked To Commands
---------------------------------------------------------

SELECT
    C.COMMAND_CODE,
    T.PARAMETER_NAME,
    T.PARAMETER_VALUE,
    T.UNIT
FROM TELEMETRY T
JOIN COMMAND C
ON T.COMMAND_ID = C.COMMAND_ID
ORDER BY C.COMMAND_CODE;

---------------------------------------------------------
-- Verify Constraints
---------------------------------------------------------

SELECT
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TELEMETRY'
ORDER BY CONSTRAINT_NAME;

---------------------------------------------------------
-- Verify Indexes
---------------------------------------------------------

SELECT
    INDEX_NAME
FROM USER_INDEXES
WHERE TABLE_NAME = 'TELEMETRY'
ORDER BY INDEX_NAME;

---------------------------------------------------------
-- Verify Sequence
---------------------------------------------------------

SELECT *
FROM USER_SEQUENCES
WHERE SEQUENCE_NAME = 'SEQ_TELEMETRY';

---------------------------------------------------------
-- Verify Triggers
---------------------------------------------------------

SELECT
    TRIGGER_NAME,
    STATUS
FROM USER_TRIGGERS
WHERE TABLE_NAME = 'TELEMETRY'
ORDER BY TRIGGER_NAME;

---------------------------------------------------------
-- Verify Comments
---------------------------------------------------------

SELECT COMMENTS
FROM USER_TAB_COMMENTS
WHERE TABLE_NAME = 'TELEMETRY';

SELECT
    COLUMN_NAME,
    COMMENTS
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TELEMETRY'
ORDER BY COLUMN_NAME;

---------------------------------------------------------
-- Trigger Test
---------------------------------------------------------

INSERT INTO TELEMETRY
(
    MISSION_ID,
    SATELLITE_ID,
    PARAMETER_NAME,
    PARAMETER_VALUE,
    UNIT
)
VALUES
(
    (SELECT MISSION_ID
       FROM MISSION
      WHERE MISSION_CODE='CH3'),

    (SELECT SATELLITE_ID
       FROM SATELLITE
      WHERE SATELLITE_CODE='CH3_PM'),

    'TEST_PARAMETER',

    100,

    'UNIT'
);

COMMIT;

SELECT
    TELEMETRY_ID,
    CREATED_AT
FROM TELEMETRY
WHERE PARAMETER_NAME='TEST_PARAMETER';

---------------------------------------------------------
-- Update Trigger Test
---------------------------------------------------------

UPDATE TELEMETRY
SET PARAMETER_VALUE = 200
WHERE PARAMETER_NAME='TEST_PARAMETER';

COMMIT;

SELECT
    UPDATED_AT
FROM TELEMETRY
WHERE PARAMETER_NAME='TEST_PARAMETER';

---------------------------------------------------------
-- Cleanup
---------------------------------------------------------

DELETE FROM TELEMETRY
WHERE PARAMETER_NAME='TEST_PARAMETER';

COMMIT;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT TELEMETRY module tested successfully.
PROMPT ===========================================