/*
=========================================================
Project       : Satellite Mission Control System
Module        : Relationship Tables
Object        : MISSION_SATELLITE
File          : 60_MISSION_SATELLITE_TRIGGER.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Automatically generates the Mission-Satellite
relationship ID using SEQ_MISSION_SATELLITE
before inserting a new record.
=========================================================
*/

---------------------------------------------------------
-- Drop Trigger (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_MISSION_SATELLITE_BI';
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

CREATE OR REPLACE TRIGGER TRG_MISSION_SATELLITE_BI
BEFORE INSERT
ON MISSION_SATELLITE
FOR EACH ROW
BEGIN
    IF :NEW.MISSION_SATELLITE_ID IS NULL THEN

        SELECT SEQ_MISSION_SATELLITE.NEXTVAL
        INTO :NEW.MISSION_SATELLITE_ID
        FROM DUAL;

    END IF;
END;
/

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT MISSION_SATELLITE trigger created successfully.
PROMPT ===========================================