/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Management
Object        : GROUND_STATION
File          : 53A_GROUND_STATION_UPDATE_TRIGGER.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Automatically updates UPDATED_AT whenever a
GROUND_STATION record is modified.
=========================================================
*/

---------------------------------------------------------
-- Drop Trigger (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_GROUND_STATION_BU';
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

CREATE OR REPLACE TRIGGER TRG_GROUND_STATION_BU
BEFORE UPDATE
ON GROUND_STATION
FOR EACH ROW
BEGIN
    :NEW.UPDATED_AT := CURRENT_TIMESTAMP;
END;
/

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT GROUND_STATION update trigger created successfully.
PROMPT ===========================================  