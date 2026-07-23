/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Management
Object        : GROUND_STATION
File          : 54_GROUND_STATION_INDEX.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Creates additional indexes to improve query
performance on the GROUND_STATION table.
=========================================================
*/

---------------------------------------------------------
-- Drop Indexes (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_GS_STATUS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_GS_COUNTRY';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_GS_STATUS_ACTIVE';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_GS_COUNTRY_STATUS';
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

CREATE INDEX IDX_GS_STATUS
ON GROUND_STATION (STATUS);

CREATE INDEX IDX_GS_COUNTRY
ON GROUND_STATION (COUNTRY);

CREATE INDEX IDX_GS_STATUS_ACTIVE
ON GROUND_STATION (STATUS, IS_ACTIVE);

CREATE INDEX IDX_GS_COUNTRY_STATUS
ON GROUND_STATION (COUNTRY, STATUS);

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT GROUND_STATION indexes created successfully.
PROMPT ===========================================