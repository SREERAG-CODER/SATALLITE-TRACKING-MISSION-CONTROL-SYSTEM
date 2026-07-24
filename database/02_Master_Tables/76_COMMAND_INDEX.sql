/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Operations
Object        : COMMAND
File          : 76_COMMAND_INDEX.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 24-JUL-2026
=========================================================
Description:
Creates indexes to improve query performance
for command scheduling, execution,
and monitoring.
=========================================================
*/

---------------------------------------------------------
-- Drop Indexes (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_COMMAND_MISSION';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_COMMAND_SATELLITE';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_COMMAND_STATUS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_COMMAND_PRIORITY';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_COMMAND_SCHEDULED_TIME';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_COMMAND_STATUS_PRIORITY';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_COMMAND_MISSION_STATUS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_COMMAND_SATELLITE_STATUS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

---------------------------------------------------------
-- Create Indexes
---------------------------------------------------------

CREATE INDEX IDX_COMMAND_MISSION
ON COMMAND (MISSION_ID);

CREATE INDEX IDX_COMMAND_SATELLITE
ON COMMAND (SATELLITE_ID);

CREATE INDEX IDX_COMMAND_STATUS
ON COMMAND (STATUS);

CREATE INDEX IDX_COMMAND_PRIORITY
ON COMMAND (PRIORITY);

CREATE INDEX IDX_COMMAND_SCHEDULED_TIME
ON COMMAND (SCHEDULED_TIME);

CREATE INDEX IDX_COMMAND_STATUS_PRIORITY
ON COMMAND (STATUS, PRIORITY);

CREATE INDEX IDX_COMMAND_MISSION_STATUS
ON COMMAND (MISSION_ID, STATUS);

CREATE INDEX IDX_COMMAND_SATELLITE_STATUS
ON COMMAND (SATELLITE_ID, STATUS);

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT COMMAND indexes created successfully.
PROMPT ===========================================