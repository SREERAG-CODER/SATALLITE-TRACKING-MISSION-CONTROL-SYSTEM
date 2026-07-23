/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : SATELLITE
File          : 41_SATELLITE_INDEX.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Creates additional indexes to improve query
performance on the SATELLITE table.
=========================================================
*/

---------------------------------------------------------
-- Drop Indexes (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_SATELLITE_STATUS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_SATELLITE_TYPE';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_SATELLITE_ORBIT';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -1418 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP INDEX IDX_SATELLITE_ACTIVE';
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

CREATE INDEX IDX_SATELLITE_STATUS
ON SATELLITE (STATUS);

CREATE INDEX IDX_SATELLITE_TYPE
ON SATELLITE (SATELLITE_TYPE);

CREATE INDEX IDX_SATELLITE_ORBIT
ON SATELLITE (ORBIT_TYPE);

CREATE INDEX IDX_SATELLITE_ACTIVE
ON SATELLITE (IS_ACTIVE);

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT SATELLITE indexes created successfully.
PROMPT ===========================================