/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : SATELLITE
File          : 44_SATELLITE_TEST.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Verifies the SATELLITE table, sequence,
trigger, indexes, comments, constraints,
and sample data.
=========================================================
*/

---------------------------------------------------------
-- Verify Table Structure
---------------------------------------------------------

DESC SATELLITE;

---------------------------------------------------------
-- Display All Satellites
---------------------------------------------------------

SELECT *
FROM SATELLITE
ORDER BY SATELLITE_ID;

---------------------------------------------------------
-- Total Satellites
---------------------------------------------------------

SELECT COUNT(*) AS TOTAL_SATELLITES
FROM SATELLITE;

---------------------------------------------------------
-- Display Active Satellites
---------------------------------------------------------

SELECT
    SATELLITE_NAME,
    SATELLITE_TYPE,
    STATUS,
    COUNTRY
FROM SATELLITE
WHERE IS_ACTIVE = 'Y'
ORDER BY SATELLITE_NAME;

---------------------------------------------------------
-- Satellites by Orbit Type
---------------------------------------------------------

SELECT
    ORBIT_TYPE,
    COUNT(*) AS TOTAL
FROM SATELLITE
GROUP BY ORBIT_TYPE
ORDER BY ORBIT_TYPE;

---------------------------------------------------------
-- Satellites by Type
---------------------------------------------------------

SELECT
    SATELLITE_TYPE,
    COUNT(*) AS TOTAL
FROM SATELLITE
GROUP BY SATELLITE_TYPE
ORDER BY SATELLITE_TYPE;

---------------------------------------------------------
-- Display Launch Details
---------------------------------------------------------

SELECT
    SATELLITE_NAME,
    LAUNCH_DATE,
    LAUNCH_VEHICLE,
    OPERATOR
FROM SATELLITE
ORDER BY LAUNCH_DATE DESC;

---------------------------------------------------------
-- Verify Constraints
---------------------------------------------------------

SELECT
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'SATELLITE'
ORDER BY CONSTRAINT_NAME;

---------------------------------------------------------
-- Verify Indexes
---------------------------------------------------------

SELECT
    INDEX_NAME
FROM USER_INDEXES
WHERE TABLE_NAME = 'SATELLITE'
ORDER BY INDEX_NAME;

---------------------------------------------------------
-- Verify Sequence
---------------------------------------------------------

SELECT *
FROM USER_SEQUENCES
WHERE SEQUENCE_NAME = 'SEQ_SATELLITE';

---------------------------------------------------------
-- Verify Trigger
---------------------------------------------------------

SELECT
    TRIGGER_NAME,
    STATUS
FROM USER_TRIGGERS
WHERE TABLE_NAME = 'SATELLITE';

---------------------------------------------------------
-- Verify Comments
---------------------------------------------------------

SELECT COMMENTS
FROM USER_TAB_COMMENTS
WHERE TABLE_NAME = 'SATELLITE';

SELECT
    COLUMN_NAME,
    COMMENTS
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'SATELLITE'
ORDER BY COLUMN_NAME;

---------------------------------------------------------
-- Trigger Test
---------------------------------------------------------

INSERT INTO SATELLITE
(
    SATELLITE_CODE,
    SATELLITE_NAME,
    SATELLITE_TYPE,
    STATUS,
    OPERATOR,
    MANUFACTURER,
    COUNTRY,
    LAUNCH_VEHICLE,
    ORBIT_TYPE,
    MASS_KG,
    POWER_W,
    LAUNCH_DATE,
    EXPECTED_LIFE_YEARS,
    DESCRIPTION
)
VALUES
(
    'TEST_SAT',
    'Test Satellite',
    'SCIENTIFIC',
    'PLANNED',
    'ISRO',
    'U R Rao Satellite Centre',
    'India',
    'PSLV',
    'LEO',
    500,
    1200,
    DATE '2026-01-01',
    5,
    'Temporary satellite created for trigger testing.'
);

COMMIT;

SELECT *
FROM SATELLITE
WHERE SATELLITE_CODE = 'TEST_SAT';

DELETE FROM SATELLITE
WHERE SATELLITE_CODE = 'TEST_SAT';

COMMIT;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT SATELLITE module tested successfully.
PROMPT ===========================================