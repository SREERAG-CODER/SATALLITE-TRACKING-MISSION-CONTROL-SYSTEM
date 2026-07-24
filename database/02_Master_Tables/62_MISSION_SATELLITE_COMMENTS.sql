/*
=========================================================
Project       : Satellite Mission Control System
Module        : Relationship Tables
Object        : MISSION_SATELLITE
File          : 62_MISSION_SATELLITE_COMMENTS.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Adds descriptive comments to the
MISSION_SATELLITE table and its columns
for better documentation and maintainability.
=========================================================
*/

---------------------------------------------------------
-- Table Comment
---------------------------------------------------------

COMMENT ON TABLE MISSION_SATELLITE IS
'Stores the relationship between missions and satellites, including each satellite''s role, participation period, and operational status within a mission.';

---------------------------------------------------------
-- Column Comments
---------------------------------------------------------

COMMENT ON COLUMN MISSION_SATELLITE.MISSION_SATELLITE_ID IS
'Unique identifier for each mission-satellite relationship.';

COMMENT ON COLUMN MISSION_SATELLITE.MISSION_ID IS
'Reference to the associated mission.';

COMMENT ON COLUMN MISSION_SATELLITE.SATELLITE_ID IS
'Reference to the associated satellite.';

COMMENT ON COLUMN MISSION_SATELLITE.ROLE_IN_MISSION IS
'Functional role of the satellite within the mission.';

COMMENT ON COLUMN MISSION_SATELLITE.JOIN_DATE IS
'Date on which the satellite became part of the mission.';

COMMENT ON COLUMN MISSION_SATELLITE.LEAVE_DATE IS
'Date on which the satellite completed or ended its participation in the mission.';

COMMENT ON COLUMN MISSION_SATELLITE.STATUS IS
'Current participation status of the satellite in the mission.';

COMMENT ON COLUMN MISSION_SATELLITE.REMARKS IS
'Additional notes regarding the satellite''s participation in the mission.';

COMMENT ON COLUMN MISSION_SATELLITE.CREATED_AT IS
'Timestamp when the relationship record was created.';

COMMENT ON COLUMN MISSION_SATELLITE.UPDATED_AT IS
'Timestamp of the most recent update made to the relationship record.';

COMMENT ON COLUMN MISSION_SATELLITE.UPDATED_BY IS
'Application user who last updated the relationship record.';

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT MISSION_SATELLITE comments created successfully.
PROMPT ===========================================

---------------------------------------------------------
-- Verification
---------------------------------------------------------

SELECT COMMENTS
FROM USER_TAB_COMMENTS
WHERE TABLE_NAME = 'MISSION_SATELLITE';

SELECT
    COLUMN_NAME,
    COMMENTS
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'MISSION_SATELLITE'
ORDER BY COLUMN_NAME;