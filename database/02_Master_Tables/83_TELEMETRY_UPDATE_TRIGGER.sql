/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Operations
Object        : TELEMETRY
File          : 83_TELEMETRY_UPDATE_TRIGGER.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 24-JUL-2026
=========================================================
Description:
Automatically updates UPDATED_AT whenever
a TELEMETRY record is modified.
=========================================================
*/

---------------------------------------------------------
-- Drop Trigger (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_TELEMETRY_BU';
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

CREATE OR REPLACE TRIGGER TRG_TELEMETRY_BU
BEFORE UPDATE
ON TELEMETRY
FOR EACH ROW
BEGIN

    IF UPDATING THEN
        :NEW.UPDATED_AT := CURRENT_TIMESTAMP;
    END IF;

END;
/

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT TELEMETRY update trigger created successfully.
PROMPT ===========================================