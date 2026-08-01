/*
=========================================================
Project       : Satellite Mission Control System
Module        : Report Management
Object        : REPORT Triggers
File          : 129_REPORT_TRIGGER.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Automatically generates Report IDs and maintains
audit timestamps.
=========================================================
*/

---------------------------------------------------------
-- Drop Before Insert Trigger
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_REPORT_BI';
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

CREATE OR REPLACE TRIGGER TRG_REPORT_BI
BEFORE INSERT
ON REPORT
FOR EACH ROW
BEGIN

    IF :NEW.REPORT_ID IS NULL THEN
        SELECT SEQ_REPORT.NEXTVAL
        INTO :NEW.REPORT_ID
        FROM DUAL;
    END IF;

    IF :NEW.GENERATED_TIME IS NULL THEN
        :NEW.GENERATED_TIME := CURRENT_TIMESTAMP;
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
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_REPORT_BU';
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

CREATE OR REPLACE TRIGGER TRG_REPORT_BU
BEFORE UPDATE
ON REPORT
FOR EACH ROW
BEGIN

    :NEW.UPDATED_AT := CURRENT_TIMESTAMP;

END;
/
SHOW ERRORS;

PROMPT ===========================================
PROMPT REPORT triggers created successfully.
PROMPT ===========================================