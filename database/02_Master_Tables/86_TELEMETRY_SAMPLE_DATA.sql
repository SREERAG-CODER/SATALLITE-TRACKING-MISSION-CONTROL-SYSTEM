/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Operations
Object        : TELEMETRY
File          : 86_TELEMETRY_SAMPLE_DATA.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 24-JUL-2026
=========================================================
Description:
Inserts sample telemetry data for multiple
missions and satellites.
=========================================================
*/

---------------------------------------------------------
-- Chandrayaan-3 Telemetry
---------------------------------------------------------

INSERT INTO TELEMETRY
(
    MISSION_ID,
    SATELLITE_ID,
    COMMAND_ID,
    PARAMETER_NAME,
    PARAMETER_VALUE,
    UNIT,
    QUALITY_FLAG
)
VALUES
(
    (SELECT MISSION_ID
       FROM MISSION
      WHERE MISSION_CODE='CH3'),

    (SELECT SATELLITE_ID
       FROM SATELLITE
      WHERE SATELLITE_CODE='CH3_PM'),

    (SELECT COMMAND_ID
       FROM COMMAND
      WHERE COMMAND_CODE='CMD-000003'),

    'BATTERY_VOLTAGE',

    28.45,

    'V',

    'GOOD'
);

---------------------------------------------------------

INSERT INTO TELEMETRY
(
    MISSION_ID,
    SATELLITE_ID,
    COMMAND_ID,
    PARAMETER_NAME,
    PARAMETER_VALUE,
    UNIT,
    QUALITY_FLAG
)
VALUES
(
    (SELECT MISSION_ID FROM MISSION
      WHERE MISSION_CODE='CH3'),

    (SELECT SATELLITE_ID FROM SATELLITE
      WHERE SATELLITE_CODE='CH3_PM'),

    (SELECT COMMAND_ID FROM COMMAND
      WHERE COMMAND_CODE='CMD-000003'),

    'BATTERY_CURRENT',

    4.18,

    'A',

    'GOOD'
);

---------------------------------------------------------

INSERT INTO TELEMETRY
(
    MISSION_ID,
    SATELLITE_ID,
    COMMAND_ID,
    PARAMETER_NAME,
    PARAMETER_VALUE,
    UNIT,
    QUALITY_FLAG
)
VALUES
(
    (SELECT MISSION_ID FROM MISSION
      WHERE MISSION_CODE='CH3'),

    (SELECT SATELLITE_ID FROM SATELLITE
      WHERE SATELLITE_CODE='CH3_PM'),

    (SELECT COMMAND_ID FROM COMMAND
      WHERE COMMAND_CODE='CMD-000003'),

    'PAYLOAD_TEMPERATURE',

    16.80,

    'C',

    'GOOD'
);

---------------------------------------------------------
-- Aditya-L1 Telemetry
---------------------------------------------------------

INSERT INTO TELEMETRY
(
    MISSION_ID,
    SATELLITE_ID,
    COMMAND_ID,
    PARAMETER_NAME,
    PARAMETER_VALUE,
    UNIT,
    QUALITY_FLAG
)
VALUES
(
    (SELECT MISSION_ID FROM MISSION
      WHERE MISSION_CODE='ADITYA_L1'),

    (SELECT SATELLITE_ID FROM SATELLITE
      WHERE SATELLITE_CODE='ADITYA_L1'),

    (SELECT COMMAND_ID FROM COMMAND
      WHERE COMMAND_CODE='CMD-000002'),

    'SOLAR_PANEL_TEMPERATURE',

    73.40,

    'C',

    'GOOD'
);

---------------------------------------------------------

INSERT INTO TELEMETRY
(
    MISSION_ID,
    SATELLITE_ID,
    COMMAND_ID,
    PARAMETER_NAME,
    PARAMETER_VALUE,
    UNIT,
    QUALITY_FLAG
)
VALUES
(
    (SELECT MISSION_ID FROM MISSION
      WHERE MISSION_CODE='ADITYA_L1'),

    (SELECT SATELLITE_ID FROM SATELLITE
      WHERE SATELLITE_CODE='ADITYA_L1'),

    (SELECT COMMAND_ID FROM COMMAND
      WHERE COMMAND_CODE='CMD-000002'),

    'POWER_GENERATION',

    2140,

    'W',

    'GOOD'
);

---------------------------------------------------------
-- Mars Orbiter Mission
---------------------------------------------------------

INSERT INTO TELEMETRY
(
    MISSION_ID,
    SATELLITE_ID,
    COMMAND_ID,
    PARAMETER_NAME,
    PARAMETER_VALUE,
    UNIT,
    QUALITY_FLAG
)
VALUES
(
    (SELECT MISSION_ID FROM MISSION
      WHERE MISSION_CODE='MOM'),

    (SELECT SATELLITE_ID FROM SATELLITE
      WHERE SATELLITE_CODE='MOM'),

    (SELECT COMMAND_ID FROM COMMAND
      WHERE COMMAND_CODE='CMD-000004'),

    'FUEL_LEVEL',

    12.30,

    '%',

    'WARNING'
);

---------------------------------------------------------

INSERT INTO TELEMETRY
(
    MISSION_ID,
    SATELLITE_ID,
    COMMAND_ID,
    PARAMETER_NAME,
    PARAMETER_VALUE,
    UNIT,
    QUALITY_FLAG
)
VALUES
(
    (SELECT MISSION_ID FROM MISSION
      WHERE MISSION_CODE='MOM'),

    (SELECT SATELLITE_ID FROM SATELLITE
      WHERE SATELLITE_CODE='MOM'),

    (SELECT COMMAND_ID FROM COMMAND
      WHERE COMMAND_CODE='CMD-000004'),

    'BATTERY_VOLTAGE',

    21.90,

    'V',

    'CRITICAL'
);

COMMIT;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT TELEMETRY sample data inserted successfully.
PROMPT ===========================================