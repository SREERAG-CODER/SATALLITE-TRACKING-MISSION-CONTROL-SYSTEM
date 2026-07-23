/*
=========================================================
Project       : Satellite Mission Control System
Module        : Master Tables
Object        : DEPARTMENT
File          : 02_DEPARTMENT_SEQUENCE.sql
Author        : Sreerag T C
Database      : Oracle XE 11g
Version       : 1.0.0
Created On    : 23-JUL-2026
=========================================================
Description:
Creates a sequence to generate unique Department IDs.
=========================================================
*/

---------------------------------------------------------
-- Drop sequence (Development Only) : if the sequence already exists, it gets dropped; if it doesn't exist (ORA-02289), the script continues
---------------------------------------------------------

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_DEPARTMENT';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN
            RAISE;
        END IF;
END;
/

---------------------------------------------------------
-- Create Sequence
---------------------------------------------------------

CREATE SEQUENCE SEQ_DEPARTMENT
START WITH 1
INCREMENT BY 1  --Every new department increases the ID by one.
MINVALUE 1
NOMAXVALUE      --Oracle automatically allows the sequence to continue until the maximum value supported by the data type
NOCACHE         --NOCACHE ensures IDs are generated one at a time and avoids gaps caused by cached values if the database shuts down unexpectedly
NOCYCLE;        --Once the maximum value is reached, the sequence will not restart from 1

----------------------------------------------------------
-- Completion Message
----------------------------------------------------------

PROMPT ===========================================
PROMPT DEPARTMENT sequence created successfully.
PROMPT ===========================================