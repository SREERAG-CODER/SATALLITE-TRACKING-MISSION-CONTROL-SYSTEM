/*
=========================================================
Project       : Satellite Mission Control System
Module        : Notification
Object        : NOTIFICATION Triggers
File          : 105_NOTIFICATION_TRIGGER.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Triggers for automatic Notification ID generation
and audit column maintenance.
=========================================================
*/

---------------------------------------------------------
-- Drop Before Insert Trigger
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_NOTIFICATION_BI';
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

CREATE OR REPLACE TRIGGER TRG_NOTIFICATION_BI
BEFORE INSERT
ON NOTIFICATION
FOR EACH ROW
BEGIN

    IF :NEW.NOTIFICATION_ID IS NULL THEN
        SELECT SEQ_NOTIFICATION.NEXTVAL
        INTO :NEW.NOTIFICATION_ID
        FROM DUAL;
    END IF;

    IF :NEW.CREATED_TIME IS NULL THEN
        :NEW.CREATED_TIME := CURRENT_TIMESTAMP;
    END IF;

    IF :NEW.CREATED_AT IS NULL THEN
        :NEW.CREATED_AT := CURRENT_TIMESTAMP;
    END IF;

    IF :NEW.IS_READ IS NULL THEN
        :NEW.IS_READ := 'N';
    END IF;

END;
/
SHOW ERRORS;

---------------------------------------------------------
-- Drop Before Update Trigger
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_NOTIFICATION_BU';
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

CREATE OR REPLACE TRIGGER TRG_NOTIFICATION_BU
BEFORE UPDATE
ON NOTIFICATION
FOR EACH ROW
BEGIN

    :NEW.UPDATED_AT := CURRENT_TIMESTAMP;

    -----------------------------------------------------
    -- Automatically set READ_TIME
    -----------------------------------------------------

    IF :NEW.IS_READ = 'Y'
       AND :OLD.IS_READ = 'N'
       AND :NEW.READ_TIME IS NULL
    THEN
        :NEW.READ_TIME := CURRENT_TIMESTAMP;
    END IF;

END;
/
SHOW ERRORS;

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT NOTIFICATION triggers created successfully.
PROMPT ===========================================