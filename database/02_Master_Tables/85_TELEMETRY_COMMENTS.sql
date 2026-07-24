/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Operations
Object        : TELEMETRY
File          : 85_TELEMETRY_COMMENTS.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 24-JUL-2026
=========================================================
Description:
Adds descriptive comments to the TELEMETRY
table and its columns for documentation
and maintainability.
=========================================================
*/

---------------------------------------------------------
-- Table Comment
---------------------------------------------------------

COMMENT ON TABLE TELEMETRY IS
'Stores telemetry data received from satellites for mission monitoring, analysis, and command verification.';

---------------------------------------------------------
-- Column Comments
---------------------------------------------------------

COMMENT ON COLUMN TELEMETRY.TELEMETRY_ID IS
'Unique identifier for each telemetry record.';

COMMENT ON COLUMN TELEMETRY.MISSION_ID IS
'Reference to the mission associated with the telemetry data.';

COMMENT ON COLUMN TELEMETRY.SATELLITE_ID IS
'Reference to the satellite that generated the telemetry.';

COMMENT ON COLUMN TELEMETRY.COMMAND_ID IS
'Optional reference to the command associated with this telemetry record.';

COMMENT ON COLUMN TELEMETRY.PARAMETER_NAME IS
'Name of the telemetry parameter being reported.';

COMMENT ON COLUMN TELEMETRY.PARAMETER_VALUE IS
'Measured numeric value of the telemetry parameter.';

COMMENT ON COLUMN TELEMETRY.UNIT IS
'Measurement unit of the telemetry parameter.';

COMMENT ON COLUMN TELEMETRY.QUALITY_FLAG IS
'Indicates the quality or validity of the telemetry measurement.';

COMMENT ON COLUMN TELEMETRY.SOURCE IS
'Origin of the telemetry data, such as SATELLITE or SIMULATOR.';

COMMENT ON COLUMN TELEMETRY.RECORDED_AT IS
'Timestamp when the telemetry measurement was recorded.';

COMMENT ON COLUMN TELEMETRY.CREATED_AT IS
'Timestamp when the telemetry record was inserted into the database.';

COMMENT ON COLUMN TELEMETRY.UPDATED_AT IS
'Timestamp of the most recent modification to the telemetry record.';

COMMENT ON COLUMN TELEMETRY.UPDATED_BY IS
'Application user who last modified the telemetry record.';

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT TELEMETRY comments created successfully.
PROMPT ===========================================

---------------------------------------------------------
-- Verification
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