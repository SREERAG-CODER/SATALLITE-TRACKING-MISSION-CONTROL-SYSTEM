/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Operations
Object        : COMMAND
File          : 77_COMMAND_COMMENTS.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 24-JUL-2026
=========================================================
Description:
Adds descriptive comments to the COMMAND
table and its columns for documentation
and maintainability.
=========================================================
*/

---------------------------------------------------------
-- Table Comment
---------------------------------------------------------

COMMENT ON TABLE COMMAND IS
'Stores operational commands transmitted to satellites, including scheduling, approval, execution lifecycle, acknowledgements, and execution results.';

---------------------------------------------------------
-- Column Comments
---------------------------------------------------------

COMMENT ON COLUMN COMMAND.COMMAND_ID IS
'Unique identifier for each command.';

COMMENT ON COLUMN COMMAND.COMMAND_CODE IS
'Business identifier used to uniquely identify the command.';

COMMENT ON COLUMN COMMAND.MISSION_ID IS
'Reference to the mission associated with the command.';

COMMENT ON COLUMN COMMAND.SATELLITE_ID IS
'Reference to the target satellite that receives the command.';

COMMENT ON COLUMN COMMAND.MISSION_GROUND_STATION_ID IS
'Reference to the mission-ground station responsible for transmitting the command.';

COMMENT ON COLUMN COMMAND.COMMAND_NAME IS
'Human-readable name of the command.';

COMMENT ON COLUMN COMMAND.COMMAND_TYPE IS
'Functional category of the command.';

COMMENT ON COLUMN COMMAND.COMMAND_PAYLOAD IS
'Complete command payload transmitted to the satellite.';

COMMENT ON COLUMN COMMAND.PRIORITY IS
'Execution priority of the command, where 1 is the highest priority and 5 is the lowest.';

COMMENT ON COLUMN COMMAND.STATUS IS
'Current lifecycle status of the command.';

COMMENT ON COLUMN COMMAND.SCHEDULED_TIME IS
'Scheduled date and time for command transmission.';

COMMENT ON COLUMN COMMAND.TRANSMITTED_TIME IS
'Actual date and time when the command was transmitted.';

COMMENT ON COLUMN COMMAND.ACKNOWLEDGED_TIME IS
'Date and time when acknowledgement was received from the satellite.';

COMMENT ON COLUMN COMMAND.EXECUTED_TIME IS
'Date and time when command execution completed.';

COMMENT ON COLUMN COMMAND.RETRY_COUNT IS
'Number of transmission retry attempts performed for the command.';

COMMENT ON COLUMN COMMAND.TIMEOUT_SECONDS IS
'Maximum allowed waiting time for acknowledgement before the command times out.';

COMMENT ON COLUMN COMMAND.IS_ACKNOWLEDGED IS
'Indicates whether acknowledgement has been received from the satellite.';

COMMENT ON COLUMN COMMAND.EXECUTION_RESULT IS
'Detailed execution response, output, or error information returned after command execution.';

COMMENT ON COLUMN COMMAND.APPROVED_BY IS
'Application user who approved the command for execution.';

COMMENT ON COLUMN COMMAND.CREATED_AT IS
'Timestamp when the command record was created.';

COMMENT ON COLUMN COMMAND.UPDATED_AT IS
'Timestamp of the most recent modification made to the command.';

COMMENT ON COLUMN COMMAND.UPDATED_BY IS
'Application user who last modified the command record.';

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT COMMAND comments created successfully.
PROMPT ===========================================

---------------------------------------------------------
-- Verification
---------------------------------------------------------

SELECT COMMENTS
FROM USER_TAB_COMMENTS
WHERE TABLE_NAME = 'COMMAND';

SELECT
    COLUMN_NAME,
    COMMENTS
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'COMMAND'
ORDER BY COLUMN_NAME;