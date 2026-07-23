/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : DEPARTMENT
File          : 03_DEPARTMENT_TRIGGER.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Automatically generates the Department ID using
SEQ_DEPARTMENT before inserting a new record.
=========================================================
*/

---------------------------------------------------------
-- Drop Trigger (Development Only)
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER TRG_DEPARTMENT_BI';
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

CREATE OR REPLACE TRIGGER TRG_DEPARTMENT_BI
BEFORE INSERT  --The trigger executes before Oracle inserts a row.
ON DEPARTMENT  
FOR EACH ROW   --The trigger runs once for every row being inserted
BEGIN
    IF :NEW.DEPARTMENT_ID IS NULL THEN

        SELECT SEQ_DEPARTMENT.NEXTVAL
        INTO :NEW.DEPARTMENT_ID
        FROM DUAL;

    END IF;
END;
/

---------------------------------------------------------
-- Completion Message
---------------------------------------------------------

PROMPT ===========================================
PROMPT DEPARTMENT trigger created successfully.
PROMPT ===========================================