/*
=========================================================
Project       : Satellite Mission Control System
Module        : Relationship Tables
Object        : MISSION_GROUND_STATION
File          : 69_MISSION_GROUND_STATION_COMMENTS.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Adds descriptive comments to the
MISSION_GROUND_STATION table and its columns
for better documentation and maintainability.
=========================================================
*/

---------------------------------------------------------
-- Table Comment
---------------------------------------------------------

COMMENT ON TABLE MISSION_GROUND_STATION IS
'Stores the relationship between missions and ground stations, including station role, supported operations, assignment period, and operational status.';

---------------------------------------------------------
-- Column Comments
---------------------------------------------------------

COMMENT ON COLUMN MISSION_GROUND_STATION.MISSION_GROUND_STATION_ID IS
'Unique identifier for each mission-ground station relationship.';

COMMENT ON COLUMN MISSION_GROUND_STATION.MISSION_ID IS
'Reference to the associated mission.';

COMMENT ON COLUMN MISSION_GROUND_STATION.GROUND_STATION_ID IS
'Reference to the associated ground station.';

COMMENT ON COLUMN MISSION_GROUND_STATION.STATION_ROLE IS
'Role performed by the ground station within the mission.';

COMMENT ON COLUMN MISSION_GROUND_STATION.OPERATION_TYPE IS
'Primary operation supported by the ground station for the mission.';

COMMENT ON COLUMN MISSION_GROUND_STATION.ASSIGNMENT_START_DATE IS
'Date on which the ground station began supporting the mission.';

COMMENT ON COLUMN MISSION_GROUND_STATION.ASSIGNMENT_END_DATE IS
'Date on which the ground station stopped supporting the mission.';

COMMENT ON COLUMN MISSION_GROUND_STATION.STATUS IS
'Current assignment status of the ground station for the mission.';

COMMENT ON COLUMN MISSION_GROUND_STATION.REMARKS IS
'Additional notes regarding the mission-ground station assignment.';

COMMENT ON COLUMN MISSION_GROUND_STATION.CREATED_AT IS
'Timestamp when the assignment record was created.';

COMMENT ON COLUMN MISSION_GROUND_STATION.UPDATED_AT IS
'Timestamp of the most recent update made to the assignment record.';

COMMENT ON COLUMN MISSION_GROUND_STATION.UPDATED_BY IS
'Application user who last updated the assignment record.';

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT MISSION_GROUND_STATION comments created successfully.
PROMPT ===========================================

---------------------------------------------------------
-- Verification
---------------------------------------------------------

SELECT COMMENTS
FROM USER_TAB_COMMENTS
WHERE TABLE_NAME = 'MISSION_GROUND_STATION';

SELECT
    COLUMN_NAME,
    COMMENTS
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'MISSION_GROUND_STATION'
ORDER BY COLUMN_NAME;