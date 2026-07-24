/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Operations
Object        : TELEMETRY
File          : 82_TELEMETRY_TRIGGER.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 24-JUL-2026
=========================================================
Description:
Automatically generates the Telemetry ID
using SEQ_TELEMETRY before inserting
a new telemetry record.
=========================================================
*/

---------------------------------------------------------
-- Drop Trigger (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_TELEMETRY_BI';
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

CREATE OR REPLACE TRIGGER TRG_TELEMETRY_BI
BEFORE INSERT
ON TELEMETRY
FOR EACH ROW
BEGIN

    -----------------------------------------------------
    -- Generate Primary Key
    -----------------------------------------------------

    IF :NEW.TELEMETRY_ID IS NULL THEN

        SELECT SEQ_TELEMETRY.NEXTVAL
        INTO :NEW.TELEMETRY_ID
        FROM DUAL;

    END IF;

    -----------------------------------------------------
    -- Set Creation Timestamp
    -----------------------------------------------------

    IF :NEW.CREATED_AT IS NULL THEN
        :NEW.CREATED_AT := CURRENT_TIMESTAMP;
    END IF;

    -----------------------------------------------------
    -- Set Recorded Timestamp
    -----------------------------------------------------

    IF :NEW.RECORDED_AT IS NULL THEN
        :NEW.RECORDED_AT := CURRENT_TIMESTAMP;
    END IF;

    -----------------------------------------------------
    -- Default Quality Flag
    -----------------------------------------------------

    IF :NEW.QUALITY_FLAG IS NULL THEN
        :NEW.QUALITY_FLAG := 'GOOD';
    END IF;

    -----------------------------------------------------
    -- Default Source
    -----------------------------------------------------

    IF :NEW.SOURCE IS NULL THEN
        :NEW.SOURCE := 'SATELLITE';
    END IF;

END;
/

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT TELEMETRY trigger created successfully.
PROMPT ===========================================