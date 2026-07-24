/*
=========================================================
Project       : Satellite Mission Control System
Module        : Relationship Tables
Object        : MISSION_SATELLITE
File          : 61_MISSION_SATELLITE_INDEX.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Creates additional indexes to improve query
performance on the MISSION_SATELLITE table.
=========================================================
*/

---------------------------------------------------------
-- Drop Indexes (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_MS_MISSION';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_MS_SATELLITE';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_MS_STATUS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_MS_MISSION_STATUS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_MS_SATELLITE_STATUS';
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

CREATE INDEX IDX_MS_MISSION
ON MISSION_SATELLITE (MISSION_ID);

CREATE INDEX IDX_MS_SATELLITE
ON MISSION_SATELLITE (SATELLITE_ID);

CREATE INDEX IDX_MS_STATUS
ON MISSION_SATELLITE (STATUS);

CREATE INDEX IDX_MS_MISSION_STATUS
ON MISSION_SATELLITE (MISSION_ID, STATUS);

CREATE INDEX IDX_MS_SATELLITE_STATUS
ON MISSION_SATELLITE (SATELLITE_ID, STATUS);

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT MISSION_SATELLITE indexes created successfully.
PROMPT ===========================================