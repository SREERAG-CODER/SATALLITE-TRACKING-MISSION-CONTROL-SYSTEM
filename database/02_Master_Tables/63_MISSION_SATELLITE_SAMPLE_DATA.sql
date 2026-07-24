/*
=========================================================
Project       : Satellite Mission Control System
Module        : Relationship Tables
Object        : MISSION_SATELLITE
File          : 63_MISSION_SATELLITE_SAMPLE_DATA.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Inserts sample mission-satellite relationship
records using real-world mission assignments.
=========================================================
*/

---------------------------------------------------------
-- Chandrayaan-3
---------------------------------------------------------

INSERT INTO MISSION_SATELLITE
(
    MISSION_ID,
    SATELLITE_ID,
    ROLE_IN_MISSION,
    JOIN_DATE,
    STATUS,
    REMARKS
)
VALUES
(
    (SELECT MISSION_ID
       FROM MISSION
      WHERE MISSION_CODE = 'CH3'),

    (SELECT SATELLITE_ID
       FROM SATELLITE
      WHERE SATELLITE_CODE = 'CH3_PM'),

    'PRIMARY',

    DATE '2023-07-14',

    'COMPLETED',

    'Primary spacecraft assigned to Chandrayaan-3 mission.'
);

---------------------------------------------------------
-- Aditya-L1
---------------------------------------------------------

INSERT INTO MISSION_SATELLITE
(
    MISSION_ID,
    SATELLITE_ID,
    ROLE_IN_MISSION,
    JOIN_DATE,
    STATUS,
    REMARKS
)
VALUES
(
    (SELECT MISSION_ID
       FROM MISSION
      WHERE MISSION_CODE = 'ADITYA_L1'),

    (SELECT SATELLITE_ID
       FROM SATELLITE
      WHERE SATELLITE_CODE = 'ADITYA_L1'),

    'SCIENTIFIC',

    DATE '2023-09-02',

    'ACTIVE',

    'Solar observation spacecraft.'
);

---------------------------------------------------------
-- Mars Orbiter Mission
---------------------------------------------------------

INSERT INTO MISSION_SATELLITE
(
    MISSION_ID,
    SATELLITE_ID,
    ROLE_IN_MISSION,
    JOIN_DATE,
    LEAVE_DATE,
    STATUS,
    REMARKS
)
VALUES
(
    (SELECT MISSION_ID
       FROM MISSION
      WHERE MISSION_CODE = 'MOM'),

    (SELECT SATELLITE_ID
       FROM SATELLITE
      WHERE SATELLITE_CODE = 'MOM'),

    'SCIENTIFIC',

    DATE '2013-11-05',

    DATE '2022-10-02',

    'COMPLETED',

    'Mars Orbiter Mission completed successfully.'
);

---------------------------------------------------------
-- XPoSat
---------------------------------------------------------

INSERT INTO MISSION_SATELLITE
(
    MISSION_ID,
    SATELLITE_ID,
    ROLE_IN_MISSION,
    JOIN_DATE,
    STATUS,
    REMARKS
)
VALUES
(
    (SELECT MISSION_ID
       FROM MISSION
      WHERE MISSION_CODE = 'XPOSAT'),

    (SELECT SATELLITE_ID
       FROM SATELLITE
      WHERE SATELLITE_CODE = 'XPOSAT'),

    'SCIENTIFIC',

    DATE '2024-01-01',

    'ACTIVE',

    'Primary X-ray polarimetry satellite.'
);

---------------------------------------------------------
-- Gaganyaan
---------------------------------------------------------

INSERT INTO MISSION_SATELLITE
(
    MISSION_ID,
    SATELLITE_ID,
    ROLE_IN_MISSION,
    JOIN_DATE,
    STATUS,
    REMARKS
)
VALUES
(
    (SELECT MISSION_ID
       FROM MISSION
      WHERE MISSION_CODE = 'GAGANYAAN'),

    (SELECT SATELLITE_ID
       FROM SATELLITE
      WHERE SATELLITE_CODE = 'GAGANYAAN_SM'),

    'SUPPORT',

    DATE '2027-01-01',

    'ACTIVE',

    'Service module supporting the Gaganyaan mission.'
);

COMMIT;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT MISSION_SATELLITE sample data inserted successfully.
PROMPT ===========================================