/*
=========================================================
Project       : Satellite Mission Control System
Module        : Mission Operations
Object        : COMMAND
File          : 91_COMMAND_AUDIT_STATUS_TRIGGER.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 24-JUL-2026
=========================================================
Description:
Automatically records command status
transitions in the COMMAND_HISTORY table.
A history record is created only when
the command status changes.
=========================================================
*/

---------------------------------------------------------
-- Drop Trigger (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_COMMAND_AUDIT_STATUS';
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

CREATE OR REPLACE TRIGGER TRG_COMMAND_AUDIT_STATUS
AFTER UPDATE OF STATUS
ON COMMAND
FOR EACH ROW
DECLARE

    V_OLD_STATUS_ID   SYSTEM_STATUS.STATUS_ID%TYPE;
    V_NEW_STATUS_ID   SYSTEM_STATUS.STATUS_ID%TYPE;

BEGIN

    -----------------------------------------------------
    -- Ignore if Status Did Not Change
    -----------------------------------------------------

    IF NVL(:OLD.STATUS, '##NULL##') = NVL(:NEW.STATUS, '##NULL##') THEN
        RETURN;
    END IF;

    -----------------------------------------------------
    -- Lookup Old Status ID
    -----------------------------------------------------

    BEGIN
        SELECT STATUS_ID
        INTO V_OLD_STATUS_ID
        FROM SYSTEM_STATUS
        WHERE STATUS_CODE = :OLD.STATUS;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            V_OLD_STATUS_ID := NULL;
    END;

    -----------------------------------------------------
    -- Lookup New Status ID
    -----------------------------------------------------

    SELECT STATUS_ID
    INTO V_NEW_STATUS_ID
    FROM SYSTEM_STATUS
    WHERE STATUS_CODE = :NEW.STATUS;

    -----------------------------------------------------
    -- Insert Audit Record
    -----------------------------------------------------

    INSERT INTO COMMAND_HISTORY
    (
        COMMAND_ID,
        OLD_STATUS_ID,
        NEW_STATUS_ID,
        CHANGED_AT,
        CHANGED_BY,
        CREATED_AT,
        UPDATED_BY
    )
    VALUES
    (
        :NEW.COMMAND_ID,
        V_OLD_STATUS_ID,
        V_NEW_STATUS_ID,
        CURRENT_TIMESTAMP,
        :NEW.UPDATED_BY,
        CURRENT_TIMESTAMP,
        :NEW.UPDATED_BY
    );

END;
/

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT COMMAND status audit trigger created successfully.
PROMPT ===========================================