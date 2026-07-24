/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Management
Object        : GROUND_STATION
File          : 56_GROUND_STATION_SAMPLE_DATA.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Inserts sample ground station records using
real-world ground stations for demonstration
and testing.
=========================================================
*/

---------------------------------------------------------
-- ISTRAC Bengaluru
---------------------------------------------------------

INSERT INTO GROUND_STATION
(
    STATION_CODE,
    STATION_NAME,
    AGENCY,
    COUNTRY,
    CITY,
    LATITUDE,
    LONGITUDE,
    ELEVATION_M,
    TIME_ZONE,
    FREQUENCY_BAND,
    ANTENNA_COUNT,
    STATUS,
    DESCRIPTION
)
VALUES
(
    'ISTRAC_BLR',
    'ISTRAC Bengaluru',
    'ISRO',
    'India',
    'Bengaluru',
    13.035800,
    77.511600,
    920,
    'Asia/Kolkata',
    'S,X',
    6,
    'ACTIVE',
    'Primary mission operations and satellite tracking centre of ISRO.'
);

---------------------------------------------------------
-- SDSC SHAR
---------------------------------------------------------

INSERT INTO GROUND_STATION
(
    STATION_CODE,
    STATION_NAME,
    AGENCY,
    COUNTRY,
    CITY,
    LATITUDE,
    LONGITUDE,
    ELEVATION_M,
    TIME_ZONE,
    FREQUENCY_BAND,
    ANTENNA_COUNT,
    STATUS,
    DESCRIPTION
)
VALUES
(
    'SDSC_SHAR',
    'Satish Dhawan Space Centre',
    'ISRO',
    'India',
    'Sriharikota',
    13.719900,
    80.230400,
    16,
    'Asia/Kolkata',
    'S,C,X',
    8,
    'ACTIVE',
    'Primary launch centre and mission support facility of ISRO.'
);

---------------------------------------------------------
-- Indian Deep Space Network
---------------------------------------------------------

INSERT INTO GROUND_STATION
(
    STATION_CODE,
    STATION_NAME,
    AGENCY,
    COUNTRY,
    CITY,
    LATITUDE,
    LONGITUDE,
    ELEVATION_M,
    TIME_ZONE,
    FREQUENCY_BAND,
    ANTENNA_COUNT,
    STATUS,
    DESCRIPTION
)
VALUES
(
    'IDSN_BYALALU',
    'Indian Deep Space Network',
    'ISRO',
    'India',
    'Byalalu',
    12.901100,
    77.474000,
    884,
    'Asia/Kolkata',
    'S,X,Ka',
    3,
    'ACTIVE',
    'Deep space communication facility supporting lunar, Mars and solar missions.'
);

---------------------------------------------------------
-- Canberra Deep Space Communication Complex
---------------------------------------------------------

INSERT INTO GROUND_STATION
(
    STATION_CODE,
    STATION_NAME,
    AGENCY,
    COUNTRY,
    CITY,
    LATITUDE,
    LONGITUDE,
    ELEVATION_M,
    TIME_ZONE,
    FREQUENCY_BAND,
    ANTENNA_COUNT,
    STATUS,
    DESCRIPTION
)
VALUES
(
    'CDSCC',
    'Canberra Deep Space Communication Complex',
    'NASA',
    'Australia',
    'Canberra',
    -35.401000,
    148.981000,
    690,
    'Australia/Sydney',
    'S,X,Ka',
    6,
    'ACTIVE',
    'Part of NASA''s Deep Space Network supporting interplanetary missions.'
);

---------------------------------------------------------
-- Goldstone Deep Space Communications Complex
---------------------------------------------------------

INSERT INTO GROUND_STATION
(
    STATION_CODE,
    STATION_NAME,
    AGENCY,
    COUNTRY,
    CITY,
    LATITUDE,
    LONGITUDE,
    ELEVATION_M,
    TIME_ZONE,
    FREQUENCY_BAND,
    ANTENNA_COUNT,
    STATUS,
    DESCRIPTION
)
VALUES
(
    'GDSCC',
    'Goldstone Deep Space Communications Complex',
    'NASA',
    'United States',
    'Barstow',
    35.247200,
    -116.793300,
    1006,
    'America/Los_Angeles',
    'S,X,Ka',
    7,
    'ACTIVE',
    'NASA Deep Space Network facility providing communication with deep space missions.'
);

---------------------------------------------------------
-- ESA Cebreros
---------------------------------------------------------

INSERT INTO GROUND_STATION
(
    STATION_CODE,
    STATION_NAME,
    AGENCY,
    COUNTRY,
    CITY,
    LATITUDE,
    LONGITUDE,
    ELEVATION_M,
    TIME_ZONE,
    FREQUENCY_BAND,
    ANTENNA_COUNT,
    STATUS,
    DESCRIPTION
)
VALUES
(
    'CEBREROS',
    'ESA Cebreros Deep Space Station',
    'ESA',
    'Spain',
    'Cebreros',
    40.452700,
    -4.367600,
    794,
    'Europe/Madrid',
    'X,Ka',
    2,
    'ACTIVE',
    'European Space Agency deep space communication facility.'
);

COMMIT;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT GROUND_STATION sample data inserted successfully.
PROMPT ===========================================