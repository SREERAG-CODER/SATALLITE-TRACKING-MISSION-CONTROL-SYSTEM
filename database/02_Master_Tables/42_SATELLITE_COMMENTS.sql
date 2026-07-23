/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : SATELLITE
File          : 42_SATELLITE_COMMENTS.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Adds descriptive comments to the SATELLITE table
and its columns for better documentation and
maintainability.
=========================================================
*/

---------------------------------------------------------
-- Table Comment
---------------------------------------------------------

COMMENT ON TABLE SATELLITE IS
'Stores master information about satellites managed by the Satellite Mission Control System.';

---------------------------------------------------------
-- Column Comments
---------------------------------------------------------

COMMENT ON COLUMN SATELLITE.SATELLITE_ID IS
'Unique identifier for each satellite.';

COMMENT ON COLUMN SATELLITE.SATELLITE_CODE IS
'Unique business code assigned to the satellite.';

COMMENT ON COLUMN SATELLITE.SATELLITE_NAME IS
'Official name of the satellite.';

COMMENT ON COLUMN SATELLITE.NORAD_ID IS
'International NORAD catalog number of the satellite.';

COMMENT ON COLUMN SATELLITE.SATELLITE_TYPE IS
'Category of the satellite such as Communication, Earth Observation, Navigation, Scientific, Weather, or Military.';

COMMENT ON COLUMN SATELLITE.STATUS IS
'Current operational status of the satellite.';

COMMENT ON COLUMN SATELLITE.OPERATOR IS
'Organization responsible for operating the satellite.';

COMMENT ON COLUMN SATELLITE.MANUFACTURER IS
'Organization that manufactured the satellite.';

COMMENT ON COLUMN SATELLITE.COUNTRY IS
'Country owning or operating the satellite.';

COMMENT ON COLUMN SATELLITE.LAUNCH_VEHICLE IS
'Launch vehicle used to place the satellite into orbit.';

COMMENT ON COLUMN SATELLITE.ORBIT_TYPE IS
'Orbital classification of the satellite.';

COMMENT ON COLUMN SATELLITE.MASS_KG IS
'Launch mass of the satellite measured in kilograms.';

COMMENT ON COLUMN SATELLITE.POWER_W IS
'Available onboard electrical power measured in watts.';

COMMENT ON COLUMN SATELLITE.LAUNCH_DATE IS
'Date on which the satellite was launched.';

COMMENT ON COLUMN SATELLITE.EXPECTED_LIFE_YEARS IS
'Expected operational lifetime of the satellite in years.';

COMMENT ON COLUMN SATELLITE.DESCRIPTION IS
'Detailed description of the satellite and its mission objectives.';

COMMENT ON COLUMN SATELLITE.IS_ACTIVE IS
'Indicates whether the satellite record is active (Y) or inactive (N).';

COMMENT ON COLUMN SATELLITE.CREATED_AT IS
'Timestamp when the satellite record was created.';

COMMENT ON COLUMN SATELLITE.UPDATED_AT IS
'Timestamp of the most recent update made to the satellite record.';

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT SATELLITE comments created successfully.
PROMPT ===========================================

---------------------------------------------------------
-- Verification
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