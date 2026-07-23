/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Management
Object        : MISSION
File          : 49_MISSION_COMMENTS.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Adds descriptive comments to the MISSION table
and its columns for better documentation and
maintainability.
=========================================================
*/

---------------------------------------------------------
-- Table Comment
---------------------------------------------------------

COMMENT ON TABLE MISSION IS
'Stores information about space missions managed by the Satellite Mission Control System.';

---------------------------------------------------------
-- Column Comments
---------------------------------------------------------

COMMENT ON COLUMN MISSION.MISSION_ID IS
'Unique identifier for each mission.';

COMMENT ON COLUMN MISSION.MISSION_CODE IS
'Unique business code assigned to the mission.';

COMMENT ON COLUMN MISSION.MISSION_NAME IS
'Official name of the mission.';

COMMENT ON COLUMN MISSION.MISSION_TYPE IS
'Category of the mission.';

COMMENT ON COLUMN MISSION.STATUS IS
'Current lifecycle status of the mission.';

COMMENT ON COLUMN MISSION.AGENCY IS
'Space agency responsible for the mission.';

COMMENT ON COLUMN MISSION.MISSION_DIRECTOR IS
'Person responsible for directing the mission.';

COMMENT ON COLUMN MISSION.OBJECTIVE IS
'Primary objective of the mission.';

COMMENT ON COLUMN MISSION.TARGET IS
'Primary target or destination of the mission.';

COMMENT ON COLUMN MISSION.LAUNCH_SITE IS
'Location from which the mission is launched.';

COMMENT ON COLUMN MISSION.PLANNED_LAUNCH_DATE IS
'Scheduled launch date.';

COMMENT ON COLUMN MISSION.ACTUAL_LAUNCH_DATE IS
'Actual launch date.';

COMMENT ON COLUMN MISSION.MISSION_END_DATE IS
'Date when the mission ended.';

COMMENT ON COLUMN MISSION.MISSION_DURATION_DAYS IS
'Total mission duration in days.';

COMMENT ON COLUMN MISSION.BUDGET_USD IS
'Estimated mission budget in US dollars.';

COMMENT ON COLUMN MISSION.DESCRIPTION IS
'Detailed description of the mission.';

COMMENT ON COLUMN MISSION.IS_ACTIVE IS
'Indicates whether the mission record is active (Y) or inactive (N).';

COMMENT ON COLUMN MISSION.CREATED_AT IS
'Timestamp when the mission record was created.';

COMMENT ON COLUMN MISSION.UPDATED_AT IS
'Timestamp of the most recent update made to the mission record.';

COMMENT ON COLUMN MISSION.UPDATED_BY IS
'Application user who last updated the mission record.';

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT MISSION comments created successfully.
PROMPT ===========================================

---------------------------------------------------------
-- Verification
---------------------------------------------------------

SELECT COMMENTS
FROM USER_TAB_COMMENTS
WHERE TABLE_NAME = 'MISSION';

SELECT
    COLUMN_NAME,
    COMMENTS
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'MISSION'
ORDER BY COLUMN_NAME;