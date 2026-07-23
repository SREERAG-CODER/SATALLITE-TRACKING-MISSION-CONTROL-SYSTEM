/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : SYSTEM_MODULE
File          : 17_SYSTEM_MODULE_TRIGGER.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Automatically generates the Module ID using
SEQ_SYSTEM_MODULE before inserting a new record.
=========================================================
*/

---------------------------------------------------------
-- Drop Trigger (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_SYSTEM_MODULE_BI';
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

CREATE OR REPLACE TRIGGER TRG_SYSTEM_MODULE_BI
BEFORE INSERT
ON SYSTEM_MODULE
FOR EACH ROW
BEGIN
    IF :NEW.MODULE_ID IS NULL THEN

        SELECT SEQ_SYSTEM_MODULE.NEXTVAL
        INTO :NEW.MODULE_ID
        FROM DUAL;

    END IF;
END;
/

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT SYSTEM_MODULE trigger created successfully.
PROMPT ===========================================