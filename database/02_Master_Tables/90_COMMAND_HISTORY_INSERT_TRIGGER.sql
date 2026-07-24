/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Operations
Object        : COMMAND_HISTORY
File          : 90_COMMAND_HISTORY_INSERT_TRIGGER.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 24-JUL-2026
=========================================================
Description:
Automatically generates the Command History ID
and initializes audit timestamps before
inserting a new history record.
=========================================================
*/

---------------------------------------------------------
-- Drop Trigger (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_COMMAND_HISTORY_BI';
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

CREATE OR REPLACE TRIGGER TRG_COMMAND_HISTORY_BI
BEFORE INSERT
ON COMMAND_HISTORY
FOR EACH ROW
BEGIN

    -----------------------------------------------------
    -- Generate Primary Key
    -----------------------------------------------------

    IF :NEW.COMMAND_HISTORY_ID IS NULL THEN

        SELECT SEQ_COMMAND_HISTORY.NEXTVAL
        INTO :NEW.COMMAND_HISTORY_ID
        FROM DUAL;

    END IF;

    -----------------------------------------------------
    -- Creation Timestamp
    -----------------------------------------------------

    IF :NEW.CREATED_AT IS NULL THEN
        :NEW.CREATED_AT := CURRENT_TIMESTAMP;
    END IF;

    -----------------------------------------------------
    -- Change Timestamp
    -----------------------------------------------------

    IF :NEW.CHANGED_AT IS NULL THEN
        :NEW.CHANGED_AT := CURRENT_TIMESTAMP;
    END IF;

END;
/

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT COMMAND_HISTORY insert trigger created successfully.
PROMPT ===========================================