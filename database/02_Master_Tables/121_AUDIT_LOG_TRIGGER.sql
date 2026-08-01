/*
=========================================================
Project       : Satellite Mission Control System
Module        : Audit Log
Object        : AUDIT_LOG Triggers
File          : 121_AUDIT_LOG_TRIGGER.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Automatically generates Audit IDs and maintains
audit timestamps.
=========================================================
*/

---------------------------------------------------------
-- Drop Before Insert Trigger
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_AUDIT_LOG_BI';
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

CREATE OR REPLACE TRIGGER TRG_AUDIT_LOG_BI
BEFORE INSERT
ON AUDIT_LOG
FOR EACH ROW
BEGIN

    IF :NEW.AUDIT_ID IS NULL THEN
        SELECT SEQ_AUDIT_LOG.NEXTVAL
        INTO :NEW.AUDIT_ID
        FROM DUAL;
    END IF;

    IF :NEW.EVENT_TIME IS NULL THEN
        :NEW.EVENT_TIME := CURRENT_TIMESTAMP;
    END IF;

    IF :NEW.CREATED_AT IS NULL THEN
        :NEW.CREATED_AT := CURRENT_TIMESTAMP;
    END IF;

END;
/
SHOW ERRORS;

---------------------------------------------------------
-- Drop Before Update Trigger
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_AUDIT_LOG_BU';
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

CREATE OR REPLACE TRIGGER TRG_AUDIT_LOG_BU
BEFORE UPDATE
ON AUDIT_LOG
FOR EACH ROW
BEGIN

    :NEW.UPDATED_AT := CURRENT_TIMESTAMP;

END;
/
SHOW ERRORS;

PROMPT ===========================================
PROMPT AUDIT_LOG triggers created successfully.
PROMPT ===========================================