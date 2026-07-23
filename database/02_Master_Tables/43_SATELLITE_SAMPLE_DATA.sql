/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : SATELLITE
File          : 43_SATELLITE_SAMPLE_DATA.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Inserts sample satellite records using real-world
satellites for demonstration and testing.
=========================================================
*/

---------------------------------------------------------
-- INSAT-3DS
---------------------------------------------------------

INSERT INTO SATELLITE
(
    SATELLITE_CODE,
    SATELLITE_NAME,
    NORAD_ID,
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
    'INSAT_3DS',
    'INSAT-3DS',
    58674,
    'WEATHER',
    'ACTIVE',
    'ISRO',
    'U R Rao Satellite Centre',
    'India',
    'GSLV Mk II',
    'GEO',
    2274,
    1700,
    DATE '2024-02-17',
    10,
    'Meteorological satellite supporting weather forecasting and disaster warning.'
);

---------------------------------------------------------
-- GSAT-30
---------------------------------------------------------

INSERT INTO SATELLITE
(
    SATELLITE_CODE,
    SATELLITE_NAME,
    NORAD_ID,
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
    'GSAT_30',
    'GSAT-30',
    45026,
    'COMMUNICATION',
    'ACTIVE',
    'ISRO',
    'ISRO Satellite Centre',
    'India',
    'Ariane 5',
    'GEO',
    3357,
    6000,
    DATE '2020-01-17',
    15,
    'Communication satellite providing television, telecommunication and VSAT services.'
);

---------------------------------------------------------
-- CARTOSAT-3
---------------------------------------------------------

INSERT INTO SATELLITE
(
    SATELLITE_CODE,
    SATELLITE_NAME,
    NORAD_ID,
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
    'CARTOSAT_3',
    'Cartosat-3',
    44804,
    'EARTH_OBSERVATION',
    'ACTIVE',
    'ISRO',
    'U R Rao Satellite Centre',
    'India',
    'PSLV-XL',
    'SUN_SYNCHRONOUS',
    1625,
    2000,
    DATE '2019-11-27',
    5,
    'High-resolution Earth observation satellite for cartography and strategic applications.'
);

---------------------------------------------------------
-- EOS-06 (Oceansat-3)
---------------------------------------------------------

INSERT INTO SATELLITE
(
    SATELLITE_CODE,
    SATELLITE_NAME,
    NORAD_ID,
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
    'EOS_06',
    'EOS-06',
    54234,
    'SCIENTIFIC',
    'ACTIVE',
    'ISRO',
    'U R Rao Satellite Centre',
    'India',
    'PSLV-C54',
    'SUN_SYNCHRONOUS',
    1117,
    1260,
    DATE '2022-11-26',
    5,
    'Ocean observation satellite for monitoring sea surface, winds and climate.'
);

---------------------------------------------------------
-- RISAT-2B
---------------------------------------------------------

INSERT INTO SATELLITE
(
    SATELLITE_CODE,
    SATELLITE_NAME,
    NORAD_ID,
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
    'RISAT_2B',
    'RISAT-2B',
    44233,
    'EARTH_OBSERVATION',
    'ACTIVE',
    'ISRO',
    'U R Rao Satellite Centre',
    'India',
    'PSLV-C46',
    'SUN_SYNCHRONOUS',
    615,
    1500,
    DATE '2019-05-22',
    5,
    'Radar imaging satellite capable of all-weather day and night Earth observation.'
);

COMMIT;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT SATELLITE sample data inserted successfully.
PROMPT ===========================================