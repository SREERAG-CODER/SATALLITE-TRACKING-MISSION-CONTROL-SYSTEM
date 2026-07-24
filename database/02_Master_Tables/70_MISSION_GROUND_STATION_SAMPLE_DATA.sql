/*
=========================================================
Project       : Satellite Mission Control System
Module        : Relationship Tables
Object        : MISSION_GROUND_STATION
File          : 70_MISSION_GROUND_STATION_SAMPLE_DATA.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Inserts sample mission-ground station
relationship records using real-world
mission support assignments.
=========================================================
*/

---------------------------------------------------------
-- Chandrayaan-3 -> ISTRAC Bengaluru
---------------------------------------------------------

INSERT INTO MISSION_GROUND_STATION
(
    MISSION_ID,
    GROUND_STATION_ID,
    STATION_ROLE,
    OPERATION_TYPE,
    ASSIGNMENT_START_DATE,
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

    'PRIMARY',

    'TRACKING',

    DATE '2023-07-14',

    'ACTIVE',

    'Primary mission operations and tracking station.'
);

---------------------------------------------------------
-- Chandrayaan-3 -> Indian Deep Space Network
---------------------------------------------------------

INSERT INTO MISSION_GROUND_STATION
(
    MISSION_ID,
    GROUND_STATION_ID,
    STATION_ROLE,
    OPERATION_TYPE,
    ASSIGNMENT_START_DATE,
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
      WHERE STATION_CODE = 'IDSN_BYALALU'),

    'PRIMARY',

    'DEEP_SPACE',

    DATE '2023-07-14',

    'ACTIVE',

    'Deep space communication support.'
);

---------------------------------------------------------
-- Aditya-L1 -> ISTRAC Bengaluru
---------------------------------------------------------

INSERT INTO MISSION_GROUND_STATION
(
    MISSION_ID,
    GROUND_STATION_ID,
    STATION_ROLE,
    OPERATION_TYPE,
    ASSIGNMENT_START_DATE,
    STATUS,
    REMARKS
)
VALUES
(
    (SELECT MISSION_ID
       FROM MISSION
      WHERE MISSION_CODE = 'ADITYA_L1'),

    (SELECT GROUND_STATION_ID
       FROM GROUND_STATION
      WHERE STATION_CODE = 'ISTRAC_BLR'),

    'PRIMARY',

    'TRACKING',

    DATE '2023-09-02',

    'ACTIVE',

    'Primary mission control and telemetry station.'
);

---------------------------------------------------------
-- Aditya-L1 -> ESA Cebreros
---------------------------------------------------------

INSERT INTO MISSION_GROUND_STATION
(
    MISSION_ID,
    GROUND_STATION_ID,
    STATION_ROLE,
    OPERATION_TYPE,
    ASSIGNMENT_START_DATE,
    STATUS,
    REMARKS
)
VALUES
(
    (SELECT MISSION_ID
       FROM MISSION
      WHERE MISSION_CODE = 'ADITYA_L1'),

    (SELECT GROUND_STATION_ID
       FROM GROUND_STATION
      WHERE STATION_CODE = 'CEBREROS'),

    'RELAY',

    'DEEP_SPACE',

    DATE '2023-09-02',

    'ACTIVE',

    'Supports deep-space communications during mission.'
);

---------------------------------------------------------
-- Mars Orbiter Mission -> Canberra DSCC
---------------------------------------------------------

INSERT INTO MISSION_GROUND_STATION
(
    MISSION_ID,
    GROUND_STATION_ID,
    STATION_ROLE,
    OPERATION_TYPE,
    ASSIGNMENT_START_DATE,
    ASSIGNMENT_END_DATE,
    STATUS,
    REMARKS
)
VALUES
(
    (SELECT MISSION_ID
       FROM MISSION
      WHERE MISSION_CODE = 'MOM'),

    (SELECT GROUND_STATION_ID
       FROM GROUND_STATION
      WHERE STATION_CODE = 'CDSCC'),

    'RELAY',

    'DEEP_SPACE',

    DATE '2013-11-05',

    DATE '2022-10-02',

    'COMPLETED',

    'NASA Deep Space Network support for Mars Orbiter Mission.'
);

---------------------------------------------------------
-- XPoSat -> ISTRAC Bengaluru
---------------------------------------------------------

INSERT INTO MISSION_GROUND_STATION
(
    MISSION_ID,
    GROUND_STATION_ID,
    STATION_ROLE,
    OPERATION_TYPE,
    ASSIGNMENT_START_DATE,
    STATUS,
    REMARKS
)
VALUES
(
    (SELECT MISSION_ID
       FROM MISSION
      WHERE MISSION_CODE = 'XPOSAT'),

    (SELECT GROUND_STATION_ID
       FROM GROUND_STATION
      WHERE STATION_CODE = 'ISTRAC_BLR'),

    'PRIMARY',

    'TRACKING',

    DATE '2024-01-01',

    'ACTIVE',

    'Routine mission operations and tracking support.'
);

COMMIT;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT MISSION_GROUND_STATION sample data inserted successfully.
PROMPT ===========================================