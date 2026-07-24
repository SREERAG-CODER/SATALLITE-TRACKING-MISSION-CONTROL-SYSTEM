/*
=========================================================
Project       : Satellite Mission Control System
Module        : Relationship Tables
Object        : MISSION_GROUND_STATION
File          : 66_MISSION_GROUND_STATION_TRIGGER.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Automatically generates the Mission-Ground
Station relationship ID using
SEQ_MISSION_GROUND_STATION before inserting
a new record.
=========================================================
*/

---------------------------------------------------------
-- Drop Trigger (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_MGS_BI';
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

CREATE OR REPLACE TRIGGER TRG_MGS_BI
BEFORE INSERT
ON MISSION_GROUND_STATION
FOR EACH ROW
BEGIN
    IF :NEW.MISSION_GROUND_STATION_ID IS NULL THEN

        SELECT SEQ_MISSION_GROUND_STATION.NEXTVAL
        INTO :NEW.MISSION_GROUND_STATION_ID
        FROM DUAL;

    END IF;
END;
/

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT MISSION_GROUND_STATION trigger created successfully.
PROMPT ===========================================