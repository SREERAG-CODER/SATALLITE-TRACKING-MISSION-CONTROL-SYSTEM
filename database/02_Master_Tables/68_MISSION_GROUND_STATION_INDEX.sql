/*
=========================================================
Project       : Satellite Mission Control System
Module        : Relationship Tables
Object        : MISSION_GROUND_STATION
File          : 68_MISSION_GROUND_STATION_INDEX.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Creates indexes to improve query performance
on the MISSION_GROUND_STATION table.
=========================================================
*/

---------------------------------------------------------
-- Drop Indexes (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_MISSION_GROUND_STATION_MISSION';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_MISSION_GROUND_STATION_GROUND_STATION';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_MISSION_GROUND_STATION_STATUS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_MISSION_GROUND_STATION_MISSION_STATUS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_MISSION_GROUND_STATION_STATION_STATUS';
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

CREATE INDEX IDX_MISSION_GROUND_STATION_MISSION
ON MISSION_GROUND_STATION (MISSION_ID);

CREATE INDEX IDX_MISSION_GROUND_STATION_GROUND_STATION
ON MISSION_GROUND_STATION (GROUND_STATION_ID);

CREATE INDEX IDX_MISSION_GROUND_STATION_STATUS
ON MISSION_GROUND_STATION (STATUS);

CREATE INDEX IDX_MISSION_GROUND_STATION_MISSION_STATUS
ON MISSION_GROUND_STATION (MISSION_ID, STATUS);

CREATE INDEX IDX_MISSION_GROUND_STATION_STATION_STATUS
ON MISSION_GROUND_STATION (GROUND_STATION_ID, STATUS);

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT MISSION_GROUND_STATION indexes created successfully.
PROMPT ===========================================