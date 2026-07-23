/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : APP_ROLE
File          : 10_APP_ROLE_TRIGGER.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Automatically generates the Application Role ID
using SEQ_APP_ROLE before inserting a new record.
=========================================================
*/

---------------------------------------------------------
-- Drop Trigger (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_APP_ROLE_BI';
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

CREATE OR REPLACE TRIGGER TRG_APP_ROLE_BI
BEFORE INSERT
ON APP_ROLE
FOR EACH ROW
BEGIN
    IF :NEW.APP_ROLE_ID IS NULL THEN

        SELECT SEQ_APP_ROLE.NEXTVAL
        INTO :NEW.APP_ROLE_ID
        FROM DUAL;

    END IF;
END;
/

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT APP_ROLE trigger created successfully.
PROMPT ===========================================