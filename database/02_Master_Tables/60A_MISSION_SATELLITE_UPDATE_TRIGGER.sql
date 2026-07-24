/*
=========================================================
Project       : Satellite Mission Control System
Module        : Relationship Tables
Object        : MISSION_SATELLITE
File          : 60A_MISSION_SATELLITE_UPDATE_TRIGGER.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Automatically updates UPDATED_AT whenever a
MISSION_SATELLITE record is modified.
=========================================================
*/

---------------------------------------------------------
-- Drop Trigger (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_MISSION_SATELLITE_BU';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -4080 THEN
            RAISE;
        END IF;
END;
/

---------------------------------------------------------
-- Create Trigger
---------------------------------------------------------

CREATE OR REPLACE TRIGGER TRG_MISSION_SATELLITE_BU
BEFORE UPDATE
ON MISSION_SATELLITE
FOR EACH ROW
BEGIN
    :NEW.UPDATED_AT := CURRENT_TIMESTAMP;
END;
/

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT MISSION_SATELLITE update trigger created successfully.
PROMPT ===========================================