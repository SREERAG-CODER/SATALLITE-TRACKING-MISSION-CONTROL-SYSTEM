/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : APP_USER
File          : 32_APP_USER_TRIGGER.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Automatically generates the User ID using
SEQ_APP_USER before inserting a new record.
=========================================================
*/

---------------------------------------------------------
-- Drop Trigger (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_APP_USER_BI';
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

CREATE OR REPLACE TRIGGER TRG_APP_USER_BI
BEFORE INSERT
ON APP_USER
FOR EACH ROW
BEGIN
    IF :NEW.USER_ID IS NULL THEN

        SELECT SEQ_APP_USER.NEXTVAL
        INTO :NEW.USER_ID
        FROM DUAL;

    END IF;
END;
/

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT APP_USER trigger created successfully.
PROMPT ===========================================