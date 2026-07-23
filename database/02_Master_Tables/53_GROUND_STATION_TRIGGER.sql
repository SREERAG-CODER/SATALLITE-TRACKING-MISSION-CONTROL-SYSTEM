/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Management
Object        : GROUND_STATION
File          : 53_GROUND_STATION_TRIGGER.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Automatically generates the Ground Station ID
using SEQ_GROUND_STATION before inserting a
new record.
=========================================================
*/

---------------------------------------------------------
-- Drop Trigger (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_GROUND_STATION_BI';
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

CREATE OR REPLACE TRIGGER TRG_GROUND_STATION_BI
BEFORE INSERT
ON GROUND_STATION
FOR EACH ROW
BEGIN
    IF :NEW.GROUND_STATION_ID IS NULL THEN

        SELECT SEQ_GROUND_STATION.NEXTVAL
        INTO :NEW.GROUND_STATION_ID
        FROM DUAL;

    END IF;
END;
/

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT GROUND_STATION trigger created successfully.
PROMPT ===========================================