/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : SYSTEM_PERMISSION
File          : 24_SYSTEM_PERMISSION_TRIGGER.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Automatically generates the Permission ID using
SEQ_SYSTEM_PERMISSION before inserting a new record.
=========================================================
*/

---------------------------------------------------------
-- Drop Trigger (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_SYSTEM_PERMISSION_BI';
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

CREATE OR REPLACE TRIGGER TRG_SYSTEM_PERMISSION_BI
BEFORE INSERT
ON SYSTEM_PERMISSION
FOR EACH ROW
BEGIN
    IF :NEW.PERMISSION_ID IS NULL THEN

        SELECT SEQ_SYSTEM_PERMISSION.NEXTVAL
        INTO :NEW.PERMISSION_ID
        FROM DUAL;

    END IF;
END;
/

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT SYSTEM_PERMISSION trigger created successfully.
PROMPT ===========================================