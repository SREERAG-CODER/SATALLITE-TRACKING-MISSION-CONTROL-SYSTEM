/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Management
Object        : GROUND_STATION
File          : 55_GROUND_STATION_COMMENTS.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Adds descriptive comments to the GROUND_STATION
table and its columns for better documentation
and maintainability.
=========================================================
*/

---------------------------------------------------------
-- Table Comment
---------------------------------------------------------

COMMENT ON TABLE GROUND_STATION IS
'Stores information about ground stations used for satellite communication, telemetry reception, command transmission, and mission support.';

---------------------------------------------------------
-- Column Comments
---------------------------------------------------------

COMMENT ON COLUMN GROUND_STATION.GROUND_STATION_ID IS
'Unique identifier for each ground station.';

COMMENT ON COLUMN GROUND_STATION.STATION_CODE IS
'Unique business code assigned to the ground station.';

COMMENT ON COLUMN GROUND_STATION.STATION_NAME IS
'Official name of the ground station.';

COMMENT ON COLUMN GROUND_STATION.AGENCY IS
'Space agency responsible for operating the ground station.';

COMMENT ON COLUMN GROUND_STATION.COUNTRY IS
'Country where the ground station is located.';

COMMENT ON COLUMN GROUND_STATION.CITY IS
'City in which the ground station is located.';

COMMENT ON COLUMN GROUND_STATION.LATITUDE IS
'Latitude coordinate of the ground station in decimal degrees.';

COMMENT ON COLUMN GROUND_STATION.LONGITUDE IS
'Longitude coordinate of the ground station in decimal degrees.';

COMMENT ON COLUMN GROUND_STATION.ELEVATION_M IS
'Elevation of the ground station above mean sea level in meters.';

COMMENT ON COLUMN GROUND_STATION.TIME_ZONE IS
'Time zone of the ground station location.';

COMMENT ON COLUMN GROUND_STATION.FREQUENCY_BAND IS
'Primary communication frequency band supported by the ground station.';

COMMENT ON COLUMN GROUND_STATION.ANTENNA_COUNT IS
'Number of operational antennas available at the ground station.';

COMMENT ON COLUMN GROUND_STATION.STATUS IS
'Current operational status of the ground station.';

COMMENT ON COLUMN GROUND_STATION.DESCRIPTION IS
'Detailed description of the ground station and its capabilities.';

COMMENT ON COLUMN GROUND_STATION.IS_ACTIVE IS
'Indicates whether the ground station record is active (Y) or inactive (N).';

COMMENT ON COLUMN GROUND_STATION.CREATED_AT IS
'Timestamp when the ground station record was created.';

COMMENT ON COLUMN GROUND_STATION.UPDATED_AT IS
'Timestamp of the most recent update made to the ground station record.';

COMMENT ON COLUMN GROUND_STATION.UPDATED_BY IS
'Application user who last updated the ground station record.';

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT GROUND_STATION comments created successfully.
PROMPT ===========================================

---------------------------------------------------------
-- Verification
---------------------------------------------------------

SELECT COMMENTS
FROM USER_TAB_COMMENTS
WHERE TABLE_NAME = 'GROUND_STATION';

SELECT
    COLUMN_NAME,
    COMMENTS
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'GROUND_STATION'
ORDER BY COLUMN_NAME;