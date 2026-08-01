/*
=========================================================
Project       : Satellite Mission Control System
Module        : Security
Object        : USER_SESSION Triggers
File          : 97_USER_SESSION_TRIGGER.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Triggers for automatic USER_SESSION ID generation
and audit column maintenance.
=========================================================
*/

---------------------------------------------------------
-- Drop Trigger : Primary Key
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_USER_SESSION_BI';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -4080 THEN
            RAISE;
        END IF;
END;
/

---------------------------------------------------------
-- Before Insert Trigger
---------------------------------------------------------

CREATE OR REPLACE TRIGGER TRG_USER_SESSION_BI
BEFORE INSERT
ON USER_SESSION
FOR EACH ROW
BEGIN

    IF :NEW.SESSION_ID IS NULL THEN
        SELECT SEQ_USER_SESSION.NEXTVAL
        INTO :NEW.SESSION_ID
        FROM DUAL;
    END IF;

    IF :NEW.CREATED_AT IS NULL THEN
        :NEW.CREATED_AT := CURRENT_TIMESTAMP;
    END IF;

    IF :NEW.LOGIN_TIME IS NULL THEN
        :NEW.LOGIN_TIME := CURRENT_TIMESTAMP;
    END IF;

    IF :NEW.LAST_ACTIVITY_TIME IS NULL THEN
        :NEW.LAST_ACTIVITY_TIME := CURRENT_TIMESTAMP;
    END IF;

END;
/
SHOW ERRORS;

---------------------------------------------------------
-- Drop Trigger : Audit Update
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_USER_SESSION_BU';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -4080 THEN
            RAISE;
        END IF;
END;
/

---------------------------------------------------------
-- Before Update Trigger
---------------------------------------------------------

CREATE OR REPLACE TRIGGER TRG_USER_SESSION_BU
BEFORE UPDATE
ON USER_SESSION
FOR EACH ROW
BEGIN

    :NEW.UPDATED_AT := CURRENT_TIMESTAMP;

    :NEW.LAST_ACTIVITY_TIME := CURRENT_TIMESTAMP;

END;
/
SHOW ERRORS;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT USER_SESSION triggers created successfully.
PROMPT ===========================================