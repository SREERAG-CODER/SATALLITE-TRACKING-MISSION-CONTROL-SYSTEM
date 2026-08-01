/*
=========================================================
Project       : Satellite Mission Control System
Module        : System Configuration
Object        : SYSTEM_CONFIGURATION Triggers
File          : 113_SYSTEM_CONFIGURATION_TRIGGER.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 25-JUL-2026
=========================================================
Description:
Automatically generates Configuration IDs and
maintains audit timestamps.
=========================================================
*/

---------------------------------------------------------
-- Drop Before Insert Trigger
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_SYSTEM_CONFIGURATION_BI';
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

CREATE OR REPLACE TRIGGER TRG_SYSTEM_CONFIGURATION_BI
BEFORE INSERT
ON SYSTEM_CONFIGURATION
FOR EACH ROW
BEGIN

    IF :NEW.CONFIG_ID IS NULL THEN
        SELECT SEQ_SYSTEM_CONFIGURATION.NEXTVAL
        INTO :NEW.CONFIG_ID
        FROM DUAL;
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
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_SYSTEM_CONFIGURATION_BU';
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

CREATE OR REPLACE TRIGGER TRG_SYSTEM_CONFIGURATION_BU
BEFORE UPDATE
ON SYSTEM_CONFIGURATION
FOR EACH ROW
BEGIN

    :NEW.UPDATED_AT := CURRENT_TIMESTAMP;

END;
/
SHOW ERRORS;

PROMPT ===========================================
PROMPT SYSTEM_CONFIGURATION triggers created successfully.
PROMPT ===========================================