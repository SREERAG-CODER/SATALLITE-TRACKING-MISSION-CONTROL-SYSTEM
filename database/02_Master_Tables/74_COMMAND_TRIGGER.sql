/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Operations
Object        : COMMAND
File          : 74_COMMAND_TRIGGER.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 24-JUL-2026
=========================================================
Description:
Automatically generates the Command ID
using SEQ_COMMAND before inserting
a new command.
=========================================================
*/

---------------------------------------------------------
-- Drop Trigger (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_COMMAND_BI';
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

CREATE OR REPLACE TRIGGER TRG_COMMAND_BI
BEFORE INSERT
ON COMMAND
FOR EACH ROW
BEGIN
    IF :NEW.COMMAND_ID IS NULL THEN

        SELECT SEQ_COMMAND.NEXTVAL
        INTO :NEW.COMMAND_ID
        FROM DUAL;

    END IF;

    IF :NEW.CREATED_AT IS NULL THEN
        :NEW.CREATED_AT := CURRENT_TIMESTAMP;
    END IF;

    IF :NEW.RETRY_COUNT IS NULL THEN
        :NEW.RETRY_COUNT := 0;
    END IF;

    IF :NEW.IS_ACKNOWLEDGED IS NULL THEN
        :NEW.IS_ACKNOWLEDGED := 'N';
    END IF;
END;
/

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT COMMAND trigger created successfully.
PROMPT ===========================================