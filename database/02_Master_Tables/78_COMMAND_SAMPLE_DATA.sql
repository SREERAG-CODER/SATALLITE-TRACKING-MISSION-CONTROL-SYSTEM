/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Operations
Object        : COMMAND
File          : 78_COMMAND_SAMPLE_DATA.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 24-JUL-2026
=========================================================
Description:
Inserts sample command records representing
different stages of the command lifecycle.
=========================================================
*/

---------------------------------------------------------
-- Command 1 : Draft
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
    PRIORITY,
    STATUS,
    SCHEDULED_TIME
)
VALUES
(
    'CMD-000001',

    (SELECT MISSION_ID
       FROM MISSION
      WHERE MISSION_CODE = 'CH3'),

    (SELECT SATELLITE_ID
       FROM SATELLITE
      WHERE SATELLITE_CODE = 'CH3_PM'),

    (SELECT MISSION_GROUND_STATION_ID
       FROM MISSION_GROUND_STATION
      WHERE MISSION_ID = (SELECT MISSION_ID
                            FROM MISSION
                           WHERE MISSION_CODE = 'CH3')
        AND ROWNUM = 1),

    'Capture Lunar Surface Image',

    'PAYLOAD',

    '{"camera":"NAVCAM","mode":"HIGH_RES"}',

    2,

    'DRAFT',

    CURRENT_TIMESTAMP + INTERVAL '10' MINUTE
);

---------------------------------------------------------
-- Command 2 : Queued
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
    PRIORITY,
    STATUS,
    SCHEDULED_TIME
)
VALUES
(
    'CMD-000002',

    (SELECT MISSION_ID FROM MISSION
      WHERE MISSION_CODE='ADITYA_L1'),

    (SELECT SATELLITE_ID FROM SATELLITE
      WHERE SATELLITE_CODE='ADITYA_L1'),

    (SELECT MISSION_GROUND_STATION_ID
       FROM MISSION_GROUND_STATION
      WHERE MISSION_ID =
      (SELECT MISSION_ID
         FROM MISSION
        WHERE MISSION_CODE='ADITYA_L1')
      AND ROWNUM=1),

    'Enable Solar Observation',

    'PAYLOAD',

    '{"instrument":"VELC","state":"ENABLE"}',

    1,

    'QUEUED',

    CURRENT_TIMESTAMP + INTERVAL '5' MINUTE
);

---------------------------------------------------------
-- Command 3 : Completed
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
    PRIORITY,
    STATUS,
    TRANSMITTED_TIME,
    ACKNOWLEDGED_TIME,
    EXECUTED_TIME,
    IS_ACKNOWLEDGED,
    EXECUTION_RESULT
)
VALUES
(
    'CMD-000003',

    (SELECT MISSION_ID FROM MISSION
      WHERE MISSION_CODE='XPOSAT'),

    (SELECT SATELLITE_ID FROM SATELLITE
      WHERE SATELLITE_CODE='XPOSAT'),

    (SELECT MISSION_GROUND_STATION_ID
       FROM MISSION_GROUND_STATION
      WHERE MISSION_ID =
      (SELECT MISSION_ID
         FROM MISSION
        WHERE MISSION_CODE='XPOSAT')
      AND ROWNUM=1),

    'Activate X-Ray Detector',

    'PAYLOAD',

    '{"detector":"POLIX","action":"ACTIVATE"}',

    1,

    'COMPLETED',

    CURRENT_TIMESTAMP - INTERVAL '30' MINUTE,

    CURRENT_TIMESTAMP - INTERVAL '29' MINUTE,

    CURRENT_TIMESTAMP - INTERVAL '28' MINUTE,

    'Y',

    'Command executed successfully.'
);

---------------------------------------------------------
-- Command 4 : Failed
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
    PRIORITY,
    STATUS,
    RETRY_COUNT,
    IS_ACKNOWLEDGED,
    EXECUTION_RESULT
)
VALUES
(
    'CMD-000004',

    (SELECT MISSION_ID FROM MISSION
      WHERE MISSION_CODE='MOM'),

    (SELECT SATELLITE_ID FROM SATELLITE
      WHERE SATELLITE_CODE='MOM'),

    (SELECT MISSION_GROUND_STATION_ID
       FROM MISSION_GROUND_STATION
      WHERE MISSION_ID =
      (SELECT MISSION_ID
         FROM MISSION
        WHERE MISSION_CODE='MOM')
      AND ROWNUM=1),

    'Adjust Orbital Trajectory',

    'ORBIT',

    '{"deltaV":"0.15m/s"}',

    1,

    'FAILED',

    3,

    'N',

    'No acknowledgement received before timeout.'
);

COMMIT;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT COMMAND sample data inserted successfully.
PROMPT ===========================================